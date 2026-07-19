---
type: reference
tags: [ads, media-buying, diagnose, metrics, funnel, transcript, goatly]
source: Mark (Build Brands) "my ads don't work: diagnose the bottleneck"
date: 2026-07-19
project: Goatly-UK
---

## Mark (Build Brands): de bottleneck diagnosticeren als ads "niet werken"

> Transcript aangeleverd door [[me|Talat]] (19 jul 2026). Diagnose-boom voor "ad no work": eerst bepalen of het een ads-probleem of een funnel-probleem is, dan pas fixen.

### Ads-kant: drie verbonden metrics

1. **CPC**: belangrijkste. Zijn US-benchmark: onder $1.50.
2. **CTR**: de graadmeter voor creative-kwaliteit, punt.
3. **CPM**: hoe graag Facebook je ads verspreidt.

**Ze bestaan niet in isolatie.** Zijn kernvoorbeeld: 8% CTR klinkt geweldig, maar met $2 CPC betekent dat ~$150 CPM. Dan heb je goede ads die Facebook haat, omdat ze te agressief zijn of de markt supercompetitief is. Meta kent twee soorten afwijzing: **harde** (account eruit) en **zachte** (hoge CPMs, lagere traffic-kwaliteit). Diagnose-regels:

- CTR laag → betere creatives maken.
- CPM heel hoog → agressie in claims en copy terugschroeven, ads maken die Facebook wil verspreiden.

### Funnel-kant: twee sub-metrics, niet de CVR

1. **PDP → add-to-cart ratio**, waar de meesten falen. KPI: **10%**. Op 10% weet je: de lander doet zijn werk, er is congruentie ad → lander, en de bezoeker toont verlangen vóór de actie.
2. **ATC → purchase ratio**, downstream.

Zijn stelling: staan die twee goed, dan is de conversion rate gegarandeerd gezond. CVR zelf is alleen een indicator om dieper te graven, geen stuurmetric.

### Mapping naar onze situatie

- **UK18 is zijn schoolvoorbeeld**: hoogste CTR (10%) maar dure CPM en nul ATCs. Dus niet "goede ad", maar: curiosity-clicks zonder kwalificatie, of een CPM-strafheffing. Sluit aan op de sokken-les uit [[evolve-winning-ads-from-non-converters-transcript]].
- De zachte-afwijzing-lens is extra relevant met onze accounthistorie ([[project-goatly-meta-cfs-ban|CFS-ban]]): agressie wordt bij ons eerder beprijsd in CPM. Meta scant ook de lander; het agressieve Primal-register op de advertorial is een dial om te onthouden als CPMs account-breed gaan kruipen.
- Zijn sub-metric-aanpak omzeilt precies ons kapotte-sessie-tracking-probleem: PDP→ATC en ATC→purchase zijn betrouwbaarder te meten (WeTracked events + Shopify orders) dan de CVR uit Shopify-sessies. Hoort bij de kolommenset in [[meta-ads-manager-columns]].
- De $1.50 CPC-benchmark niet rauw overnemen: longform native ads naar een advertorial kwalificeren zwaarder per click, dus onze CPC mag hoger liggen zolang de Shopify-gereconcilieerde CPA onder de kill-lat blijft.
