---
type: spec
date: 2026-07-21
project: Passendonline
status: design
tags: [automation, agent, cloud-routine, dashboard, ship-loop, passendonline]
priority: high
---

Ontwerp voor een onbemande agent die de agent-taken van het [[Passendonline]]-dashboard afwerkt en afvinkt terwijl [[me|Talat]] er niet is. Cloud, want de laptop mag niet 24/7 aan. Voortbouwend op de [[ship-loop-automation|Lichtendirect ship-loop]].

## Kernidee: de app is het knooppunt

Vault en dashboard concurreren niet als twee bronnen; ze werken samen via de app-API die Talat al gebouwd heeft.

- **App (Neon) = bron van waarheid voor taak-STATE** (`tasks.owner` = talat|agent|klant, `tasks.done`). Zowel de cloud-agent als de vault praten hiernaartoe.
- **Vault `taken.md` = menselijke invoer + operator-notitie** (mail-sweep dropt hier nieuwe items, Talat schrijft hier). Synct naar de app.
- **Cloud-doer = werkt puur op de app-API**, heeft de vault of de laptop niet nodig.

Zo coöpereren ze: de app is de gedeelde tafel. De vault voedt de app en spiegelt de done-status; de cloud-agent handelt op de app. Geen drift zolang één reconciliatie-stap de vault ↔ app gelijk houdt (draait lokaal wanneer de machine aan is).

## Twee agents, gescheiden rollen

1. **Cloud-doer (24/7, geen laptop).** Leest `owner=agent` open taken uit de app-API, doet de veilige, voert de [[ship-loop-automation|ship-loop]] uit op de theme-repo, vinkt af via de API, schrijft een rapport. Draait als cloud-routine (schedule-skill).
2. **Lokale operator (wanneer machine aan, haalt gemiste runs in).** Gmail mail-sweep → vault + app, en reconcilieert vault ↔ app. Blijft lokaal omdat de Gmail-connector in headless cron kan ontbreken.

Bewust gescheiden: één agent triageert/voedt, één voert uit. Houdt de veiligheidsgrens scherp.

## Cloud-architectuur (gekozen: GitHub Actions)

De scheduler-tool van de schedule-skill draait LOKAAL (alleen als de app openstaat), dus ongeschikt voor "laptop mag uit". Gekozen: **GitHub Actions cron** in de theme-repo, draait op GitHub's servers.

- **Actie:** `anthropics/claude-code-action@v1`, trigger `schedule:` (nachtelijk) + `workflow_dispatch:` (handmatige testrun). Leest `.agent/ship-loop-brief.md` als prompt.
- **Repo-toegang:** de ingebouwde `GITHUB_TOKEN` van Actions (met `permissions: contents/pull-requests: write`). **Geen GitHub PAT nodig** (de eerder geplakte token is dus overbodig voor deze aanpak, gewoon intrekken).
- **Claude draaien:** op Talat's abonnement via `CLAUDE_CODE_OAUTH_TOKEN` (uit `claude setup-token`, geldig 1 jaar). Geen losse API-key/kosten.
- **Taken lezen:** optioneel de publieke app-API `…/api/admin/tasks?key=$APP_PASSWORD&owner=agent`. In propose-modus markeert de agent niks als done.
- **Verify:** geen echte browser in de cloud, dus de agent levert PR's en Talat doet de visuele check + publiceert. Dat is precies waarom propose-modus + GitHub Actions samen kloppen.
- **Geïmplementeerd:** PR #18 op `talatpassendonline/lichtendirect-woodstock-theme` (`.github/workflows/ship-loop.yml` + `.agent/ship-loop-brief.md`).

## Mini app-fix (nodig)

Read-endpoint `/api/admin/tasks` geeft nu `owner` niet terug, dus de agent kan niet filteren op agent-taken. Toevoegen: `owner` in de output of een `?owner=agent`-filter. Kleine edit in `~/passendonline-dashboard`, deploy op Vercel.

## Wat Talat moet doen om PR #18 te activeren (secrets in GitHub, niet in de chat)

1. **Repo-secret `CLAUDE_CODE_OAUTH_TOKEN`**: waarde uit `claude setup-token` in de terminal (abonnement, 1 jaar geldig).
2. **Repo-secret `APP_PASSWORD`**: het (nieuwe) dashboard-wachtwoord.
3. **PR #18 mergen** (een cron-workflow start pas op de default branch `main`).
4. **Testrun**: Actions-tab → Ship-loop → Run workflow → bekijk de PR('s) die de agent opent.

De eerder in de chat geplakte GitHub PAT is voor deze aanpak niet nodig; intrekken kan.

## Veiligheidsgrens (hard)

- **Mag onbemand:** staging-theme-wijzigingen (branch/PR/merge naar staging), drafts, eigen werk afvinken via de API.
- **Nooit, laat voor Talat:** live publiceren, mail of klantbericht sturen, verwijderen, financieel, connector-goedkeuring, en alles wat onduidelijk is → taak blijft open met reden in het rapport.
- Live gaat alleen via Talat's publiceer-knop. `main` = staging, niet live.

## Escalatie: propose → act

- ~~Fase 1 (propose)~~ afgerond op 21 jul: eerste twee agent-wijzigingen door review (PR #20 goed, PR #19 door Talat gevangen als app-kwestie: precies waarvoor propose bestond).
- **Fase 2 (act) ACTIEF sinds 21 jul** op verzoek van Talat ("kan je dit automatisch laten doen"): de agent merget zelf naar `main` (= staging) via git, geen PR-vinkje nodig, en logt elke aanpassing naar het dashboard-werklog. PR #20 + #21 door Claude gemerged; brief herschreven naar act-modus. Publiceren naar live blijft altijd menselijk.
- **Brief v3 (zelfde nacht, akkoord Talat):** het dashboard is nu de ENIGE takenbron. Agent leest `/api/admin/tasks?owner=agent`, filtert op clientId `lichtendirect`, doet max 2 kleine mechanische theme-taken per run, merget, logt naar werklog, en vinkt af via `&complete=`. Geschiktheids-vangrails in de brief (geen design/admin/app/metafields; bij twijfel laten staan). Talat voert taken in vanaf het dashboard met owner "agent". De hardcoded AUTO-OK-lijst is vervallen.

## Open

- **Workflow LIVE op `main`** (PR #18 gemerged + CI-fix `id-token: write` + expliciete `github_token` gepusht). Secrets `CLAUDE_CODE_OAUTH_TOKEN` + `APP_PASSWORD` staan gezet. GitHub-auth + Claude Code-init in de cloud werken (model claude-sonnet-5).
- **✅ LOOP WERKT (21 jul, run 6).** Debug-pad: (1) OIDC-fout → `id-token: write` + `github_token`; (2) "Header 'Authorization' has invalid value" → token bevatte regeleindes uit de chat-plak, gefixt met `printf | tr -d '[:space:]' | gh secret set`; (3) `error_max_turns` → limiet 25→80. Run 6: 46 turns, beide AUTO-OK-items correct gebouwd (geverifieerd tegen settings_schema + card-product.liquid), HOLD gerespecteerd. **PR #19 (Description→Productomschrijving) + PR #20 (cart_button_text visible)** door Claude geopend namens de agent.
- **Restpunt (Talat, één vinkje):** Actions mag zelf geen PR's openen. Repo Settings → Actions → General → "Allow GitHub Actions to create and approve pull requests" aanvinken; tot die tijd pusht de agent branches en opent Claude of Talat de PR's. (API-route werd voor Claude geblokkeerd door de permission-classifier.)
- `show_full_output: true` staat nog aan in de workflow voor debugging; uitzetten zodra de loop een paar nachten stabiel draait.
- **Cadans: elk uur 24/7** (cron `23 * * * *`). Terugschroeven naar elke 3 uur als het abonnement-verbruik gaat knellen. **Cron-trigger bewezen:** eerste zelfstandige vuring 21 jul 08:48 UTC (08:23-slot + 25 min GitHub-jitter); een vers schema doet er een paar uur over om te registreren, dat was de eerdere stilte.
- **`worklog-post.yml`** toegevoegd: handmatige workflow om een werklog-regel te posten via het secret (niemand raakt het wachtwoord aan). Eerste testregel (merge #20+#21) staat in het werklog (id 2).
- Uren-vraag beantwoord (21 jul): agent schrijft GEEN time_entries (facturatie-bron vervuilen + timesheet-lek). Optie besproken: werklog via afgevinkte bulk-tasks-regel per run; nog niet gebouwd, wacht op Talat's ja.
- **Talat: gelekte creds opruimen** — de in de chat geplakte GitHub PAT intrekken (niet meer nodig) en het dashboard-wachtwoord `passend2026` vervangen.
- ~~Mini owner-fix in de dashboard-app~~ **gedaan** op branch `feat/api-owner-filter` in `~/passendonline-dashboard` (`?owner=agent`-filter + `openDetailed`). Nog niet gedeployed: merge naar main + `vercel --prod` wanneer Talat wil.
- ~~Cloud-routine bouwen~~ **gedaan** als GitHub Actions PR #18 (propose-modus, gescoped op Lichtendirect).
- Na een paar goede propose-runs: promoveren naar act (agent merget naar staging + vinkt af via de API). Publiceren blijft altijd handmatig.
- ~~AUTO-OK backlog laten groeien~~ vervangen door de **akkoord-flow** (21 jul avond): taken hebben een `akkoord`-veld (leeg/wacht/ja), spec-taken komen op "wacht" binnen, Talat tikt "Akkoord geven" op de klanten-pagina (mobiel), en de brief verbiedt bouwen zolang akkoord != ja. Vier grove taken opgeknipt in specs in `.agent/tasks/`: usp-trust-strip, sticky-atc-mobiel, gerelateerde-carousel-opschonen, footer-trust; als wacht-taken in het dashboard gezet. Dashboard toont ook een **agent-statuskaart** (bezig met welke taak / slaapt, gevoed door workflow-meldingen naar `agent_status`).
- Multi-klant later: per klant-repo een eigen ship-loop-workflow.

## Review-agent in de ship-loop (22 jul)

Op Talat's vraag (na de halve-breedte-Afrekenen-knop: bouwer haalde een knop weg maar herstelde het grid niet). Elke ship-loop-run heeft nu een **tweede Claude-stap**: de reviewer krijgt `BASE_SHA`, diff't de commits van die run, controleert belofte-vs-diff, of de omgeving is afgemaakt, verboden terrein en Liquid-syntax. Klein gebrek → `review-fix:`-commit; ernstig → revert. Oordeel in werklog (source "review") en op de statuskaart. Gate-stap slaat de reviewer over als de bouwer niks mergde (idle runs blijven goedkoop). Brief van de bouwer kreeg ook de regel "maak af wat je aanraakt". Cart-fix zelf (Afrekenen volle breedte) staat op staging.

## Slimmer-ronde (23 jul)

Na herhaalde kwaliteits-missers (sticky-balk over hele PDP, theme-eigen sticky-cart niet echt uit): bouwer + reviewer naar **Opus**, `.agent/lessen.md` als verplicht geheugen (reviewer voegt lessen toe bij nieuwe missers), screenshots wachten nog op `STAGING_THEME_ID` van Talat.

## Derde agent: competitor-loop (23 jul)

Repo `passendonline-competitor-loop`, dagelijks ~07:41 NL. Scrapet publieke pagina's van NL-verlichtingsconcurrenten (`.agent/competitors.txt`), snapshots in git (diff = verander-detectie), vertaalt naar max 2 kleine test-ideeën per run als dashboard-taken met **akkoord "wacht"** → Talat keurt → ship-loop bouwt. Nooit contact, geen prijs-adviezen. Inert tot 2 secrets gezet zijn.

## Tweede agent: prospect-loop (22 jul)

Op Talat's vraag ("agent die bedrijven scopet en klant probeert te maken") de [[prospect-scout]]-methode naar de cloud getild, zelfde patroon als de ship-loop:

- **Repo `talatpassendonline/passendonline-prospect-loop`**: dagelijkse cron (~08:11 NL), `anthropics/claude-code-action@v1`, brief in `.agent/prospect-brief.md` (sweep → dossier → fit-oordeel → outreach-concept, max 5 leads/run, dedupe via de leads-API, wisselt per run van branche/regio).
- **Dashboard**: `leads`-tabel + `/api/admin/leads` (GET dedupe, POST, DELETE) + **Leads-pagina** met fit-badges, dossier, uitklapbaar concept-bericht en status-pijplijn (nieuw → benaderd → reactie → deal → afgewezen). In sidebar + mobiele nav.
- **Harde grens in de brief:** agent neemt NOOIT contact op (geen mail, geen formulieren, geen DM); alleen publieke info + dossiers. Talat verstuurt zelf.
- **Nog inert:** wacht op 2 repo-secrets (`CLAUDE_CODE_OAUTH_TOKEN` + `APP_PASSWORD`) die Talat vanavond zet via `gh secret set` op de nieuwe repo.
