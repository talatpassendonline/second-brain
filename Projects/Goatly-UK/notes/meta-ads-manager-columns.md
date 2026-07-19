---
type: note
project: Goatly-UK
tags: [goatly, uk, meta, ads-manager, reporting]
date: 2026-07-18
---

## Meta Ads Manager kolommen (de set die [[me|Talat]] gebruikt)

Gereconstrueerd uit de [[NOVA]] adset-export (jul 2026). Zo terug te zetten in Ads Manager → Columns → Customise.

**Volgorde in de UI (begint bij Ad set name; de datum/reporting-kolommen zet Meta zelf bij de export):**

1. Ad set name
2. Ad set delivery
3. Ad set budget
4. Ad set budget type
5. Amount spent
6. Purchase ROAS (return on ad spend)
7. Purchases conversion value
8. CPM (cost per 1,000 impressions)
9. CTR (link click-through rate)
10. CPC (cost per link click)
11. Unique link clicks
12. Adds to cart
13. Cost per add to cart
14. Purchases
15. Cost per purchase
16. Reach
17. Frequency

**Export voegt automatisch toe:** Reporting starts, Reporting ends (vooraan) en Date created, Date last edited (achteraan).

**Waar je op stuurt:** Cost per purchase = je CPA (kill-lat ~€38 eenmalig, tot ~€50 bij subs, Shopify-gereconcilieerd). Adds to cart + Cost per add to cart om te zien of een lek bovenin (ad) of in de checkout (PDP) zit. Frequency voor vermoeidheid. Zie [[2026-07-14]] voor de break-even/CPA-logica.

**Aanrader bij ad-niveau lezen:** voeg **Ad name** toe, dan zie je welke hook/creative het deed, niet alleen welke angle-adset (dit was het open gat: alleen adset-niveau data).
