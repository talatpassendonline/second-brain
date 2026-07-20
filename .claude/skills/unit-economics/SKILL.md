---
name: unit-economics
description: Drie-lagen-economics-audit (ads, funnel, backend) plus constraint-diagnose via funnel-stap drop-offs. Gebruik bij performance reviews, scale-beslissingen, "waarom verkoopt dit niet", kill/keep-calls en LTV/AOV-vragen. Bron: Mark (Build Brands) + Dan Kennedy.
---

# Unit Economics

Doctrine uit [[mark-buildbrands-8-years-marketing-advice-transcript]]: metrics zijn indicatoren, geen constraints. Een lage CVR zegt dat mensen niet kopen, niet waarom. Wie het meest kan betalen per klant wint (Dan Kennedy).

## De drie lagen

1. **Ad-economics**: CPM, CPC, CTR. Doel: goedkoopst mogelijke traffic die nog gekwalificeerd is. Lees ze verbonden, nooit los (diagnose-boom in [[mark-buildbrands-ads-diagnosis-transcript]]: hoge CTR + hoge CPM = curiosity-clicks of CPM-strafheffing, geen goede ad).
2. **Funnel-economics**: max conversies × max AOV. Sub-metrics boven CVR: PDP→ATC (KPI 10%) en ATC→purchase. Elke euro extra AOV is een euro extra biedruimte boven elke concurrent.
3. **Backend-economics**: LTV via subscription of ascension. LTV = AOV betekent repeat rate nul; dat is een constraint-indicator op zich. Norm: LTV:CAC minimaal 3:1 (ecom).

## Procedure

1. **Data reconciliëren vóór oordelen.** Ad-account-data is post-iOS14 5-50% vertekend. Voor [[Goatly]]: Shopify-orders zijn de waarheid, Meta is een schatting (bewezen 18 jul: Meta 2/€84, echt 3/€163). Kolommenset: [[meta-ads-manager-columns]].
2. **Loop de lagen in volgorde af** en benoem per laag: gezond / verdacht / constraint. Gebruik de kill-latten en benchmarks uit kennisbank `performance_data.md` en `tracking/TRACKER_SOP.md`, niet generieke US-benchmarks.
3. **Van indicator naar constraint.** Bij een verdachte metric: zak één niveau dieper naar de funnel-stap waar de drop-off zit en benoem de mechanische oorzaak (wat ziet of ervaart de bezoeker daar). Voorbeeld-klasse: subscription-vinkje standaard aan, kapotte prijsladder, payment processor niet ingesteld.
4. **Breek-test bij elke launch.** Loop de funnel zelf als klant: ad → lander → PDP → cart → checkout. Doel is hem breken, niet hem goedkeuren. Doe dit vóór er spend op gaat.
5. **Entropie-check bij schaal.** Alles vervalt onder spend-verhoging (winnende ads sterven, CAC stijgt). Vraag per review: waar moet energie bij (nieuwe creatives, systeem, mens/AI) voordat het breekt?

## Output

Verdict per laag, één benoemde hoofdconstraint (niet drie), en de concrete volgende test. Cijfers altijd Shopify-gereconcilieerd met de bron erbij. Advies is advies; kill/keep is [[me|Talat]]'s call.
