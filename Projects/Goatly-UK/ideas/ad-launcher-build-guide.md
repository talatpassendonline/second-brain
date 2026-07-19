# Build Guide — In-House Meta Ad Launcher

A complete, self-contained spec for building a **bulk Meta (Facebook/Instagram) ad launcher** inside a Next.js app. It lets you upload creatives into a library, build ads spreadsheet-style, create campaigns/ad sets, and **launch ads directly to Meta** using your own Meta app token (no third-party SaaS holding your ad-account access).

> **Read this top to bottom before writing code.** It is ordered as a build sequence. Everything here is generic — swap in your own tenant model, storage bucket, and design tokens. Code blocks are production-tested; keep the non-obvious bits (token lifecycle, `object_story_spec`, enhancement `enroll_status`, video polling) exactly as written — those are where Meta's API bites.

---

## 0. What you are building

A standalone section of an existing app with its own sidebar/shell. Core capabilities:

1. **Connect a Meta ad account** via OAuth (or a pasted long-lived / system-user token). Tokens are encrypted at rest.
2. **Creative library** — upload images/videos to object storage (S3-compatible), auto-organize images into folders with an AI vision pass.
3. **Launch Studio** — the heart: pick creatives → set shared copy/targeting/CTA → pick an existing ad set → **launch N ads at once** to Meta. Save drafts, view launched ads.
4. **Campaign + Ad Set builders** — create campaigns and ad sets (targeting, budget, bid strategy, conversion pixel) from the UI.
5. **Reusable config** — ad-naming convention builder, default ad copy, copy templates, Advantage+ creative-enhancement toggles, placement config.

**Scoping model:** everything is scoped to an **ad account**. An ad account belongs to a **tenant** (organization/brand/workspace — whatever your app uses). Adapt the role checks to your own auth. In this guide: **ADMIN** launches ads and creates campaigns; **EDITOR** may upload creatives and edit copy/settings but not launch.

---

## 1. Stack assumptions

- **Next.js (App Router)** — API = Route Handlers under `src/app/api/**/route.ts`. No `pages/` router.
- **React 19 + Tailwind + shadcn/Radix** primitives for UI.
- **Prisma + Postgres** (any SQL DB works).
- **NextAuth** (or any session provider) — you need `auth()` returning `session.user.id`.
- **SWR** for client data fetching, **Zod** for validating every API input.
- **S3-compatible object storage** (Cloudflare R2 used here; AWS S3 identical).
- **`@anthropic-ai/sdk`** (optional) for the AI creative-triage feature.
- **`sharp`** (image conversion) and **`@aws-sdk/client-s3` + `@aws-sdk/s3-request-presigner`**.

Install:

```bash
npm i @aws-sdk/client-s3 @aws-sdk/s3-request-presigner sharp zod swr
npm i @anthropic-ai/sdk   # only if you want AI creative triage
```

---

## 2. Meta setup (do this first — nothing works without it)

You need a Meta app with the Marketing API and the right permissions, plus a Page, an ad account, and (for conversion ads) a Pixel.

### 2.1 Create the Meta app

1. Go to **developers.facebook.com** → **My Apps** → **Create App**.
2. Choose use case **"Other"** → app type **"Business"**. (Business type is required for the Marketing API.)
3. Give it a name, attach it to a **Meta Business Portfolio** (Business Manager). Create one if you don't have it (business.facebook.com).
4. In the app dashboard, note **App ID** and **App Secret** (Settings → Basic). The secret is your `META_APP_SECRET`.

### 2.2 Add products

In the app dashboard → **Add Product**:

- **Marketing API** — enables `/adaccounts`, `/campaigns`, `/adsets`, `/ads`, `/adcreatives`, `/adimages`, `/advideos`.
- **Facebook Login** (or "Facebook Login for Business") — enables the OAuth flow.

### 2.3 Configure OAuth redirect

Facebook Login → **Settings**:

- **Valid OAuth Redirect URIs**: add your callback exactly, e.g.
  `https://yourapp.com/api/integrations/meta/callback`
  and for local dev `https://localhost:3000/api/integrations/meta/callback` (Meta requires HTTPS; use a tunnel like ngrok/cloudflared for local OAuth, or use the pasted-token path in §7.4 during development).
- This must **byte-for-byte match** `META_REDIRECT_URI` in your env.

App Settings → **Basic**:

- **App Domains**: `yourapp.com`
- **Privacy Policy URL** and **Terms URL** (required to leave dev mode).

### 2.4 Permissions (scopes)

The OAuth request asks for:

```
ads_read, ads_management, business_management, pages_show_list, pages_read_engagement
```

- `ads_management` is the one that lets you **create** ads/campaigns/creatives (write). Without it every write returns a permissions error.
- **Dev mode / Standard Access:** while your app is in development, these scopes work **for users with a role on the app** (you, as admin/developer) against **ad accounts you own**. That is enough to build and test the whole tool for your own accounts.
- **Production / other people's accounts:** to manage ad accounts owned by clients/other users you need **Advanced Access** for `ads_management` + `business_management`, which requires **App Review** and **Business Verification**. Budget time for this if you're going multi-tenant.

### 2.5 Token strategy — pick one

Meta user tokens are short-lived (≈1h) → exchange to long-lived (≈60 days) → refresh before expiry. Two options:

- **Option A — OAuth user token (this guide's default).** User connects via OAuth; you exchange code → short-lived → long-lived (60d) and **auto-renew** within a 10-day window by re-exchanging the still-valid long-lived token. See §6.3. Good for multi-user/multi-tenant.
- **Option B — System User token (simplest for a single internal tool).** In **Business Settings → Users → System Users**, create a system user, assign it the ad account + Page as assets, generate a token with `ads_management`, `ads_read`, `business_management`, `pages_show_list`, `pages_read_engagement`. **System-user tokens can be set to never expire.** Paste it via the token path (§7.4). The token lifecycle code treats a `null` expiry as "never renew" and just works.

### 2.6 Gather the IDs you'll need at launch time

- **Ad account id** — looks like `act_1234567890`. Discovered automatically via `/me/adaccounts`.
- **Facebook Page id** — the identity the ad runs under. Discovered via `/me/accounts`.
- **Instagram account id** — optional; if none, the code creates a **Page-Backed Instagram Account** so ads can run on IG using the Page's identity.
- **Pixel id** — required for conversion (`OUTCOME_SALES`) campaigns. Discovered via `/{adAccount}/adspixels`.

### 2.7 Graph API version

Pin a version so nothing shifts under you. This guide uses **`v21.0`**. Base URL: `https://graph.facebook.com/v21.0`.

---

## 3. Environment variables

```bash
# Meta app
META_APP_ID=your_app_id
META_APP_SECRET=your_app_secret
META_REDIRECT_URI=https://yourapp.com/api/integrations/meta/callback

# Token encryption at rest (AES-256-GCM). 64 hex chars = 32 bytes. Generate:
#   node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
ENCRYPTION_KEY=64_hex_chars_here

# S3 / R2 object storage for creatives
R2_ACCOUNT_ID=...
R2_ACCESS_KEY_ID=...
R2_SECRET_ACCESS_KEY=...
R2_BUCKET=...
R2_PUBLIC_URL=https://cdn.yourapp.com     # public base URL for objects
NEXT_PUBLIC_R2_PUBLIC_URL=https://cdn.yourapp.com   # same value, exposed to client

# Optional: AI creative triage
ANTHROPIC_API_KEY=...

# Session base (NextAuth)
NEXTAUTH_URL=https://yourapp.com
```

> **Storage CORS:** the browser uploads creative bytes **directly** to the bucket via a presigned PUT. Configure CORS on the bucket to allow `PUT` from your app origin, otherwise uploads fail in the browser.

---

## 4. Data model (Prisma)

Add these models. `AdAccount` is the anchor; if you already have an ad-account/integration model, extend it. Adapt `tenantId` to your tenancy field (brand/workspace/org).

```prisma
model AdAccount {
  id           String    @id @default(cuid())
  platform     String    // "META"
  accountId    String    // Meta id, e.g. "act_123"
  accountName  String
  accessToken  String    // AES-256-GCM encrypted; or literal "manual" = disconnected
  tokenExpiry  DateTime? // null = never expires (system-user token)
  tenantId     String    // your org/brand/workspace id
  createdAt    DateTime  @default(now())
  updatedAt    DateTime  @updatedAt

  launcherCreatives LauncherCreative[]
  launcherBoards    LauncherBoard[]
  adCopyTemplates   AdCopyTemplate[]
  launcherSettings  AdLauncherSettings?
  launchDrafts      LaunchDraft[]
  launchedAds       LaunchedAd[]

  @@unique([platform, accountId])
  @@index([tenantId])
}

// Staging row for the OAuth flow: holds the encrypted token + discovered
// accounts between the callback and the user's account-selection step.
model MetaPendingAuth {
  id           String   @id @default(cuid())
  accessToken  String   // encrypted long-lived token (or "pending" placeholder)
  tokenExpiry  DateTime?
  accountsJson String   // JSON string of [{id,name,account_status}]
  tenantId     String
  oauthNonce   String?  // CSRF nonce set by /connect, checked by /callback
  createdAt    DateTime @default(now())
}

model LauncherBoard {
  id        String   @id @default(cuid())
  name      String
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt

  adAccountId String
  adAccount   AdAccount @relation(fields: [adAccountId], references: [id], onDelete: Cascade)
  creatives   LauncherCreative[]

  @@index([adAccountId])
}

model LauncherCreative {
  id         String  @id @default(cuid())
  name       String
  mediaType  String  // "IMAGE" | "VIDEO"
  storageKey String  // object-storage key (store the KEY, not a full URL)
  url        String  // public/CDN URL
  width      Int?
  height     Int?
  sizeBytes  Int?
  extension  String?
  source     String  @default("UPLOAD") // UPLOAD | GDRIVE | FRAMEIO | DROPBOX | EXISTING_AD | ORGANIC_POST
  metaImageHash String?   // populated once pushed to Meta
  metaVideoId   String?
  tags          String?   // comma-separated (v1)
  aiDescription String?    // one-line AI summary (image triage)
  aiTriagedAt   DateTime?  // set when AI filed it into a board
  launchStatus  String  @default("NOT_LAUNCHED") // NOT_LAUNCHED | LAUNCHED
  uploadedById  String?
  createdAt     DateTime @default(now())
  updatedAt     DateTime @updatedAt

  adAccountId String
  adAccount   AdAccount @relation(fields: [adAccountId], references: [id], onDelete: Cascade)
  boardId     String?
  board       LauncherBoard? @relation(fields: [boardId], references: [id], onDelete: SetNull)
  launchedAds LaunchedAd[]

  @@index([adAccountId])
  @@index([boardId])
}

model AdCopyTemplate {
  id                  String   @id @default(cuid())
  name                String
  primaryTexts        Json     @default("[]") // string[]
  headlines           Json     @default("[]") // string[]
  description         String?
  cta                 String?
  webLink             String?
  displayLink         String?
  customProductPageId String?
  utmParameters       String?
  facebookPageId      String?
  instagramAccountId  String?
  adSetId             String?
  productSetId        String?
  createdAt           DateTime @default(now())
  updatedAt           DateTime @updatedAt

  adAccountId String
  adAccount   AdAccount @relation(fields: [adAccountId], references: [id], onDelete: Cascade)
  @@index([adAccountId])
}

model AdLauncherSettings {
  id                   String   @id @default(cuid())
  facebookPageId       String?
  instagramAccountId   String?
  trackingEnabled      Boolean  @default(true)
  pixelId              String?
  appId                String?
  namingConvention     Json?    // ordered naming tokens
  separator            String   @default("_")
  creativeEnhancements Json     @default("{}") // per-format Advantage+ toggle map; {} = all OFF
  placements           Json?    // { mode: "AUTOMATIC"|"MANUAL", platforms: string[] }
  multiAdvertiser      Boolean  @default(false)
  launchAsPaused       Boolean  @default(false)
  defaultAdCopy        Json?    // { primaryText, headline, description, link, displayLink, cta, utmParameters }
  adSetDefaults        Json?    // { objective, conversionEvent, pixelId, countries[], ageMin, ageMax, gender, budgetLevel, dailyBudget, advantageAudience }
  createdAt            DateTime @default(now())
  updatedAt            DateTime @updatedAt

  adAccountId String    @unique
  adAccount   AdAccount @relation(fields: [adAccountId], references: [id], onDelete: Cascade)
}

model LaunchDraft {
  id          String   @id @default(cuid())
  name        String?
  payload     Json     // serialized grid rows
  createdById String?
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt

  adAccountId String
  adAccount   AdAccount @relation(fields: [adAccountId], references: [id], onDelete: Cascade)
  @@index([adAccountId])
}

model LaunchedAd {
  id             String   @id @default(cuid())
  metaAdId       String?
  metaCreativeId String?
  adName         String
  adSetId        String?
  adSetName      String?
  status         String   @default("PAUSED")
  launchStatus   String   @default("LAUNCHED") // LAUNCHED | FAILED
  errorMessage   String?
  launchedById   String?
  launchedAt     DateTime @default(now())

  adAccountId String
  adAccount   AdAccount @relation(fields: [adAccountId], references: [id], onDelete: Cascade)
  creativeId  String?
  creative    LauncherCreative? @relation(fields: [creativeId], references: [id], onDelete: SetNull)

  @@index([adAccountId])
  @@index([metaAdId])
}
```

Run your migration.

---

## 5. Core libraries

Create these under `src/lib/`. They are the backbone — build and unit-test them before any UI.

### 5.1 `src/lib/encryption.ts` — token encryption at rest

```ts
import { createCipheriv, createDecipheriv, createHash, randomBytes } from "crypto";

function getKey(): Buffer {
  const key = process.env.ENCRYPTION_KEY;
  if (!key) throw new Error("ENCRYPTION_KEY is not set");
  if (key.length === 64) return Buffer.from(key, "hex");
  if (key.length === 44) return Buffer.from(key, "base64");
  return createHash("sha256").update(key).digest();
}

// Stored format: "ivHex:ciphertextHex:authTagHex"
export function encrypt(plaintext: string): string {
  const key = getKey();
  const iv = randomBytes(12);
  const cipher = createCipheriv("aes-256-gcm", key, iv);
  let enc = cipher.update(plaintext, "utf8", "hex");
  enc += cipher.final("hex");
  return `${iv.toString("hex")}:${enc}:${cipher.getAuthTag().toString("hex")}`;
}

export function decrypt(text: string): string {
  const parts = text.split(":");
  if (parts.length !== 3) return text; // plaintext / "manual" sentinel pass-through
  const [ivHex, ciphertext, tagHex] = parts;
  const iv = Buffer.from(ivHex, "hex");
  const tag = Buffer.from(tagHex, "hex");
  if (iv.length !== 12 || tag.length !== 16) return text;
  const decipher = createDecipheriv("aes-256-gcm", getKey(), iv);
  decipher.setAuthTag(tag);
  let dec = decipher.update(ciphertext, "hex", "utf8");
  dec += decipher.final("utf8");
  return dec;
}
```

Why the pass-through: legacy plaintext tokens and the `"manual"` disconnected sentinel must survive `decrypt()` unchanged.

### 5.2 `src/lib/meta-ads.ts` — read layer + OAuth helpers

```ts
export const META_API_VERSION = "v21.0";
export const META_GRAPH_URL = `https://graph.facebook.com/${META_API_VERSION}`;

export class MetaApiError extends Error {
  code?: number;
  constructor(message: string, code?: number) { super(message); this.name = "MetaApiError"; this.code = code; }
}

const RATE_LIMIT_CODES = new Set([4, 17, 32, 613]);
export function isMetaRateLimitError(err: unknown): boolean {
  if (err instanceof MetaApiError && err.code !== undefined) return RATE_LIMIT_CODES.has(err.code);
  const msg = err instanceof Error ? err.message : String(err);
  return /request limit reached|too many calls|rate limit/i.test(msg);
}

async function paginatedFetch<T>(initialUrl: string, label: string): Promise<T[]> {
  const out: T[] = [];
  let next: string | undefined = initialUrl;
  while (next) {
    const res = await fetch(next);
    const json: any = await res.json();
    if (json.error) throw new MetaApiError(`${label}: ${json.error.message}`, json.error.code);
    if (json.data) out.push(...json.data);
    next = json.paging?.next;
  }
  return out;
}

// ---- OAuth ----
export function buildMetaOAuthUrl(tenantId: string): { url: string; nonce: string } {
  const nonce = crypto.randomUUID();
  const state = Buffer.from(JSON.stringify({ tenantId, nonce })).toString("base64url");
  const params = new URLSearchParams({
    client_id: process.env.META_APP_ID!,
    redirect_uri: process.env.META_REDIRECT_URI!,
    scope: "ads_read,ads_management,business_management,pages_show_list,pages_read_engagement",
    response_type: "code",
    auth_type: "rerequest", // force re-consent so newly-added scopes aren't silently skipped
    state,
  });
  return { url: `https://www.facebook.com/${META_API_VERSION}/dialog/oauth?${params}`, nonce };
}

export async function exchangeCodeForToken(code: string) {
  const params = new URLSearchParams({
    client_id: process.env.META_APP_ID!, client_secret: process.env.META_APP_SECRET!,
    redirect_uri: process.env.META_REDIRECT_URI!, code,
  });
  const res = await fetch(`${META_GRAPH_URL}/oauth/access_token?${params}`);
  const data = await res.json();
  if (data.error) throw new Error(`Meta token exchange failed: ${data.error.message}`);
  return data as { access_token: string; token_type: string; expires_in: number };
}

export async function exchangeForLongLivedToken(shortLived: string) {
  const params = new URLSearchParams({
    grant_type: "fb_exchange_token", client_id: process.env.META_APP_ID!,
    client_secret: process.env.META_APP_SECRET!, fb_exchange_token: shortLived,
  });
  const res = await fetch(`${META_GRAPH_URL}/oauth/access_token?${params}`);
  const data = await res.json();
  if (data.error) throw new Error(`Meta long-lived exchange failed: ${data.error.message}`);
  return data as { access_token: string; token_type: string; expires_in: number };
}

// ---- Reads used by the launcher ----
export interface MetaAdAccount { id: string; name: string; account_status: number; }
export async function fetchAdAccounts(token: string) {
  return paginatedFetch<MetaAdAccount>(
    `${META_GRAPH_URL}/me/adaccounts?fields=id,name,account_status&limit=100&access_token=${token}`,
    "fetchAdAccounts");
}
```

You'll also fetch pages/pixels/campaigns/ad sets — those are simple Graph GETs shown in §7.

### 5.3 `src/lib/meta-token.ts` — token lifecycle

```ts
import type { AdAccount } from "@prisma/client";
import { prisma } from "@/lib/prisma";
import { decrypt, encrypt } from "@/lib/encryption";
import { exchangeForLongLivedToken } from "@/lib/meta-ads";

const RENEW_WINDOW_MS = 10 * 24 * 60 * 60 * 1000; // renew if <10 days to expiry

export interface FreshToken { token: string; expiry: Date | null; renewed: boolean; expired: boolean; }

async function persistRenewedToken(id: string, newToken: string, expiresInSec: number) {
  const tokenExpiry = expiresInSec > 0 ? new Date(Date.now() + expiresInSec * 1000) : null;
  await prisma.adAccount.update({ where: { id }, data: { accessToken: encrypt(newToken), tokenExpiry } });
  return tokenExpiry;
}

export async function ensureFreshMetaToken(account: AdAccount): Promise<FreshToken> {
  const token = decrypt(account.accessToken);
  if (token === "manual") return { token, expiry: account.tokenExpiry, renewed: false, expired: false };

  const now = Date.now();
  const expiryMs = account.tokenExpiry ? account.tokenExpiry.getTime() : null;
  if (expiryMs !== null && expiryMs <= now)
    return { token, expiry: account.tokenExpiry, renewed: false, expired: true }; // reconnect needed
  const needsRenewal = expiryMs !== null && expiryMs - now < RENEW_WINDOW_MS;
  if (!needsRenewal) return { token, expiry: account.tokenExpiry, renewed: false, expired: false };

  try {
    const longLived = await exchangeForLongLivedToken(token);
    const expiry = await persistRenewedToken(account.id, longLived.access_token, longLived.expires_in);
    return { token: longLived.access_token, expiry, renewed: true, expired: false };
  } catch {
    return { token, expiry: account.tokenExpiry, renewed: false, expired: false }; // swallow; retry next call
  }
}
```

Semantics every caller relies on: `token === "manual"` → disconnected; `expired: true` → OAuth token lapsed, user must reconnect; `null` expiry → system-user token, never renews.

### 5.4 `src/lib/meta-ads-write.ts` — the write layer (**most important file**)

This is the whole reason the tool exists. Keep the error classification, retry/backoff, `adimages` multipart quirks, video polling, and `contextual_multi_ads`/`enroll_status` details exactly.

```ts
import { META_GRAPH_URL } from "./meta-ads";

export class MetaWriteError extends Error {
  code?: number; subcode?: number; fbtraceId?: string; isTransient: boolean;
  constructor(message: string, opts: { code?: number; subcode?: number; fbtraceId?: string; isTransient?: boolean } = {}) {
    super(message); this.name = "MetaWriteError";
    this.code = opts.code; this.subcode = opts.subcode; this.fbtraceId = opts.fbtraceId;
    this.isTransient = opts.isTransient ?? false;
  }
}

const RATE_LIMIT_CODES = new Set([4, 17, 32, 613, 80000, 80004]);

function classifyMetaError(httpStatus: number, error: unknown): MetaWriteError {
  const e = (error ?? {}) as any;
  const code = e.code;
  const isTransient = httpStatus === 429 || httpStatus >= 500 || (code !== undefined && RATE_LIMIT_CODES.has(code));
  // Meta's `message` is usually the useless "Invalid parameter"; the real reason
  // lives in error_user_title / error_user_msg — surface those.
  const base = e.error_user_msg
    ? (e.error_user_title ? `${e.error_user_title}: ${e.error_user_msg}` : e.error_user_msg)
    : e.message || `Meta request failed (HTTP ${httpStatus})`;
  const suffix = code !== undefined ? ` (code ${code}${e.error_subcode ? `/${e.error_subcode}` : ""})` : "";
  return new MetaWriteError(base + suffix, { code, subcode: e.error_subcode, fbtraceId: e.fbtrace_id, isTransient });
}

const sleep = (ms: number) => new Promise((r) => setTimeout(r, ms));

async function withRetry<T>(fn: () => Promise<T>, retries = 3): Promise<T> {
  let attempt = 0;
  for (;;) {
    try { return await fn(); }
    catch (err) {
      const transient = err instanceof MetaWriteError && err.isTransient;
      if (!transient || attempt >= retries) throw err;
      await sleep(1000 * 2 ** attempt); // 1s, 2s, 4s
      attempt++;
    }
  }
}

// Form-encoded POST; object/array values are JSON-stringified (Meta wants nested specs as JSON strings).
async function metaPost<T>(path: string, params: Record<string, unknown>, accessToken: string): Promise<T> {
  const body = new URLSearchParams();
  for (const [k, v] of Object.entries(params)) {
    if (v === undefined || v === null) continue;
    body.set(k, typeof v === "object" ? JSON.stringify(v) : String(v));
  }
  body.set("access_token", accessToken);
  return withRetry(async () => {
    const res = await fetch(`${META_GRAPH_URL}/${path}`, {
      method: "POST", headers: { "Content-Type": "application/x-www-form-urlencoded" }, body,
    });
    const json = await res.json().catch(() => ({}));
    if (!res.ok || (json as any).error) throw classifyMetaError(res.status, (json as any).error);
    return json as T;
  });
}

// ---- Media: images ----
export interface UploadedImage { hash: string; url: string; }
export async function uploadAdImage(opts: { adAccountId: string; accessToken: string; imageUrl: string; filename: string; }): Promise<UploadedImage> {
  const { adAccountId, accessToken, imageUrl, filename } = opts;
  return withRetry(async () => {
    const imgRes = await fetch(imageUrl);
    if (!imgRes.ok) throw new MetaWriteError(`Failed to fetch image from ${imageUrl}`, { isTransient: imgRes.status >= 500 });
    let buffer = Buffer.from(await imgRes.arrayBuffer());
    let contentType = imgRes.headers.get("content-type")?.split(";")[0] || "image/jpeg";

    // Meta needs a real content-type + extension or even a valid JPG fails with
    // FileTypeNotSupported (100/1487411). It accepts JPG/PNG/GIF/BMP/TIFF — convert anything else to PNG.
    const extByType: Record<string, string> = {
      "image/jpeg": "jpg", "image/jpg": "jpg", "image/png": "png", "image/gif": "gif", "image/bmp": "bmp", "image/tiff": "tiff",
    };
    if (!(contentType in extByType)) {
      try {
        const sharp = (await import("sharp")).default;
        buffer = await sharp(buffer).png().toBuffer();
        contentType = "image/png";
      } catch {
        throw new MetaWriteError(`Image format ${contentType} unsupported by Meta and could not be converted — re-export as JPG/PNG`);
      }
    }
    let cleanName = filename.split("?")[0].split("/").pop() || "image";
    const expectedExt = extByType[contentType];
    if (!new RegExp(`\\.${expectedExt === "jpg" ? "jpe?g" : expectedExt}$`, "i").test(cleanName))
      cleanName = `${cleanName.replace(/\.[a-z0-9]{2,5}$/i, "")}.${expectedExt}`;

    const form = new FormData();
    form.set("access_token", accessToken);
    form.set("filename", new File([new Uint8Array(buffer)], cleanName, { type: contentType }));
    const res = await fetch(`${META_GRAPH_URL}/${adAccountId}/adimages`, { method: "POST", body: form });
    const json = (await res.json().catch(() => ({}))) as any;
    if (!res.ok || json.error) throw classifyMetaError(res.status, json.error);
    const first = json.images && Object.values(json.images)[0] as any;
    if (!first?.hash) throw new MetaWriteError("Meta adimages returned no image hash");
    return { hash: first.hash, url: first.url };
  });
}

// ---- Media: videos (async processing) ----
export interface UploadedVideo { id: string; }
export async function uploadAdVideo(opts: { adAccountId: string; accessToken: string; fileUrl: string; name?: string; }): Promise<UploadedVideo> {
  // Hand Meta a URL it fetches itself (file_url). No byte-proxying.
  return metaPost<UploadedVideo>(`${opts.adAccountId}/advideos`, { file_url: opts.fileUrl, name: opts.name }, opts.accessToken);
}

export async function waitForVideoReady(opts: { videoId: string; accessToken: string; timeoutMs?: number; intervalMs?: number; }): Promise<void> {
  const { videoId, accessToken, timeoutMs = 5 * 60_000, intervalMs = 3000 } = opts;
  const deadline = Date.now() + timeoutMs;
  for (;;) {
    const res = await fetch(`${META_GRAPH_URL}/${videoId}?fields=status&access_token=${accessToken}`);
    const json = (await res.json().catch(() => ({}))) as any;
    if (!res.ok || json.error) throw classifyMetaError(res.status, json.error);
    const status = json.status?.video_status;
    if (status === "ready") return;
    if (status === "error") throw new MetaWriteError(`Video ${videoId} failed processing`);
    if (Date.now() >= deadline) throw new MetaWriteError(`Video ${videoId} not ready after ${Math.round(timeoutMs / 1000)}s (status: ${status})`);
    await sleep(intervalMs);
  }
}

export async function getVideoThumbnailUrl(opts: { videoId: string; accessToken: string; retries?: number; intervalMs?: number; }): Promise<string | null> {
  const { videoId, accessToken, retries = 5, intervalMs = 2000 } = opts;
  for (let attempt = 0; ; attempt++) {
    const res = await fetch(`${META_GRAPH_URL}/${videoId}/thumbnails?fields=uri,is_preferred&access_token=${accessToken}`);
    const json = (await res.json().catch(() => ({}))) as any;
    const thumbs = (json.data ?? []) as { uri?: string; is_preferred?: boolean }[];
    if (thumbs.length) { const pref = thumbs.find((t) => t.is_preferred) ?? thumbs[0]; if (pref?.uri) return pref.uri; }
    if (attempt >= retries) return null;
    await sleep(intervalMs);
  }
}

// ---- Page-Backed Instagram Account (run on IG using the Page identity) ----
export async function getOrCreatePageBackedInstagramId(opts: { pageId: string; accessToken: string; }): Promise<string> {
  const { pageId, accessToken } = opts;
  const listRes = await fetch(`${META_GRAPH_URL}/${pageId}/page_backed_instagram_accounts?access_token=${accessToken}`);
  const listJson = (await listRes.json().catch(() => ({}))) as any;
  if (listRes.ok && listJson.data?.[0]?.id) return listJson.data[0].id;
  const created = await metaPost<{ id: string }>(`${pageId}/page_backed_instagram_accounts`, {}, accessToken);
  return created.id;
}

// ---- Creatives & ads ----
export type ObjectStorySpec = Record<string, unknown>;

export async function createAdCreative(opts: {
  adAccountId: string; accessToken: string; name: string; objectStorySpec: ObjectStorySpec;
  degreesOfFreedomSpec?: Record<string, unknown>; urlTags?: string; multiAdvertiser?: boolean;
}): Promise<{ id: string }> {
  return metaPost<{ id: string }>(`${opts.adAccountId}/adcreatives`, {
    name: opts.name,
    object_story_spec: opts.objectStorySpec,
    degrees_of_freedom_spec: opts.degreesOfFreedomSpec,
    url_tags: opts.urlTags,
    // Meta defaults multi-advertiser ON; always send an explicit enroll status.
    contextual_multi_ads: { enroll_status: opts.multiAdvertiser ? "OPT_IN" : "OPT_OUT" },
  }, opts.accessToken);
}

export async function createAd(opts: {
  adAccountId: string; accessToken: string; name: string; adsetId: string; creativeId: string;
  status?: "ACTIVE" | "PAUSED";
}): Promise<{ id: string }> {
  return metaPost<{ id: string }>(`${opts.adAccountId}/ads`, {
    name: opts.name, adset_id: opts.adsetId, creative: { creative_id: opts.creativeId },
    status: opts.status ?? "PAUSED", // default PAUSED — never silently spend on first launch
  }, opts.accessToken);
}

// ---- Campaigns & ad sets ----
export type CampaignObjective = "OUTCOME_SALES" | "OUTCOME_TRAFFIC" | "OUTCOME_ENGAGEMENT" | "OUTCOME_AWARENESS" | "OUTCOME_LEADS";

export function optimizationGoalFor(objective: CampaignObjective): string {
  switch (objective) {
    case "OUTCOME_SALES": return "OFFSITE_CONVERSIONS";
    case "OUTCOME_TRAFFIC": return "LINK_CLICKS";
    case "OUTCOME_ENGAGEMENT": return "POST_ENGAGEMENT";
    case "OUTCOME_AWARENESS": return "REACH";
    case "OUTCOME_LEADS": return "LEAD_GENERATION";
  }
}

export async function createCampaign(opts: {
  adAccountId: string; accessToken: string; name: string; objective: CampaignObjective;
  status?: "ACTIVE" | "PAUSED"; dailyBudgetMajor?: number; specialAdCategories?: string[];
}): Promise<{ id: string }> {
  const params: Record<string, unknown> = {
    name: opts.name, objective: opts.objective, status: opts.status ?? "PAUSED",
    special_ad_categories: opts.specialAdCategories ?? [],
  };
  if (opts.dailyBudgetMajor && opts.dailyBudgetMajor > 0) {
    params.daily_budget = Math.round(opts.dailyBudgetMajor * 100); // minor units → enables CBO
    params.bid_strategy = "LOWEST_COST_WITHOUT_CAP";
  }
  return metaPost<{ id: string }>(`${opts.adAccountId}/campaigns`, params, opts.accessToken);
}

export interface AdSetTargeting {
  countries: string[]; ageMin?: number; ageMax?: number; genders?: number[]; // 1=male, 2=female
  customAudienceIds?: string[]; excludedCustomAudienceIds?: string[]; advantageAudience?: boolean;
}
export type PerformanceGoal = "MAXIMIZE_VALUE" | "MAXIMIZE_CONVERSIONS";

export async function createAdSet(opts: {
  adAccountId: string; accessToken: string; name: string; campaignId: string; objective: CampaignObjective;
  status?: "ACTIVE" | "PAUSED"; dailyBudgetMajor?: number; targeting: AdSetTargeting;
  pixelId?: string; customEventType?: string; performanceGoal?: PerformanceGoal;
  targetRoas?: number; costPerPurchaseCap?: number; publisherPlatforms?: string[];
}): Promise<{ id: string }> {
  const { targeting } = opts;
  const t: Record<string, unknown> = {
    geo_locations: { countries: targeting.countries },
    age_min: targeting.ageMin ?? 18, age_max: targeting.ageMax ?? 65,
  };
  if (opts.publisherPlatforms?.length) t.publisher_platforms = opts.publisherPlatforms;
  if (targeting.genders?.length) t.genders = targeting.genders;
  if (targeting.customAudienceIds?.length) t.custom_audiences = targeting.customAudienceIds.map((id) => ({ id }));
  if (targeting.excludedCustomAudienceIds?.length) t.excluded_custom_audiences = targeting.excludedCustomAudienceIds.map((id) => ({ id }));
  if (targeting.advantageAudience) t.targeting_automation = { advantage_audience: 1 };

  const isValueGoal = opts.objective === "OUTCOME_SALES" && opts.performanceGoal === "MAXIMIZE_VALUE";
  const params: Record<string, unknown> = {
    name: opts.name, campaign_id: opts.campaignId, status: opts.status ?? "PAUSED",
    billing_event: "IMPRESSIONS",
    optimization_goal: isValueGoal ? "VALUE" : optimizationGoalFor(opts.objective),
    targeting: t,
  };
  if (opts.dailyBudgetMajor && opts.dailyBudgetMajor > 0) {
    params.daily_budget = Math.round(opts.dailyBudgetMajor * 100);
    if (isValueGoal && opts.targetRoas && opts.targetRoas > 0) {
      params.bid_strategy = "LOWEST_COST_WITH_MIN_ROAS";
      params.bid_constraints = { roas_average_floor: Math.round(opts.targetRoas * 10000) }; // Meta scales ROAS ×10000
    } else if (!isValueGoal && opts.costPerPurchaseCap && opts.costPerPurchaseCap > 0) {
      params.bid_strategy = "COST_CAP";
      params.bid_amount = Math.round(opts.costPerPurchaseCap * 100);
    } else {
      params.bid_strategy = "LOWEST_COST_WITHOUT_CAP";
    }
  }
  if (opts.objective === "OUTCOME_SALES" && opts.pixelId) {
    params.promoted_object = { pixel_id: opts.pixelId, custom_event_type: opts.customEventType ?? "PURCHASE" };
    // Match Ads Manager default (API default is 7d-click only): 7d click, 1d engaged view, 1d view.
    params.attribution_spec = [
      { event_type: "CLICK_THROUGH", window_days: 7 },
      { event_type: "ENGAGED_VIDEO_VIEW", window_days: 1 },
      { event_type: "VIEW_THROUGH", window_days: 1 },
    ];
  }
  return metaPost<{ id: string }>(`${opts.adAccountId}/adsets`, params, opts.accessToken);
}
```

**Budget convention:** all budget inputs are in **major units** (€/$); the write layer multiplies by 100 into Meta minor units. **CBO** = budget lives on the campaign; **ABO** = budget lives on the ad set. Never set both.

### 5.5 `src/lib/launcher/object-story-spec.ts` — build the creative spec

```ts
import type { ObjectStorySpec } from "../meta-ads-write";

export interface AdCopy {
  primaryText: string; headline?: string; description?: string;
  link: string; displayLink?: string; cta: string; // Meta CTA enum e.g. "SHOP_NOW"
}
export interface BuildSpecInput {
  pageId: string; instagramAccountId?: string; mediaType: "IMAGE" | "VIDEO";
  imageHash?: string; videoId?: string; thumbnailUrl?: string; copy: AdCopy;
}

export function buildObjectStorySpec(input: BuildSpecInput): ObjectStorySpec {
  const { pageId, instagramAccountId, mediaType, imageHash, videoId, thumbnailUrl, copy } = input;
  const callToAction = { type: copy.cta, value: { link: copy.link } };
  const spec: Record<string, unknown> = { page_id: pageId };
  if (instagramAccountId) spec.instagram_actor_id = instagramAccountId;

  if (mediaType === "IMAGE") {
    if (!imageHash) throw new Error("imageHash required for an image ad");
    spec.link_data = {
      image_hash: imageHash, link: copy.link, message: copy.primaryText,
      name: copy.headline, description: copy.description, caption: copy.displayLink,
      call_to_action: callToAction,
    };
  } else {
    if (!videoId) throw new Error("videoId required for a video ad");
    spec.video_data = {
      video_id: videoId, image_url: thumbnailUrl, message: copy.primaryText,
      title: copy.headline, link_description: copy.description, call_to_action: callToAction,
    };
  }
  return spec;
}
```

### 5.6 `src/lib/launcher/launch-ad.ts` — orchestrate a single launch

```ts
import { uploadAdImage, uploadAdVideo, waitForVideoReady, getVideoThumbnailUrl,
  createAdCreative, createAd, getOrCreatePageBackedInstagramId } from "../meta-ads-write";
import { buildObjectStorySpec, type AdCopy } from "./object-story-spec";

export interface LaunchSingleAdInput {
  token: string; metaAdAccountId: string; adSetId: string; adName: string;
  status?: "ACTIVE" | "PAUSED"; pageId: string; instagramAccountId?: string;
  creative: { mediaType: "IMAGE" | "VIDEO"; url: string; filename: string; thumbnailUrl?: string };
  copy: AdCopy; degreesOfFreedomSpec?: Record<string, unknown>; urlTags?: string; multiAdvertiser?: boolean;
}
export interface LaunchSingleAdResult { metaAdId: string; metaCreativeId: string; metaImageHash?: string; metaVideoId?: string; }

export async function launchSingleAd(input: LaunchSingleAdInput): Promise<LaunchSingleAdResult> {
  const { token, metaAdAccountId, adSetId, adName, status = "PAUSED", pageId, instagramAccountId, creative, copy } = input;
  let imageHash: string | undefined, videoId: string | undefined, thumbnailUrl = creative.thumbnailUrl;

  if (creative.mediaType === "IMAGE") {
    imageHash = (await uploadAdImage({ adAccountId: metaAdAccountId, accessToken: token, imageUrl: creative.url, filename: creative.filename })).hash;
  } else {
    videoId = (await uploadAdVideo({ adAccountId: metaAdAccountId, accessToken: token, fileUrl: creative.url, name: creative.filename })).id;
    await waitForVideoReady({ videoId, accessToken: token });
    if (!thumbnailUrl) thumbnailUrl = (await getVideoThumbnailUrl({ videoId, accessToken: token })) ?? undefined;
  }

  // No real IG account → run on IG via the Page's identity. Best-effort; fall back to FB-only.
  let igIdentity = instagramAccountId;
  if (!igIdentity) {
    try { igIdentity = await getOrCreatePageBackedInstagramId({ pageId, accessToken: token }); } catch {}
  }

  const objectStorySpec = buildObjectStorySpec({ pageId, instagramAccountId: igIdentity, mediaType: creative.mediaType, imageHash, videoId, thumbnailUrl, copy });
  const { id: creativeId } = await createAdCreative({
    adAccountId: metaAdAccountId, accessToken: token, name: adName, objectStorySpec,
    degreesOfFreedomSpec: input.degreesOfFreedomSpec, urlTags: input.urlTags, multiAdvertiser: input.multiAdvertiser,
  });
  const { id: metaAdId } = await createAd({ adAccountId: metaAdAccountId, accessToken: token, name: adName, adsetId: adSetId, creativeId, status });
  return { metaAdId, metaCreativeId: creativeId, metaImageHash: imageHash, metaVideoId: videoId };
}
```

### 5.7 `src/lib/launcher/cta.ts`, `targeting.ts`, `naming.ts`, `enhancements.ts`

**cta.ts** — Meta CTA enums with friendly labels:

```ts
export const CTA_OPTIONS = [
  { value: "SHOP_NOW", label: "Shop now" }, { value: "LEARN_MORE", label: "Learn more" },
  { value: "SIGN_UP", label: "Sign up" }, { value: "SUBSCRIBE", label: "Subscribe" },
  { value: "ORDER_NOW", label: "Order now" }, { value: "GET_OFFER", label: "Get offer" },
  { value: "BOOK_TRAVEL", label: "Book now" }, { value: "CONTACT_US", label: "Contact us" },
  { value: "DOWNLOAD", label: "Download" }, { value: "APPLY_NOW", label: "Apply now" },
  { value: "GET_QUOTE", label: "Get quote" }, { value: "SEE_MENU", label: "See menu" },
  { value: "WATCH_MORE", label: "Watch more" }, { value: "NO_BUTTON", label: "No button" },
];
const LABEL = new Map(CTA_OPTIONS.map((o) => [o.value, o.label]));
export function ctaLabel(v?: string | null): string {
  if (!v) return "—";
  return LABEL.get(v) ?? v.toLowerCase().split("_").map((w, i) => i === 0 ? w[0].toUpperCase() + w.slice(1) : w).join(" ");
}
```

**targeting.ts** — conversion events + country normalization:

```ts
export const CONVERSION_EVENTS = [
  { value: "PURCHASE", label: "Purchase" }, { value: "INITIATE_CHECKOUT", label: "Initiate checkout" },
  { value: "ADD_TO_CART", label: "Add to cart" }, { value: "ADD_PAYMENT_INFO", label: "Add payment info" },
  { value: "ADD_TO_WISHLIST", label: "Add to wishlist" }, { value: "VIEW_CONTENT", label: "View content" },
  { value: "SEARCH", label: "Search" }, { value: "LEAD", label: "Lead" },
  { value: "COMPLETE_REGISTRATION", label: "Complete registration" }, { value: "SUBSCRIBE", label: "Subscribe" },
  { value: "START_TRIAL", label: "Start trial" }, { value: "CONTACT", label: "Contact" },
];
const ALIASES: Record<string, string> = { UK: "GB", USA: "US", AMERICA: "US", GER: "DE", GERMANY: "DE", HOLLAND: "NL", NETHERLANDS: "NL", CANADA: "CA", AUSTRALIA: "AU" };
export function normalizeCountries(input: string): string[] {
  const seen = new Set<string>(), out: string[] = [];
  for (const raw of input.split(/[\s,]+/)) {
    const t = raw.trim().toUpperCase(); if (!t) continue;
    const code = ALIASES[t] ?? (t.length === 2 ? t : t.slice(0, 2));
    if (code.length === 2 && !seen.has(code)) { seen.add(code); out.push(code); }
  }
  return out;
}
```

**naming.ts** — build an ad name from ordered tokens (dependency-free date formatter; placeholders left literal so a later bulk-edit can substitute them):

```ts
export type NamingToken =
  | { kind: "filename" } | { kind: "adType" } | { kind: "date"; format: string }
  | { kind: "text"; value: string } | { kind: "placeholder"; key: string };
export interface NamingConfig { tokens: NamingToken[]; separator: string; removeDimensions?: boolean; }
export interface NamingContext { filename?: string; adType?: string; placeholders?: Record<string, string>; date?: Date; }

const MONTHS = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
const pad = (n: number) => String(n).padStart(2, "0");
export function formatDate(d: Date, fmt: string): string {
  const map: Record<string, string> = { YYYY: `${d.getFullYear()}`, YY: `${d.getFullYear()}`.slice(-2), MMM: MONTHS[d.getMonth()], MM: pad(d.getMonth()+1), DD: pad(d.getDate()), HH: pad(d.getHours()), mm: pad(d.getMinutes()) };
  return fmt.replace(/YYYY|YY|MMM|MM|DD|HH|mm/g, (t) => map[t] ?? t); // longest-first avoids YYYY/YY collision
}
export function buildAdName(cfg: NamingConfig, ctx: NamingContext): string {
  const date = ctx.date ?? new Date(); const parts: string[] = [];
  for (const tk of cfg.tokens) {
    let v = "";
    switch (tk.kind) {
      case "filename": { let f = (ctx.filename ?? "").replace(/\.[a-z0-9]{1,5}$/i, ""); if (cfg.removeDimensions) f = f.replace(/[_-]?\d{2,5}x\d{2,5}$/i, ""); v = f; break; }
      case "adType": v = ctx.adType ?? ""; break;
      case "date": v = formatDate(date, tk.format || "YYYY-MM-DD"); break;
      case "text": v = tk.value ?? ""; break;
      case "placeholder": v = ctx.placeholders?.[tk.key] ?? `{{${tk.key}}}`; break;
    }
    if (v !== "") parts.push(v);
  }
  return parts.join(cfg.separator || "_");
}
export const DEFAULT_NAMING: NamingConfig = { tokens: [{ kind: "filename" }, { kind: "date", format: "YYYY-MM-DD" }], separator: "_" };
```

**enhancements.ts** — Advantage+ creative enhancement catalog. **Critical gotcha:** Meta turns several enhancements ON by default when no spec is sent. To honor "all off", you must explicitly send every applicable feature as `OPT_IN` (enabled) or `OPT_OUT` (not) — never omit.

```ts
export interface EnhancementItem { id: string; label: string; metaKey?: string; } // only items with metaKey are sent
export interface EnhancementFormat { key: string; label: string; items: EnhancementItem[]; }

export const ENHANCEMENT_FORMATS: EnhancementFormat[] = [
  { key: "image", label: "Image", items: [
    { id: "relevant_comments", label: "Relevant comments", metaKey: "inline_comment" },
    { id: "visual_touchups", label: "Visual touch-ups", metaKey: "image_touchups" },
    { id: "text_improvements", label: "Text improvements", metaKey: "text_optimizations" },
    { id: "add_overlays", label: "Add overlays", metaKey: "add_text_overlay" },
    { id: "music", label: "Music", metaKey: "music_generation" },
    { id: "image_animation", label: "Image animation", metaKey: "image_animation" },
    { id: "add_site_links", label: "Add site links", metaKey: "site_extensions" },
    { id: "add_catalog_items", label: "Add catalog items", metaKey: "product_extensions" },
    { id: "add_details", label: "Add details to ad layout", metaKey: "show_destination_blurbs" },
    { id: "enhance_cta", label: "Enhance CTA", metaKey: "generate_cta" },
    { id: "reveal_details", label: "Reveal details over time", metaKey: "reveal_details_over_time" },
    { id: "flex_media", label: "Flex media", metaKey: "media_type_automation" },
    { id: "translate_text", label: "Translate text", metaKey: "text_translation" },
    { id: "show_summaries", label: "Show summaries", metaKey: "show_summary" },
    { id: "image_auto_crop", label: "Image auto crop", metaKey: "adapt_to_placement" },
  ]},
  { key: "video", label: "Video", items: [
    { id: "relevant_comments", label: "Relevant comments", metaKey: "inline_comment" },
    { id: "visual_touchups", label: "Visual touch-ups", metaKey: "image_touchups" },
    { id: "text_improvements", label: "Text improvements", metaKey: "text_optimizations" },
    { id: "add_catalog_items", label: "Add catalog items", metaKey: "product_extensions" },
    { id: "add_site_links", label: "Add site links", metaKey: "site_extensions" },
    { id: "add_details", label: "Add details to ad layout", metaKey: "show_destination_blurbs" },
    { id: "enhance_cta", label: "Enhance CTA", metaKey: "generate_cta" },
    { id: "reveal_details", label: "Reveal details over time", metaKey: "reveal_details_over_time" },
    { id: "flex_media", label: "Flex media", metaKey: "media_type_automation" },
    { id: "translate_text", label: "Translate text", metaKey: "text_translation" },
    { id: "show_summaries", label: "Show summaries", metaKey: "show_summary" },
    { id: "show_spotlights", label: "Show spotlights", metaKey: "video_highlights" },
  ]},
  // (carousel / collection / catalogCarousel / flexible formats follow the same shape —
  //  add them if you support those creative types.)
];

export type EnhancementSettings = Record<string, Record<string, boolean>>; // { [formatKey]: { [itemId]: boolean } }

export function buildDegreesOfFreedomSpec(settings: EnhancementSettings | null | undefined, mediaType: "IMAGE" | "VIDEO"): Record<string, unknown> {
  const map = settings ?? {};
  const formats = mediaType === "VIDEO" ? ["video", "flexible"] : ["image", "flexible"];
  const features: Record<string, { enroll_status: string }> = {};
  for (const fmt of formats) {
    const enabled = map[fmt] ?? {};
    const def = ENHANCEMENT_FORMATS.find((f) => f.key === fmt);
    for (const item of def?.items ?? []) {
      if (!item.metaKey) continue;
      const on = !!enabled[item.id];
      if (on || !(item.metaKey in features)) features[item.metaKey] = { enroll_status: on ? "OPT_IN" : "OPT_OUT" };
    }
  }
  return { creative_features_spec: features };
}
```

### 5.8 `src/lib/storage/r2.ts` — object storage (presigned uploads)

Store **object keys** in the DB, not full URLs, so you can swap the public domain later. Uploads are presigned PUTs (browser → storage directly).

```ts
import { S3Client, PutObjectCommand, DeleteObjectCommand } from "@aws-sdk/client-s3";
import { getSignedUrl } from "@aws-sdk/s3-request-presigner";
import { randomBytes } from "crypto";

const accountId = process.env.R2_ACCOUNT_ID, accessKeyId = process.env.R2_ACCESS_KEY_ID,
  secretAccessKey = process.env.R2_SECRET_ACCESS_KEY, bucket = process.env.R2_BUCKET, publicUrl = process.env.R2_PUBLIC_URL;

let _client: S3Client | null = null;
function client(): S3Client {
  if (!_client) _client = new S3Client({
    region: "auto",
    endpoint: `https://${accountId}.r2.cloudflarestorage.com`, // for AWS S3, drop this and set region
    credentials: { accessKeyId: accessKeyId!, secretAccessKey: secretAccessKey! },
  });
  return _client;
}

function buildKey(tenantId: string, adAccountId: string, filename: string): string {
  const safe = filename.replace(/[^a-zA-Z0-9._-]/g, "_").slice(0, 80);
  const rand = randomBytes(6).toString("hex");
  return `tenants/${tenantId}/launcher/${adAccountId}/${rand}-${safe}`;
}

export interface PresignedUpload { key: string; uploadUrl: string; publicUrl: string; expiresAt: string; }

export async function createUploadUrl(tenantId: string, adAccountId: string, filename: string, contentType: string, expiresInSeconds = 300): Promise<PresignedUpload> {
  const key = buildKey(tenantId, adAccountId, filename);
  const uploadUrl = await getSignedUrl(client(), new PutObjectCommand({ Bucket: bucket!, Key: key, ContentType: contentType }), { expiresIn: expiresInSeconds });
  return { key, uploadUrl, publicUrl: publicUrlForKey(key), expiresAt: new Date(Date.now() + expiresInSeconds * 1000).toISOString() };
}

export function publicUrlForKey(key?: string | null): string {
  if (!key) return "";
  if (key.startsWith("http")) return key;
  return `${publicUrl!.replace(/\/$/, "")}/${key.replace(/^\//, "")}`;
}

export async function deleteObject(key: string): Promise<void> {
  if (!key || key.startsWith("http")) return;
  try { await client().send(new DeleteObjectCommand({ Bucket: bucket!, Key: key })); } catch {}
}
```

Also add a **client-safe** URL resolver (`r2-client.ts`) reading `NEXT_PUBLIC_R2_PUBLIC_URL`, since the server file can't be imported into client components.

### 5.9 `src/lib/launcher/creative-triage.ts` — (optional) AI image organization

Uses a vision model to file each untriaged image into a folder/board with tags + a one-line description. Runs **sequentially** so each classification sees folders created by the previous one (avoids near-duplicate folders). Picks up to N (`aiTriagedAt: null`), is idempotent — the client calls it repeatedly until `remaining === 0`. Skips videos in v1. Requires `ANTHROPIC_API_KEY`. If you skip this feature, drop the boards auto-fill and let users create boards manually.

---

## 6. OAuth connect flow (Route Handlers)

Three routes. Adapt `tenantId` and your session/`auth()`.

### 6.1 `GET /api/integrations/meta/connect`

1. Require session (else redirect `/login`). Require `tenantId` query.
2. Require `META_APP_ID`/`META_APP_SECRET` (else redirect with `?error=meta_not_configured`).
3. `buildMetaOAuthUrl(tenantId)` → `{ url, nonce }`.
4. Delete existing `MetaPendingAuth` for the tenant, create a new placeholder row: `{ accessToken: "pending", tokenExpiry: now+10min, accountsJson: "[]", tenantId, oauthNonce: nonce }`.
5. `redirect(url)` to Facebook.

### 6.2 `GET /api/integrations/meta/callback`

1. Require session. Read `code`, `state`, `error`. If `error` → redirect `?error=denied`. Missing `code`/`state` → `?error=missing_params`.
2. Decode `state` (base64url JSON) → `{ tenantId, nonce }`. **CSRF check:** find `MetaPendingAuth` where `{ tenantId, oauthNonce: nonce }`; not found → `?error=invalid_state`.
3. `exchangeCodeForToken(code)` → short-lived.
4. `exchangeForLongLivedToken(shortLived.access_token)` → long-lived; `tokenExpiry = now + expires_in*1000`.
5. `fetchAdAccounts(longLived.access_token)`. Empty → `?error=no_ad_accounts`.
6. Replace the pending row: `{ accessToken: encrypt(longLived.access_token), tokenExpiry, accountsJson: JSON.stringify(accounts), tenantId }`.
7. Redirect to your integrations page with `?pendingMeta=<pending.id>` so the user picks accounts.

### 6.3 `GET`/`POST /api/integrations/meta/pending`

- **GET `?id=`** — load pending; if older than 10 min, delete + 410; else return `{ pendingId, tenantId, accounts }` (parsed from `accountsJson`).
- **POST `{ pendingId, selectedAccountIds[] }`** — for each selected account, **upsert an `AdAccount`** on `platform_accountId = { platform: "META", accountId }` with `{ accountName, accessToken: pending.accessToken (already encrypted), tokenExpiry: pending.tokenExpiry, tenantId }`. Delete the pending row. **This is where connected `AdAccount` rows are created.**

**Additional integration routes** (small):
- **`POST /api/integrations/meta/disconnect { adAccountId }`** — set `accessToken: "manual"`, `tokenExpiry: null` (keeps history).
- **`POST /api/integrations/meta/connect-token { tenantId, accessToken, adAccountId? }`** — §7.4: validate via `fetchAdAccounts`, then upsert `AdAccount` with `accessToken: encrypt(token)`, `tokenExpiry = now + 60d` (use this for pasted long-lived / system-user tokens; ideal for local dev).

---

## 7. Launcher API routes

All under `src/app/api/launcher/**`. Every handler: `try/catch` → 500 on unexpected error; validate input with Zod; resolve `AdAccount` by internal id → derive `tenantId` → role-gate. Meta-calling routes call `ensureFreshMetaToken(account)` and use `account.accountId` (the `act_…` id) for Graph calls.

**Role gating summary** (adapt to your roles):

| Route | Method | Role |
|---|---|---|
| `ad-accounts` | GET | ADMIN (only lists accounts the user admins) |
| `settings`, `default-ad-copy` | GET/PUT | ADMIN + EDITOR |
| `drafts`, `templates`, `launched` | all | ADMIN + EDITOR |
| `pixels`, `audiences` | GET | ADMIN + EDITOR |
| `pages` | GET | ADMIN |
| `creatives` (list/register), `upload-url`, `triage` | GET/POST | ADMIN + EDITOR |
| `creatives/[id]` | DELETE | ADMIN |
| **`campaigns`** | **POST** | **ADMIN** |
| **`adsets`** | **POST** | **ADMIN** |
| **`launch`** | **POST** | **ADMIN** |

### 7.1 Discovery / selector routes (all GET, keyed on `?adAccountId=`)

- **`ad-accounts`** → `{ accounts: [{ id, accountId, accountName, tenantId, isConnected }] }`. `isConnected = accessToken !== "manual"`. Lists only accounts the user admins.
- **`pages`** → Graph `GET /me/accounts?fields=id,name,picture{url},instagram_business_account{id,username}&limit=100` → `{ pages: [{ id, name, pictureUrl, instagramId, instagramUsername }] }`. If token manual/expired → 400 (needs reconnect).
- **`pixels`** → Graph `GET /{accountId}/adspixels?fields=id,name&limit=100` → `{ pixels: [{ id, name }] }`. Manual/expired → `{ pixels: [] }`.
- **`audiences`** → Graph `GET /{accountId}/customaudiences?fields=id,name,subtype&limit=200` → `{ audiences: [...] }` (for exclusion pickers).
- **Campaigns/ad sets for the grid** — reuse your synced campaign/ad-set data, or add reads via `fetchCampaigns`/`fetchAdSets` (`GET /{accountId}/campaigns?fields=id,name,status`, `/{accountId}/adsets?fields=id,name,status,campaign_id`). The Launch Studio needs campaigns with nested ad sets to populate the ad-set dropdown.
- **`campaigns` GET `?adAccountId=&campaignId=`** → Graph `GET /{campaignId}?fields=daily_budget,lifetime_budget` → `{ isCbo: Boolean(daily||lifetime budget) }`. Lets the Ad Set builder know whether budget lives on the campaign.

### 7.2 Config routes

- **`settings` GET/PUT** — read/upsert `AdLauncherSettings` (unique on `adAccountId`). PUT Zod: `adAccountId`, `facebookPageId?`, `instagramAccountId?`, `pixelId?`, `trackingEnabled?`, `multiAdvertiser?`, `launchAsPaused?`, `separator?`, `namingConvention?`, `creativeEnhancements?`, `adSetDefaults?`, `placements?`. Strip `undefined` for partial updates, then `upsert`.
- **`default-ad-copy` GET/PUT** — read/write `AdLauncherSettings.defaultAdCopy` JSON: `{ primaryText?, headline?, description?, link?, displayLink?, cta?, utmParameters? }`.
- **`templates` GET/POST, `templates/[id]` PUT/DELETE** — `AdCopyTemplate` CRUD. POST Zod: `adAccountId, name, primaryTexts[], headlines[], description?, cta?, webLink?, displayLink?, customProductPageId?, utmParameters?`.
- **`drafts` GET/POST, `drafts/[id]` GET/DELETE** — `LaunchDraft`. POST `{ adAccountId, name?, payload }` (serialized grid). GET list returns metadata only; GET `[id]` returns full `payload` to rehydrate the grid.
- **`launched` GET** — `LaunchedAd.findMany` (last 200, newest first) + resolve uploader display names.

### 7.3 Creatives routes

- **`creatives` GET** — list with `board` + `launchedAds` + uploader name.
- **`creatives` POST** — register an already-uploaded object: Zod `{ adAccountId, name, mediaType, storageKey, url, sizeBytes?, extension?, width?, height? }` → `LauncherCreative.create` with `source: "UPLOAD"`, `uploadedById`, `aiTriagedAt: null`.
- **`creatives/upload-url` POST** — Zod `{ adAccountId, filename, contentType }`. Guard: `contentType` must match `/^(image|video)\//`; reject `image/heic`/`image/heif` (Meta can't use HEIC). Return `createUploadUrl(...)` → `{ key, uploadUrl, publicUrl, expiresAt }`. Client PUTs bytes to `uploadUrl`, then POSTs `/creatives` with `storageKey=key`, `url=publicUrl`.
- **`creatives/triage` POST** — Zod `{ adAccountId }` → `triageCreatives(...)` → `{ triaged, failed, remaining }`. Client loops until `remaining === 0`.
- **`creatives/[id]` DELETE** — ADMIN only: `deleteObject(storageKey)` + `LauncherCreative.delete`.

### 7.4 Alternate connect (dev/simple): pasted token

`POST /api/integrations/meta/connect-token { tenantId, accessToken, adAccountId? }` — validate token via `fetchAdAccounts`; upsert `AdAccount(s)` with `encrypt(token)` and `tokenExpiry = now + 60d`. Use this for local dev (skips OAuth/HTTPS) and for **system-user tokens** (never-expiring). This is the fastest path to a working launch during development.

### 7.5 `POST /api/launcher/campaigns` — create campaign + first ad set

ADMIN only. Creates both, **both PAUSED**. Zod (`.superRefine`):

```
adAccountId: string
campaignName: string
objective: "OUTCOME_SALES"|"OUTCOME_TRAFFIC"|"OUTCOME_ENGAGEMENT"|"OUTCOME_AWARENESS"|"OUTCOME_LEADS"
budgetLevel: "CBO"|"ABO"   (default CBO)
dailyBudget: number > 0    (major units)
adSetName: string
countries: string[] (each len 2, min 1)
ageMin?: 13..65   ageMax?: 13..65
genders?: number[]         (1=male, 2=female)
advantageAudience?: boolean
customAudienceIds?: string[]
pixelId?: string           (required when objective = OUTCOME_SALES)
customEventType?: string   (required when objective = OUTCOME_SALES)
// superRefine: SALES requires pixelId + customEventType; ageMin ≤ ageMax
```

Flow: lookup account (META) → ADMIN gate → `ensureFreshMetaToken` (manual/expired → 400) → read `AdLauncherSettings.placements` (if `mode === "MANUAL"` with platforms → `publisherPlatforms`, else Advantage+ automatic) → `createCampaign({ dailyBudgetMajor: CBO ? dailyBudget : undefined })` → `createAdSet({ campaignId, dailyBudgetMajor: ABO ? dailyBudget : undefined, targeting, pixelId, customEventType, publisherPlatforms })`. Return `{ ok, campaignId, adSetId, adSetName }`. Meta failure → 502 with the human-readable message.

### 7.6 `POST /api/launcher/adsets` — add an ad set to an existing campaign

ADMIN only. Zod like §7.5 but keyed on an existing `campaignId`, plus: `status?`, `dailyBudget?` (ABO only), `excludedCustomAudienceIds?`, `performanceGoal? ("MAXIMIZE_VALUE"|"MAXIMIZE_CONVERSIONS")`, `targetRoas? (≤100)`, `costPerPurchase?`. Maps to `createAdSet` with those bid controls. Return `{ ok, adSetId, adSetName }`.

### 7.7 `POST /api/launcher/launch` — launch one ad (call once per grid row)

ADMIN only. This is the endpoint the grid hits per creative. Zod:

```
adAccountId, adSetId, adSetName?, adName, status?("ACTIVE"|"PAUSED"),
pageId, instagramAccountId?,
creative: { launcherCreativeId?, mediaType?, url?, filename?, thumbnailUrl? },
copy: { primaryText, headline?, description?, link(url), displayLink?, cta },
urlTags?
```

Flow:
1. Session + lookup account (must be META) → 404 if not.
2. `validateBrandRole(tenantId, [ADMIN])`.
3. Resolve the creative: if `launcherCreativeId`, load `LauncherCreative` (must belong to this account) → `{ mediaType, url, filename }`; else use inline `mediaType`+`url`+`filename` (400 if missing).
4. `ensureFreshMetaToken` — `"manual"` → 400 "reconnect"; `expired` → 400 "token expired".
5. Load `AdLauncherSettings.{ creativeEnhancements, multiAdvertiser }`; `degreesOfFreedomSpec = buildDegreesOfFreedomSpec(creativeEnhancements, mediaType)`.
6. `launchSingleAd({ token, metaAdAccountId: account.accountId, adSetId, adName, status, pageId, instagramAccountId, creative, copy, degreesOfFreedomSpec, urlTags, multiAdvertiser })`.
7. On success: `LaunchedAd.create({ launchStatus: "LAUNCHED", metaAdId, metaCreativeId, ... })`; if a library creative, mark it `LAUNCHED` and store `metaImageHash`/`metaVideoId`. Return `{ ok, adId, creativeId, launchedAdId }`.
8. On Meta failure: still `LaunchedAd.create({ launchStatus: "FAILED", errorMessage })` (so failures are auditable) and return 502 with the message.

The full reference handler:

```ts
import { NextRequest, NextResponse } from "next/server";
import { z } from "zod";
import { auth } from "@/lib/auth";
import { prisma } from "@/lib/prisma";
import { validateBrandRole } from "@/lib/auth-helpers"; // your role gate
import { ROLES } from "@/lib/roles";
import { ensureFreshMetaToken } from "@/lib/meta-token";
import { launchSingleAd } from "@/lib/launcher/launch-ad";
import { buildDegreesOfFreedomSpec, type EnhancementSettings } from "@/lib/launcher/enhancements";

const schema = z.object({
  adAccountId: z.string().min(1), adSetId: z.string().min(1), adSetName: z.string().optional(),
  adName: z.string().min(1), status: z.enum(["ACTIVE", "PAUSED"]).optional(),
  pageId: z.string().min(1), instagramAccountId: z.string().optional(),
  creative: z.object({ launcherCreativeId: z.string().optional(), mediaType: z.enum(["IMAGE", "VIDEO"]).optional(), url: z.string().url().optional(), filename: z.string().optional(), thumbnailUrl: z.string().url().optional() }),
  copy: z.object({ primaryText: z.string().min(1), headline: z.string().optional(), description: z.string().optional(), link: z.string().url(), displayLink: z.string().optional(), cta: z.string().min(1) }),
  urlTags: z.string().optional(),
});

export async function POST(req: NextRequest) {
  try {
    const session = await auth();
    if (!session?.user?.id) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    const parsed = schema.safeParse(await req.json());
    if (!parsed.success) return NextResponse.json({ error: "Invalid request", details: parsed.error.flatten() }, { status: 400 });
    const body = parsed.data;

    const account = await prisma.adAccount.findUnique({ where: { id: body.adAccountId } });
    if (!account || account.platform !== "META") return NextResponse.json({ error: "Meta ad account not found" }, { status: 404 });

    const roleCheck = await validateBrandRole(account.tenantId, [ROLES.ADMIN]);
    if ("error" in roleCheck) return roleCheck.error;

    const cid = body.creative.launcherCreativeId;
    let creative: { mediaType: "IMAGE" | "VIDEO"; url: string; filename: string; thumbnailUrl?: string };
    if (cid) {
      const c = await prisma.launcherCreative.findUnique({ where: { id: cid } });
      if (!c || c.adAccountId !== account.id) return NextResponse.json({ error: "Creative not found for this ad account" }, { status: 404 });
      creative = { mediaType: c.mediaType === "VIDEO" ? "VIDEO" : "IMAGE", url: c.url, filename: c.name, thumbnailUrl: body.creative.thumbnailUrl };
    } else {
      const { mediaType, url, filename, thumbnailUrl } = body.creative;
      if (!mediaType || !url || !filename) return NextResponse.json({ error: "Provide creative.launcherCreativeId or inline mediaType+url+filename" }, { status: 400 });
      creative = { mediaType, url, filename, thumbnailUrl };
    }

    const fresh = await ensureFreshMetaToken(account);
    if (fresh.token === "manual") return NextResponse.json({ error: "Meta account is disconnected. Reconnect it first." }, { status: 400 });
    if (fresh.expired) return NextResponse.json({ error: "Meta token expired. Reconnect the account." }, { status: 400 });

    const status = body.status ?? "PAUSED";
    const settings = await prisma.adLauncherSettings.findUnique({ where: { adAccountId: account.id }, select: { creativeEnhancements: true, multiAdvertiser: true } });
    const degreesOfFreedomSpec = buildDegreesOfFreedomSpec(settings?.creativeEnhancements as EnhancementSettings | null, creative.mediaType);

    try {
      const result = await launchSingleAd({
        token: fresh.token, metaAdAccountId: account.accountId, adSetId: body.adSetId, adName: body.adName, status,
        pageId: body.pageId, instagramAccountId: body.instagramAccountId, creative, copy: body.copy,
        degreesOfFreedomSpec, urlTags: body.urlTags, multiAdvertiser: settings?.multiAdvertiser ?? false,
      });
      const launched = await prisma.launchedAd.create({ data: {
        adAccountId: account.id, metaAdId: result.metaAdId, metaCreativeId: result.metaCreativeId,
        adName: body.adName, adSetId: body.adSetId, adSetName: body.adSetName, status,
        launchStatus: "LAUNCHED", launchedById: session.user.id, creativeId: cid ?? null,
      }});
      if (cid) await prisma.launcherCreative.update({ where: { id: cid }, data: { launchStatus: "LAUNCHED", metaImageHash: result.metaImageHash ?? undefined, metaVideoId: result.metaVideoId ?? undefined } });
      return NextResponse.json({ ok: true, adId: result.metaAdId, creativeId: result.metaCreativeId, launchedAdId: launched.id });
    } catch (err) {
      const message = err instanceof Error ? err.message : `Launch failed`;
      await prisma.launchedAd.create({ data: { adAccountId: account.id, adName: body.adName, adSetId: body.adSetId, adSetName: body.adSetName, status, launchStatus: "FAILED", errorMessage: message, launchedById: session.user.id, creativeId: cid ?? null } });
      return NextResponse.json({ error: message }, { status: 502 });
    }
  } catch {
    return NextResponse.json({ error: "Internal server error" }, { status: 500 });
  }
}
```

---

## 8. UI

Own route group `(launcher)` with its own shell, mobile-first. All client data is gated on the **active ad account** from a context; every SWR key is `null` until an account is chosen.

### 8.1 Shell

- **`src/app/(launcher)/layout.tsx`** (server) — `auth()` guard → `redirect("/login")`; nest providers `AuthProvider → SidebarProvider → LauncherAccountProvider`; frame = fixed sidebar + column with topbar + scrollable `<main>`. Reserve mobile bottom space: `pb-[calc(4.5rem+env(safe-area-inset-bottom))] md:pb-8`.
- **`SidebarProvider`** — mobile drawer state `{ isOpen, toggle, close }`; auto-close on route change.
- **`LauncherAccountProvider`** — SWR `GET /api/launcher/ad-accounts`; `adAccountId` persisted in `localStorage["launcher.adAccountId"]`; defaults to first connected account; exposes `{ accounts, adAccountId, setAdAccountId, loading }` via `useLauncherAccount()`.
- **`LauncherSidebar`** — `w-60` drawer; mobile overlay + `translate-x` slide, `md:relative md:translate-x-0`; `pt-[env(safe-area-inset-top)]`; each link calls `close()`. Contains the **ad-account `<Select>`** (disables non-connected accounts). Nav groups:
  - **Launch:** Launch `/tool/launcher` · Creatives `/tool/launcher/creatives` · Launched Ads `/tool/launcher/launched` · Drafts `/tool/launcher/drafts` (+ Partnership Ads if you build it)
  - **Ad Copy:** Default Ad Copy `/tool/launcher/default-ad-copy` · Ad Copy Templates `/tool/launcher/templates`
  - **Setup:** Creative Enhancements `/tool/launcher/enhancements` · Configure Placements `/tool/launcher/placements` · Launch Settings `/tool/launcher/settings`
  - Footer: back-to-app link.
- **`LauncherTopBar`** — `min-h-14`, `pt-[env(safe-area-inset-top)]`; `md:hidden` hamburger → `toggle()`; user menu (profile / sign out).

Each page file is a thin wrapper rendering one feature component (`/tool/launcher/page.tsx` wraps `<LaunchStudio/>` in `<Suspense>` because it reads `useSearchParams`).

### 8.2 Launch Studio (the core) — `launch-studio.tsx`

Two-pane: left = shared "Ad Setup", right = "Ads (N)" creative grid.

- **Loads** (SWR, keyed on `adAccountId`): pages, campaigns+adSets, `settings` (page + naming), `default-ad-copy`, `creatives` (only when the load modal opens), `templates`.
- **State:** shared setup (`pageId`, `instagramAccountId`, `campaignId`, `adSetId`, `status`), copy (`primaryTexts[]`, `headlines[]` as variation arrays, `description`, `cta`, `link`, `utm`, `displayLink`), advanced fields (lead form, product set, promo, schedule — stored, not all sent to Meta in v1), `cards[]` (loaded creatives), `results` (per-card launch status).
- **Persistence:** hot-save a snapshot to `localStorage["launcher.studio.<adAccountId>"]` on change; restore per account on switch (reset account-scoped page/campaign/adSet to avoid leaking across accounts). Prefill copy once from Default Ad Copy into empty fields only. "Copy to account" clones the snapshot (minus page/campaign/adSet + `launcherCreativeId`) into another account. Draft load via `?draft=<id>` → `GET /api/launcher/drafts/{id}` → hydrate.
- **Load Creatives modal:** selectable grid from the library; picked creatives become cards with `launcherCreativeId`, `mediaType`, `url`, `filename`, and an `adName` generated via `buildAdName(naming, …)`.
- **Cards:** thumb (`<img>` for image; a video element seeked to ~0.1s for video, icon fallback on decode error), type badge, preview + delete buttons, editable ad-name input.
- **Launch — `launchAll()`:** iterate cards **sequentially**; per card set `launching`, `POST /api/launcher/launch` with `{ adAccountId, adSetId, adSetName, adName, status, pageId, instagramAccountId?, creative:{ launcherCreativeId?, mediaType, url, filename }, copy:{ primaryText, headline?, description?, link, displayLink?, cta }, urlTags? }`, record `{ state: "ok"|"error", message }`. `canLaunch` requires adAccountId + adSetId + pageId + ≥1 card and not already launching. Only `primaryTexts[0]`/`headlines[0]` are sent in v1.
- **Save draft — `saveDraft()`:** `POST /api/launcher/drafts { adAccountId, payload }`.
- **Builders:** open `<CampaignBuilder>` / `<AdSetBuilder>` modals; on create, merge the returned campaign/adSet into local lists and select it (so freshly-built entities show immediately without a re-sync).
- **Preview drawer:** mock Facebook Feed card + Instagram Reels (9:16) from current copy/page/CTA.

### 8.3 Builders

- **`campaign-builder.tsx`** — modal; SWR pixels + settings (prefills `adSetDefaults`). Fields: campaignName, objective, conversionEvent (sales), budgetLevel CBO/ABO, dailyBudget, adSetName, countries (via `CountryPicker`, "Big 5" = US/GB/AU/NZ/CA default), age min/max, gender, advantage audience, pixel. Validates sales-needs-pixel, age bounds, budget>0. Submit → `POST /api/launcher/campaigns`; `onCreated` selects the new ad set.
- **`ad-set-builder.tsx`** — modal; SWR pixels, settings, `campaigns?campaignId=` (`isCbo`, disables budget when CBO), audiences (for exclusions when targeting "new customers"). Adds performance goal (sales+ABO): MAXIMIZE_VALUE→ROAS floor or MAXIMIZE_CONVERSIONS→cost cap. Submit → `POST /api/launcher/adsets`.

### 8.4 Config & library pages

- **`creatives-library.tsx`** — upload flow per file: read dimensions client-side → `POST /creatives/upload-url` → `PUT uploadUrl` (raw bytes) → `POST /creatives` (metadata). Delete → `DELETE /creatives/{id}`. "Organize with AI" loops `POST /creatives/triage` until `remaining === 0`. Views: grouped-by-launch and all; folder chips + text search.
- **`default-ad-copy-form.tsx`** — GET/PUT `/default-ad-copy`.
- **`ad-copy-templates.tsx`** — CRUD over `/templates`.
- **`creative-enhancements-form.tsx`** — renders `ENHANCEMENT_FORMATS` as per-format toggle cards → `settings.creativeEnhancements`; PUT `/settings`. **Default all OFF.**
- **`placements-form.tsx`** — mode AUTOMATIC/MANUAL + platform checkboxes (facebook/instagram/messenger/audience_network) → `settings.placements`; PUT `/settings`.
- **`launch-settings-form.tsx`** — central defaults: FB page (auto-fills IG), pixel, `launchAsPaused`, `multiAdvertiser`, ad-set defaults, and embeds the **`naming-builder.tsx`** (ordered token editor with live preview). PUT `/settings`.
- **`launched-ads-list.tsx`** — read-only table of `LaunchedAd` (result badge, Meta ad id, launched-by, timestamp).
- **`drafts-list.tsx`** — list + "Open in Launch" (`/tool/launcher?draft=<id>`) + delete.
- **Shared inputs:** `country-picker.tsx` (Big-5 toggles + free text via `normalizeCountries`), `launcher-combobox.tsx` (searchable single-select on Radix Popover + cmdk, with a "create new" footer), `launcher-select.tsx` (styled Radix Select).

Convention across components: a shared `fetcher = (url) => fetch(url).then(r => r.json())`, SWR key `null` until `adAccountId` exists, mutations are plain `fetch` + `mutate()`.

---

## 9. Recommended build order

Build and test bottom-up — do not start with UI.

1. **Meta app + token.** Create the app (§2), get a working token (system-user token via §7.4 is fastest). Confirm `fetchAdAccounts` returns your account.
2. **Schema + encryption + token lifecycle** (§4, §5.1–5.3). Store an encrypted token; confirm `ensureFreshMetaToken` round-trips.
3. **Write layer** (§5.4). Unit-test against a **sandbox ad set** — create one image ad **PAUSED**, confirm it appears in Ads Manager, then delete it. Do the same for video (watch the async polling).
4. **Single-ad launch** end-to-end: `object-story-spec` + `launch-ad` + `POST /api/launcher/launch`, called with an inline creative URL. This proves the whole pipeline.
5. **Storage + creatives** (§5.8, §7.3): presigned upload → register → launch from a library creative.
6. **Campaign + ad-set creation** (§5.4 create*, §7.5–7.6). Hardest Meta surface (targeting/budget/bid); test each objective.
7. **Config** (settings, default copy, templates, naming, enhancements, placements).
8. **UI** (§8): shell → Launch Studio → builders → library → config pages.
9. **OAuth flow** (§6) — swap the pasted-token dev path for real OAuth once you have HTTPS.

---

## 10. Gotchas & guardrails (learned the hard way)

- **Always launch PAUSED by default.** `createAd`/`createCampaign`/`createAdSet` default `status: "PAUSED"`. Never silently spend on a first launch. Let the user opt into ACTIVE.
- **Enhancements default ON at Meta.** You must explicitly `OPT_OUT` every feature to get "all off" (§5.7). Omitting the spec is *not* off.
- **`multiAdvertiser` defaults ON at Meta.** Always send `contextual_multi_ads.enroll_status` explicitly.
- **Image content-type matters.** Meta rejects even valid JPGs without a proper content-type + extension (`FileTypeNotSupported` 100/1487411). Convert WebP/AVIF/etc. to PNG before upload. Reject HEIC at the API boundary.
- **Videos are async.** Upload → poll `status.video_status` until `ready` (up to ~5 min) → fetch a thumbnail (`image_url` is required on video creatives) before creating the creative.
- **Nested specs are JSON strings in form fields.** The form-encoded POST helper JSON-stringifies object/array values — keep that.
- **Real error messages hide in `error_user_title`/`error_user_msg`.** Meta's top-level `message` is usually the useless "Invalid parameter". Surface the user-facing fields.
- **Budget units:** UI takes major units (€/$); multiply by 100 for Meta. CBO = budget on campaign; ABO = budget on ad set; never both.
- **Genders:** Meta uses `1=male, 2=female`; omit for all. **Countries:** ISO alpha-2. **ROAS floor:** scaled ×10000. **Cost cap:** minor units.
- **Sales objective needs a pixel + conversion event** (`promoted_object`) or the ad set won't create. Set `attribution_spec` to match Ads Manager (7d click / 1d view) rather than the API default.
- **Rate limits (codes 4/17/32/613/80000/80004) and 5xx are transient** — the write layer retries with exponential backoff. Don't fan out per-item on rate limits; back off.
- **Store storage keys, not URLs** — lets you change the CDN domain with zero migration.
- **Persist FAILED launches too** (`LaunchedAd.launchStatus = "FAILED"` + `errorMessage`) so batch failures are auditable.
- **Token renewal is lazy + swallowed.** Renewal happens on read within 10 days of expiry; failures fall back to the existing (still-valid) token and retry next call. A `null` expiry never renews (system-user token). A past-expiry token returns `expired: true` → user must reconnect.

---

## 11. Deferred / out of scope for v1

Partnership (branded-content) ads · external creative sources (Google Drive bulk links, Frame.io, Dropbox) · carousel/collection/catalog creative types · in-app analytics/reporting · non-Meta platforms (TikTok/AppLovin) · bulk placeholder replacement (Bulk Edit) · group-creatives-into-carousel. The schema and write layer are structured so these slot in later without rework.
