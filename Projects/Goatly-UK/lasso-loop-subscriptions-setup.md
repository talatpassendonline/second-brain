---
type: project-tracker
project: Goatly-UK
status: in-progress
date: 2026-07-09
tags: [goatly-uk, lasso, loop, subscriptions, mrr, klaviyo]
---

## Wat is wat

[[Goatly]] gaat abonnementen (MRR) draaien. Twee lagen:
- **Loop** (Loop Subscriptions) = de Shopify-app die de subscriptions + selling plans draait.
- **Lasso** (lassocart.com) = de laag erboven: klantenportal, magic links, en de Klaviyo subscription-events.

Beide stores: [[Goatly]] NL + Goatly UK.

## Checklist (agency-instructies 2026-07-09)

- [ ] **1. Loop installeren** op beide stores. (Talat, Shopify admin) → alles hangt hieraan.
- [ ] **2. Support@lassocart.com uitnodigen in Loop** als Admin. (Talat, Loop settings) → agency maakt config voor je af.
- [ ] **3. Selling plans aanmaken** voor de producten in Loop, met frequenties 1/3/5 mnd + 25%. (Talat in Loop; Claude verifieert via Shopify API)
- [ ] **4. Pack sizes via Kaching Bundles** (NIET Shopify-varianten). Kaching regelt de 1/3/5-tiers. Voor subs: Subscriptions-toggle AAN in Kaching + Kaching-support de widget laten syncen met de Loop selling plan (vereiste stap per Loop-docs). Check korting-interactie (25% bovenop bundelprijs of vervangt die?) + tier-naar-frequentie mapping. Gift = duplicaat-SKU buiten selling plans.
- [ ] **4b. MRR/PDP-selector** verschijnt via Kaching-bundel + Loop-widget. (Claude helpt wiren in git-theme indien code nodig)
- [ ] **5. Customer management portal** opzetten + koppelen aan Shopify. (per Lasso-doc)
- [x] **6. Klaviyo, event 1: subscription-data naar klant** → 5 lifecycle-flows gebouwd + geseed.
- [x] **7. Klaviyo, event 2: magic links naar portal** → portal-flow gebouwd + geseed.

## Klaar (Klaviyo-kant)
6 HTML-mails in `Goatly_kennis/email/flows/`: portal magic link, welcome, rebill receipt, cancellation requested, canceled, paused. Metrics geseed via test-event (public key TZfimz). Zie `lasso-subscription-lifecycle-reference.md`.

## Prijs selling plans (2026-07-09, definitief richting)
Verkocht per pouch (1 pouch = 30 dagen aanname). One-time + 25% Subscribe & Save.
Beslissing 3-pack: £59.95 (NIET £54.95). Reden: £54.95 = £18.32/pouch, te dicht op 5-pack
(£17.99/pouch) → kannibaliseert de 5-pack upsell. £59.95 houdt £1.99/pouch gap + clean
"3 voor de prijs van 2"-verhaal.

| Plan | Los (anker) | Subscribe & Save 25% | Per pouch (sub) |
|---|---|---|---|
| 1 pouch | £29.95 | £22.46 | £22.46 |
| 3 pouches (meest gekozen) | £59.95 | £44.96 | £14.99 |
| 5 pouches (beste deal) | £89.95 | £67.46 | £13.49 |

Verkoop op per-dag (5-pack sub = ~45p/dag als 1 pouch=30d) + losse prijs doorstrepen.
25% exact laten staan (Save 25%-badge > afgerond bedrag). Marge = Talat's call.
Oude £49.95-gebaseerde tabel was te duur, vervangen.

## Diagnose 2026-07-09 (testorder) — GECORRIGEERD
Eerste lezing was fout. Shopify toont `sellingPlan: null` op order #1057 en lege `sellingPlanGroups`, MAAR het Lasso-dashboard toont de sub WEL: 1 active subscriber, MRR $35.11 (≈ £26.21 = 1-pouch maandprijs). 
Verklaring: Lasso beheert de subscription via z'n EIGEN billing (Lasso = payment provider), niet via Shopify-native selling plans. Daarom is `sellingPlan: null` in Shopify verwacht, niet kapot. Bron van waarheid = Lasso-dashboard, niet Shopify sellingPlan.
NB: Shopify `subscriptionContracts` veld = access denied (scope), dus kon daar niet cross-checken.
Te bevestigen: (1) betaalmethode opgeslagen zodat rebill echt afschrijft (test met 100% off = mogelijk geen kaart), (2) echt Klaviyo `Subscription Created`-event binnengekomen voor talat@, (3) portal + magic link op account.trygoatly.com. 
OPEN VRAAG: draait Loop óók als tweede subscription-engine? Niet dubbel willen. Uitzoeken welke engine live is.

## Volgorde-afhankelijkheid
Selling plans (3) en de PDP-selector (4) bestaan pas ná Loop-install (1). De Klaviyo-flows vuren pas als er via Loop een echt subscription-event binnenkomt. Dus: install eerst, dan de rest.

## Test end-to-end (na stap 1-5)
Test-abonnement op eigen mail (100% off) → `Subscription Created` vuurt → echte Welcome-mail in inbox. Daarna magic link aanvragen op account.trygoatly.com → portal-mail. Werkt dat, dan staat het systeem live.
