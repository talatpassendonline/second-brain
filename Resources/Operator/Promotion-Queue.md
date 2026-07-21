---
type: promotion-queue
owner: Vault-Operator
status: active
tags: [operator, promotion-queue, reflection]
---

# Promotion Queue

Sunday-reflection proposals from the [[business|Goatly]] Vault Operator. Each block is durable knowledge that surfaced in the daily session-laag but still needs promotion to the canonical layer. [[me|Talat]] approves or rejects per block; approved blocks get merged via the `/promote` command.

Last reflection: 2026-07-19T23:09:48Z

## 2026-07-18 . Performance shift . Nieuw ad account eerste leesmoment + oude-account slotexport

**Source:** `Daily/2026-07-18.md` (regel 9-13) + `Daily/2026-07-14.md` (regel 13-21)

**Verbatim from daily:**
> Blended echt over ~3 dagen (€217 spend): CPA €72, ROAS 0,75. Onder break-even (~€38 CPA / ~1,45 ROAS), maar dag 3 en in learning: niet killen, 3-7 dagen laten lopen. Per ad set: UK04 nurse grootste slokop (€60, ROAS 0,51), UK03 dicht bij break-even (1,26), UK02 beste top-funnel.

**Proposed promotion target:** `Goatly-Knowledge/performance_data.md`

**Proposed addition** (full text [[me|Talat]] can copy / approve as-is):

```
## UK relaunch, nieuw ad account (vanaf 15 jul 2026)

Oude account (Trygoatly.nl) geband ~13 jul wegens CFS/scam-signalen. Slotexport oude account (26 jun t/m 14 jul, €3.106 spend, blended ROAS ~1,05):

| Ad | Spend | Purch. | CPA | ROAS |
|---|---|---|---|---|
| Carol_19Years_UK02 | €310 | 10 | €30,96 | 2,13 |
| Sarah_5Things_UK03 | €246 | 8 | €30,70 | 2,05 |
| Sarah_Nurse_UK04 | €1.576 | 25 | €63,02 | 0,90 |
| Wendy_HalfFullPot_UK17 | €157 | 3 | €52,48 | 1,15 |

Nieuw account (14-18 jul, ads gestart 15 jul), blended ~3 dagen €217 spend: CPA €72, ROAS 0,75, onder break-even (~€38 CPA / ~1,45 ROAS), dag 3 en in learning. Meta onderrapporteerde: 2 sales / €84 in Ads Manager vs 3 sales / €163 in Shopify. Oordelen op Shopify. Per ad set: UK04 nurse grootste slokop (€60, ROAS 0,51), UK03 dicht bij break-even (1,26), UK02 beste top-funnel (goedkoopste ATCs €10,76), UK18 hoogste CTR (10%) maar dure CPM en 0 ATC.
```

**Reasoning:** `performance_data.md` is sinds 29 juni niet meer bijgewerkt en mist zowel de slotcijfers van het oude account als de eerste data van het nieuwe. Dit is de canonieke plek voor CPA/ROAS-historie.

- [ ] **Approve**
- [ ] **Reject**

## 2026-07-14 . Decision . Relaunch-setup nieuw account (1 CBO, 7 ad sets, verse pixel)

**Source:** `Daily/2026-07-14.md` (regel 38 + pixel-warning 34-36)

**Verbatim from daily:**
> 1 CBO €100/dag → 7 ad sets, elk 1 ad met eigen creative: 5 verse TOF zonder caps + UK04-nurse max €30/dag (feeder-kooi) + BOF max €10-15/dag vanaf dag 1. Purchasers 180d uitsluiten in alle 7 ad sets (ook CFS-bescherming). Besluit: verse pixel, opnieuw opbouwen (oude pixel + warme pools onherstelbaar).

**Proposed promotion target:** `Intelligence/decisions/2026-07-14-uk-relaunch-account-setup.md`

**Proposed addition** (full text [[me|Talat]] can copy / approve as-is):

```
---
type: decision
date: 2026-07-14
project: Goatly-UK
status: active
tags: [goatly-uk, meta, relaunch, cbo, pixel]
---

Na de CFS-ban van het oude [[Goatly-UK]] ad account koos [[me|Talat]] voor een schone herstart op moeders BM. Structuur: 1 CBO €100/dag met 7 ad sets, elk 1 ad met eigen creative. Vijf verse TOF zonder caps (UK02, UK03, UK18, UK19, Helen_UK20), UK04-nurse als gekooide feeder op max €30/dag, en BOF op max €10-15/dag vanaf dag 1. De BOF-cap is verplicht: een CBO overvoedt warm publiek en laat de TOF-vullers anders verhongeren. In alle 7 ad sets worden purchasers 180d uitgesloten, mede als CFS-bescherming.

De oude pixel en warme pools bleken onherstelbaar: de system-user-token "Goatly Ops" leeft nog maar ziet nul assets sinds de BM restricted raakte. Besluit: verse pixel op moeders BM, trygoatly.com opnieuw als domein verifiëren, opnieuw opbouwen.
```

**Reasoning:** Concrete besluit met redenering (feeder-these, BOF-cap-logica, pixel-verlies) dat de hele relaunch-architectuur vastlegt. Hoort in de canonieke beslissingslaag, niet alleen in een daily.

- [ ] **Approve**
- [ ] **Reject**

## 2026-07-18 . Decision . Primal-advertorial swap (adv2 = Primal-versie)

**Source:** `Daily/2026-07-18.md` (regel 28-31)

**Verbatim from daily:**
> Swap (19 jul, Talat's besluit na vergelijking): de Primal-versie verkoopt naar verwachting beter (verdict-koppen dragen de hele belief-chain voor skimmers, eerste CTA na ~457 vs ~701 woorden). /pages/adv2-news-bones (waar alle 17 live ad-links heen wijzen) serveert nu de Primal-versie; de lange kalme versie is bewaard op /pages/adv3-news-bones.

**Proposed promotion target:** `Intelligence/decisions/2026-07-18-primal-advertorial-swap.md`

**Proposed addition** (full text [[me|Talat]] can copy / approve as-is):

```
---
type: decision
date: 2026-07-18
project: Goatly-UK
status: active
tags: [goatly-uk, advertorial, copy, primal]
---

[[me|Talat]] koos na directe vergelijking voor de agressieve Primal-register-advertorial boven de lange kalme versie. Redenen: verdict-koppen ("The Professors Are Right. Your Tablet Is Rubbish.") dragen de hele belief-chain voor skimmers, eerste CTA valt na ~457 vs ~701 woorden, 2.388 vs 3.590 woorden totaal, en Primal Remedies draait dit format op schaal bij dezelfde avatar. Guardrails hielden bij beide Sonnet-passes: 0 em-dashes, 0 verboden ad-T-scores, Eileen-reversal -2,8 naar -2,4 intact, geen uitroeptekens, agressie richt zich op de tablet en nooit op de lezeres.

Implementatie: `/pages/adv2-news-bones` (waar alle 17 live ad-links heen wijzen) serveert nu de Primal-versie, de kalme versie staat bewaard op `/pages/adv3-news-bones`. Geen ad-link hoefde aangepast. Master-referentie: kennisbank `Advertenties/UK/advertorial_adv3_primal_stijl.md`.
```

**Reasoning:** Structurele copy-richtingkeuze met falsifieerbare redenering (woordtelling, CTA-positie, format-precedent) die de live funnel bepaalt. Canoniek beslissingsmateriaal.

- [ ] **Approve**
- [ ] **Reject**

## 2026-07-18 . Decision . CBO-consolidatie + nurse itereren i.p.v. killen

**Source:** `Daily/2026-07-18.md` (regel 50 + 52)

**Verbatim from daily:**
> Advies op data: 3 pauzeren, niet 4: UK18 (€43,56, CPM €137, 31 clicks → 1 ATC), UK19 en UK20 (samen 30% van de spend voor 1 ATC en 0 sales). Nurse-besluit (niet killen, itereren): een ad die veel spend/engagement pakt maar niet converteert zet je niet uit, je maakt 'm conversie-gedreven.

**Proposed promotion target:** `Intelligence/decisions/2026-07-18-cbo-consolidatie-nurse-iterate.md`

**Proposed addition** (full text [[me|Talat]] can copy / approve as-is):

```
---
type: decision
date: 2026-07-18
project: Goatly-UK
status: active
tags: [goatly-uk, meta, cbo, kill-rules, nurse]
---

Consolidatie-besluit op de CSVs 14-18 jul (€302,86 totaal): 3 ad sets pauzeren, niet 4. Weg: UK18 (€43,56, CPM €137, 31 clicks naar 1 ATC, Mark's curiosity-click-patroon), UK19 (€21, 0 ATC) en UK20 (€25, 0 ATC). Houden: UK04 (CPM €51, 1 sale, CBO-favoriet), UK03 (ROAS 1,02), UK02 (4 ATCs à €9,23, waarschijnlijk de ongetrackte 3e sale). Nieuwkomers UK17/UK21/UK22 eerst hun kill-lat van ~€25-30 geven. In één edit pauzeren (elke wijziging reset learning).

Nurse niet killen maar itereren: een ad die veel spend/engagement pakt maar niet converteert zet je niet uit, je maakt 'm conversie-gedreven (Evolve-playbook 06 §2). Twee fixes: scherpere avatar-callout in de hook (de trouwe calcium-slikker wiens scan niet verbetert) en de loop openhouden. Actie: [[uk-nurse-tesco-carpark-longform-native|Nadine v2]] in-swappen, [[uk-osteoporosis-nurse-reversal-longform-native|Yvonne]] draaien, €30-cap houden tijdens itereren.
```

**Reasoning:** Kill/scale-besluit met expliciete redenering en een herbruikbare regel (converterende feeder itereren i.p.v. killen). Hoort bij de canonieke kill-rules, niet alleen in een daily.

- [ ] **Approve**
- [ ] **Reject**

## 2026-07-18 . Tool / infra . Shopify CLI als vaste deploy-route

**Source:** `Daily/2026-07-18.md` (regel 25-26)

**Verbatim from daily:**
> Nieuwe vaste deploy-route: git commit (bron van waarheid) + shopify theme push --theme 202877141334 --only <files>. Root cause definitief: op 10 jul 23:57 is het thema gedupliceerd en de kopie ("Lasso") gepubliceerd, sindsdien gingen alle git-pushes naar de onzichtbare GitHub-draft.

**Proposed promotion target:** `Context/infrastructure.md`

**Proposed addition** (full text [[me|Talat]] can copy / approve as-is):

```
## Goatly UK thema-deploy

Het live thema is "Lasso" (#202877141334) en is sinds 10 jul NIET meer git-gekoppeld: op 10 jul 23:57 werd het thema gedupliceerd en de kopie gepubliceerd tijdens de Lasso-checkout-setup, waardoor alle git-pushes naar de onzichtbare GitHub-draft (trygoatly/uk) gingen. Vaste deploy-route sindsdien: git commit als bron van waarheid, daarna `shopify theme push --theme 202877141334 --only <files>`. Shopify CLI staat geïnstalleerd en geauthenticeerd op de machine. Verifiëren met `theme pull` via de API, want de publieke pagina hangt daarna nog even in Shopify's full-page cache. Zie [[reference_goatly_uk_theme]].
```

**Reasoning:** Nieuwe canonieke werkwijze voor thema-deploys die de onzichtbare-draft-val vermijdt. Infrastructuur-niveau, hoort in `infrastructure.md`, niet begraven in een daily.

- [ ] **Approve**
- [ ] **Reject**

<span style="background-color:#2d5238; color:#f5efe3; padding:2px 8px; border-radius:3px; font-size:0.85em;">🤖 Goatly Vault Operator . last edited: 2026-07-19T23:09:48Z</span>
