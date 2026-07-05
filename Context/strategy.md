---
type: context
status: active
tags: [strategy, goals, okrs]
updated: 2026-07-06
---

# Strategy, current focus

## North star

Build [[business|Goatly]] into a brand big enough to retire Talat's parents and fiancée. Long-term reputation > short-term margin. See [[me]] for the personal why.

## This month, July 2026

| Priority | Target | Why | Status |
|---|---|---|---|
| **UK-launch winstgevend maken** | PDP-CVR van 6,3% naar 8-9% (koud, eerlijk doel) + CPA per adset lezen na de freeze | UK converteert al beter dan NL op koud verkeer (2,3% site-CVR) maar balanceert op breakeven: AOV bepaalt de uitkomst. Zie [[Goatly-UK]] en [[2026-07-02]]. | Freeze tot ~9 juli, daarna lezen |

Hendels (uit de dailies, volgorde van verwachte impact):

1. **PDP-CVR fixes**: PayPal Express activeren + NL/BE-betaallogo's weg, bezorg/douane-trust-regel, NL-testimonialblok vertalen. Elke punt PDP-CVR is ~6,7 orders/week. Open loops staan in `Resources/Operator/Tasks.md`.
2. **Freeze-discipline tot ~9 juli**: alleen Nadine-wissel + UK19 live, daarna 5-7 dagen handen af (alleen kill-rules). Daarna: CPA per adset (Shopify-gereconcilieerd), AOV + P1/P3-split, CTR per hook.
3. **Review-flow** (canon prioriteit #1): grootste CVR-hefboom, nog steeds onbuilt. Beslissing [[me|Talat]] 6 jul: bouwen zodra de UK-ads goed lopen, niet eerder.
4. **AOV**: [[90-day-cycle-aov-fix]] live; P3/P6 push bepaalt winst per order.

## History

**June 2026: €200k-doel** (vanaf ~€50k MRR + €2,5-3,5k/dag run-rate). *"Dit is makkelijk te behalen met ons product. We moeten gewoon betere input hebben."*, Talat, June 17 2026. Uitkomst nog niet vastgelegd in de vault: [[me|Talat]] vult het junicijfer in. Eind juni verschoof de focus naar de UK-launch ([[Goatly-UK]], gestart 24 juni). **NL-ads zijn bewust uitgezet** (bevestigd door [[me|Talat]], 6 jul): main focus volledig op UK.

## Active priorities (Q2/Q3 2026)

Project folders intentionally not scaffolded yet, Talat wants to discuss them later before structuring. Documenting the priorities here so they don't vanish.

### 0. UK-launch (sinds 24 juni het hoofdwerk)

- **Waar:** [[Goatly-UK]] (research, copy-roster UK04v2/15/16/17/19, advertorial v4, offer, scaling-playbook).
- **Status:** live op trygoatly.com, aparte UK-market. Loopt nog niet naar wens ([[me|Talat]], 6 jul). Freeze tot ~9 juli, dan meten. NL-ads bewust uit: dit is nu de enige motor.
- Deze prioriteit stond hier eerst niet gedocumenteerd terwijl al het werk er al zat: precies het drift-patroon dat deze file moet voorkomen.

### 1. VSL learning + production

- **Why:** Long native ad copy + BOF ads is the current bread-and-butter. VSL is the next ad-spend ceiling (more spend absorbed per creative, higher rev). VSL_AS47 already pulled 5.38 ROAS at €87 spend, strong early signal.
- **What now:**
  - Learn VSL structure (start with VSL_SOP in `/Goatly_kennis/vsl/VSL_SOP.md` + Fernando playbook).
  - Write first scripts.
  - Hire VSL editor (in gesprek met iemand, niet gehired).

### 2. AOV optimization (€67,22 → higher, without RPV loss)

- **Why:** AOV already sits at the 2+1 bundle price (€69,95). Bundle mix is healthy. Lever is pushing 3+2 and adding subscription, not fixing single-pouch buyers.
- **Test plan (one variable at a time, ≥3 days per test), top 5:**
  1. **Default-selectie naar 2+1** op de PDP (most-popular badge).
  2. **Order bump** bij checkout (extra zak met kleine korting, or subscription).
  3. **Abonnement / refill**, terugkerende omzet, biggest LTV-lever for a daily product.
  4. **Value-stack op de e-books** ("2 e-books t.w.v. €X gratis").
  5. **Post-purchase upsell** (1-click extra zak of cadeau-zak voor vriendin/dochter).
- **No offer A/B tests live right now.** This is the gap.

### 3. Second brain setup (this vault)

- **Why:** The biggest operational drain isn't a specific workflow, it's **idea-vanishing** (see [[me]]). Until ideas survive across shifts, growth is bottlenecked by what Talat can hold in his head.
- **What now:**
  - This vault setup = step 1. ✓ (in progress, today)
  - Daily-note discipline: every idea / loop into the daily note as it surfaces.
  - Weekly review surfaces open loops → do / park / kill.
  - Claude proactively flags loops sitting unmade.

### 4. Post-purchase review flow (highest-CVR lever currently unbuilt)

- **Why:** The biggest unsolved problem in the bone funnel, **no real reviews** = the #1 conversion lever is missing for a sceptical avatar. Until reviews exist, ad copy and PDP carry the trust load on demonstration + guarantee alone.
- **What now:** Build the flow in Klaviyo: confirmation → dosing instruction → expectation-setting (aanpassingsperiode) → request review at ~14-21 days.

## Explicit nos (juni-lijst, herbevestigen voor juli)

To focus on the priorities above, **not doing** until June close (juli-versie nog door [[me|Talat]] te bevestigen; de UK-launch doorbrak de "no new experiments"-geest van deze lijst al):

- **No baby-koliek funnel work.** Parked. Different avatar, different compliance.
- **No huid / eczeem 50+ funnel work.** Parked. Different avatar.
- **No TikTok Shop / Google Ads / Pinterest experiments.** Meta CBO is the channel, double down.
- **No new SKU.** One product, one funnel, sharper.

## Open analytical items (still relevant)

These shape strategy decisions even though they're not full "projects":

1. **Meta ↔ Shopify reconciliation**, calculate correction factor so we stop under-reading every ROAS. Highest analytical priority.
2. **Ad-level export**, current data is ad-set level only. We see which angle wins, not which hook. Needed to unlock hook-level optimization.
3. **COGS / margin per bundle**, needed for break-even ROAS.
4. **Zakgrootte / dagen per zak**, needed for "kost per dag"-framing + refill timing.
5. **E-book inhoud + titels**, needed for value-stack copy + email flows.

## Risks / dependencies

- **Concentration risk on `Calcium_AS3`**, large share of all spend (see performance data in `/Goatly_kennis/performance_data.md`). If it fatigues, revenue halves. Mitigation: build successors in the BOF cluster.
- **Tracking lag (WeTracked)**, every ROAS we look at is a floor. Never kill purely on reported ROAS.
- **Solo operator + 5-shift schedule**, bandwidth is the bottleneck. Vault + automation has to deliver real time savings.

## Personal calendar

- **2027**, trouwen.

## Cross-links

- [[me]], the personal why.
- [[business]], Goatly snapshot.
- [[icp]], proof-gap that priority #4 closes.
- [[infrastructure]], stack and tracking caveats.
