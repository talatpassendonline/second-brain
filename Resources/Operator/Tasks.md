---
type: task-list
owner: Vault-Operator
status: active
tags: [operator, tasks, backlog]
date: 2026-06-17
---

# Vault Operator Tasks

Rolling backlog for the [[business|Goatly]] Vault Operator. Open loops surfaced from prior dailies, strategy priorities without a `Projects/` home, and housekeeping items that exceed a single run's fix budget land here. One run = one delta; this file persists what didn't fit.

Last run: 2026-06-27T09:00:00Z

> [!info] Scope
> Sources: `Daily/*.md`, `Context/strategy.md`, and the whole vault for housekeeping. Protected files (any `CLAUDE.md`, `Context/brand.md`, `Context/business.md`, `Context/strategy.md`) cannot be auto-fixed. [[me|Talat]] handles those by hand when ready.

## Open Loops

Catch-up 2026-07-06 (vault-audit): de operator heeft sinds 27 juni geen loops meer gesurfaced terwijl er 15 open checkboxes ouder dan 48h in de dailies stonden. Hieronder verbatim, met bron.

Uit `Daily/2026-06-29.md` (advertorial/store):
- [ ] Prijs-alignment (3-pack £64.95 advertorial vs £59.95 cart, 5-pack £99.95 vs £104.95 in ads) . source: Daily/2026-06-29.md
- [ ] Review-sectie toevoegen zodra echte reviews binnenkomen (plek gereserveerd tussen sectie 5 en offer) . source: Daily/2026-06-29.md
- [ ] A/B testen v1 vs v2 of v2 direct live zetten . source: Daily/2026-06-29.md

Uit `Daily/2026-07-02.md` (aankoop-stopper audit + PDP-lek):
- [ ] **#1 kortingsclaim: advertorial zegt 3x "up to 70% OFF", PDP zegt "UP TO 30% OFF"**. Hardste stopper. Welk percentage is echt (Kaching)? Sidebar belooft ook "FREE GIFTS" die de PDP niet toont. . source: Daily/2026-07-02.md
- [ ] #4 drie schaarste-verhalen (47 pouches statisch / 6 weken wachttijd PDP / 8 dagen in Nadine-ad): één batch-verhaal kiezen . source: Daily/2026-07-02.md
- [ ] #6 danger-tease payoff versterken vóór UK04v2 live gaat ("where it ends up"-alinea, mag hard op advertorial per canon) . source: Daily/2026-07-02.md
- [ ] PayPal Express activeren UK + NL/BE-betaallogo's uit UK-market halen (hoofdverdachte PDP-CVR-lek) . source: Daily/2026-07-02.md
- [ ] Trust-regel onder koopknop: "Free UK delivery in X days. No customs charges." . source: Daily/2026-07-02.md
- [ ] NL-testimonialblok (6 stuks) vertalen naar UK PDP . source: Daily/2026-07-02.md
- [ ] Talat checkt: Kaching-bundels UK vs NL gelijk (Most Popular, e-books-bonus)? + PDP-header zei eerst "30% OFF", nu "70% OFF": zelf aangepast of dubbele claim? . source: Daily/2026-07-02.md
- [ ] HTML-versie in kennisbank (`advertorial_uk_v3_html.html`) is verouderd t.o.v. v4 . source: Daily/2026-07-02.md
- [ ] Advertorial: "where it ends up"-alinea versterken zodat UK18's danger-tease harder afbetaald wordt . source: Daily/2026-07-02.md
- [ ] Shopify-connector opnieuw koppelen op de Goatly UK store → volledige funnel-doorlichting (ATC → checkout → purchase, P1/P3-verdeling voor de [[90-day-cycle-aov-fix|AOV-fix]]) . source: Daily/2026-07-02.md
- [x] ✅ 2026-07-06 NL-terugval verklaard: NL-ads bewust uitgezet, main focus UK ([[me|Talat]]). Vastgelegd in [[business]] + [[strategy]]. . source: Daily/2026-07-02.md

Uit `Daily/2026-07-03.md`:
- [ ] Business verification checken/afronden (grootste factor bij BM-reviews) . source: Daily/2026-07-03.md

Nog niet 48h oud (blijven in de daily): de 3 setup-checkboxes in `Daily/2026-07-05.md` (Help & Contact page aanmaken in Shopify admin, levertijd-claim checken, 17TRACK checken).

Uit `Daily/2026-07-06.md` (contactpagina, expliciet geparkeerd door [[me|Talat]] tot de site af is):
- [ ] 17TRACK Order Number tab werkend krijgen op UK store: app geïnstalleerd maar tab werkt nog niet. Checken: tracking page aan in de 17TRACK app-instellingen, proxy-pad op trygoatly.com (NL = `/apps/17TRACK`, hoofdlettergevoelig), pad zo nodig aanpassen in customizer bij Order tracking sectie, order-sync venster/plan. . source: Daily/2026-07-06.md

> [!warning] Operator-pipeline zelf is een open loop
> De scheduled task `goatly-vault-operator-daily` vuurt dagelijks (laatste run 5 juli 17:00 UTC) maar heeft sinds 17 juni geen rapport meer geschreven en deze file sinds 27 juni niet meer bijgewerkt. Runs falen stil. [[me|Talat]]: check de run-output van de scheduled task. De oude uitgeschakelde duplicaat-task `vault-operator-daily` kan weg.

## Strategy Gaps

`Context/strategy.md` lists 4 active priorities for Q2/Q3 2026. The two `Projects/` folders that now exist ([[Goatly-UK]] and [[Lichtendirect]]) do not map to any of these four, so the gap picture is unchanged from the prior run. Per the strategy doc, scaffolding is intentionally deferred: [[me|Talat]] wants to discuss folder structure before creating it. Surfaced here so they do not vanish.

- Priority "VSL learning + production": no `Projects/VSL-Launch/` folder. Parked pending scaffolding decision.
- Priority "AOV optimization (€67,22 → higher)": no `Projects/AOV-Optimization/` folder. Parked pending scaffolding decision.
- Priority "Second brain setup (this vault)": running in-place; no `Projects/` folder needed by design.
- Priority "Post-purchase review flow": no `Projects/Email-Review-Flow/` folder. Parked pending scaffolding decision.

## Housekeeping Queue

Em-dash sweep stays the highest-volume long-tail item. Budget cap is 5 fixes per run; the rest queue here, oldest unhandled at top so they bubble up next run.

The entire prior queue ([[infrastructure]], [[icp]], [[pain-points]], [[team]] and the three [[Skills]] files) now reads **0 em-dashes**: all cleaned since the 2026-06-16 run. Removed from queue. The new em-dash debt sits in the two project folders that landed since.

Auto-fixable: **queue leeg per 2026-07-06** (vault-audit). Alle em-dash debt gestript: uk-unaware-ad-the-belly (15 structurele labels), uk-market-awareness (2), header-pdp-optimalisatie (6 headings; de Liquid-comment in shipped code bewust laten staan), apify-scrape-spec (3), 90-day-cycle-aov-fix (2), Lichtendirect README (1). Resterende em-dashes in de vault zitten alleen in protected zones (code, inline-code, geciteerde headline-formule).

Cannot auto-fix (protected files, flagged for [[me|Talat]]):
- `Context/strategy.md`: 0 em-dashes now (was 22). Cleaned by [[me|Talat]]. No action.
- `Context/business.md`: status unconfirmed this run (protected, not scanned line-by-line). Re-confirm next run.
- `Context/brand.md`: status unconfirmed this run (protected). Re-confirm next run.
- `CLAUDE.md` (root): 0 em-dashes now (was 2). Cleaned. No action.

Other lint debt to rotate through future runs:
- Cross-link sections across `Context/*.md` use bulleted lists of `[[link]]: description`. CLAUDE.md anti-pattern says weave wikilinks into sentences, not as bullet lists. Vault-wide convention currently; defer until [[me|Talat]] decides whether to keep the convention or restructure.
- `Context/me.md` has 0 callouts; CLAUDE.md rule 5 wants 1 to 3 per substantial doc. Flag without auto-fix (callout placement requires judgement).
- `Projects/Goatly-UK/` and `Projects/Lichtendirect/` have no `CLAUDE.md` index and README-only structure so far. Per `Projects/CLAUDE.md` the README is the index; fine for now. Re-check frontmatter `project:` field on subfiles next run.

## Completed

- [x] ✅ 2026-07-06: Vault-audit (os-optimizer, 9 frameworks): em-dash sweep afgerond, 9 dubbele H1's gestript, 14x `[[Goatly]]` → `[[business|Goatly]]`, 6 podcast-transcripts hernoemd naar `{slug}-transcript.txt`, Goatly-UK README + angle-test-board geactualiseerd, 15 open loops hierboven gesurfaced. Rapport: `Intelligence/decisions/2026-07-06-vault-audit.html`.

- [x] ✅ 2026-06-27: Stripped 5 em-dashes from `Projects/Goatly-UK/research/uk-market-awareness.md` (failed-solutions list, em-dash → comma).
- [x] ✅ 2026-06-27: Reconciled stale Housekeeping Queue. Old `Context/*` + `Skills/*` em-dash items all verified clean (0 each), removed. New `Projects/*` em-dash debt queued.
- [x] ✅ 2026-06-17: Stripped 5 em-dashes from `Context/me.md` (1 parenthetical + 4 cross-link bullets).
- [x] ✅ 2026-06-17: Bootstrapped this file. First operator run.

<span style="background-color:#2d5238; color:#f5efe3; padding:2px 8px; border-radius:3px; font-size:0.85em;">🤖 Goatly Vault Operator . last edited: 2026-06-27T09:00:00Z</span>
