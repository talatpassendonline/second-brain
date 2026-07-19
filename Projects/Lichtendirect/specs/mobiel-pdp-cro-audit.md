---
type: spec
date: 2026-07-13
project: Lichtendirect
client: Lichtendirect
status: in-progress
tags: [shopify, woodstock, cro, mobiel, productpagina, judge-me]
priority: high
---

Live mobiele audit (375px) van de PDP `15m LED Lichtsnoer Warm Wit - 30 Lampen, IP65` op 2026-07-13. Vult de eerdere werkorder [[header-pdp-optimalisatie]] aan met bevindingen die alleen op mobiel zichtbaar zijn. Aanleiding: [[me|Talat]] vindt de mobiele versie "niet echt iets". Deze audit legt uit waaróm en wat de hoogste CVR-hefbomen zijn. Nog niets live: connector-blocker uit [[header-pdp-optimalisatie]] geldt nog steeds.

> [!info] Wat live geverifieerd is
> - Beschrijving is inhoudelijk goed (IP65 vs IP44, 30.000 branduren, koppelbaar tot 150m, 2 jaar garantie, reservelampen) maar zit volledig dichtgeklapt achter een accordion met Engels label "Description".
> - Spec-tabel bestaat (2700K, 4cm, 15m, IP65) maar zit ook dichtgeklapt.
> - Reviews via Judge.me: 4.79/5 op 57 reviews (51x 5 ster, 6x 3 ster). Eerste review in de carousel is de 3-ster van Hans.

## Kernprobleem: de pagina voelt leeg + zaait twijfel

Twee grondoorzaken achter "niet echt iets op mobiel":
1. **De verkoopcontent is onzichtbaar.** Alle USP's en specs zitten dichtgeklapt of alleen als gallery-thumbnail. De body is daardoor grotendeels wit. Documenthoogte ~7000px met relatief weinig echte content.
2. **Een paar elementen zaaien actief twijfel op het beslismoment** (negatieve review vooraan, visuele glitches, dubbele cookiebanner).

## Top-hefbomen (op CVR-impact gesorteerd)

| # | Bevinding (mobiel) | Waarom het CVR kost | Fix |
|---|---|---|---|
| 1 | USP's + specs zitten dichtgeklapt achter "Description"/"Specificaties" | 80%+ mobiel tikt nooit open → verkoopt met lege PDP | 4-6 kern-USP's als **altijd-zichtbare icon-strip** direct onder prijs/CTA. Long-form mag in accordion blijven. |
| 2 | Eerste review in carousel is 3-ster van Hans: "geen warm gezellig licht. Te koud/fel/wit" | Ondermijnt de hoofdclaim (Warm Wit) precies op het aankoopmoment | Judge.me sorteren op meest-positief/behulpzaam, of sterke review pinnen. 51x 5-ster vooraan. |
| 3 | Meerdere schermen bijna leeg wit (na prijs, boven "Afhaling", tussen FAQ en footer) | Voelt leeg/kapot = exact de "niet echt iets"-klacht | Witruimte dichten + vullen met content uit punt 4. |
| 4 | Sterke infographics (Waarom dit lichtsnoer, merk-vergelijking, IP65-uitleg) zitten alleen als gallery-thumbnail #3-#5 | Beste overtuigingsmateriaal wordt niet gezien | Naar de body halen als echte content-blokken tussen buy-box en reviews. |
| 5 | "Gerelateerde producten"-carousel = 8 concurrerende lichtsnoeren + het product zelf | Keuzeverlamming + kannibalisatie, trekt van checkout weg | Inkorten tot accessoires/aanvullend, of vervangen door lengte-varianten-switcher. Product-zelf eruit. |
| 6 | Dubbele cookiebanner (Shopify consent + los "Deze website gebruikt cookies") | Twee bij load = frictie, dekt content af | Eén consent-mechanisme houden. |
| 7 | Gespookte dubbele sectiekop ("Gerelateerde producten" grote vervaagde tekst achter de echte kop) | Ziet er kapot uit | CSS-glitch fixen (waarschijnlijk decoratieve heading-layer). |

## Polish (lager, maar goedkoop)

- Engels label "Description" tussen Nederlandse tekst → "Productomschrijving".
- Amerikaanse datumnotatie in reviews (11/15/2025) → NL `15-11-2025`.
- Titel staat 2x bovenaan (volledige titel in breadcrumb + H1). Breadcrumb inkorten.
- Add-to-cart-knopjes in product-kaarten zijn alleen een tasje-icoon zonder tekst.
- Hoofd-ATC staat in de flow onder twee trust-accordions + countdown (sticky bar dekt dit grotendeels af, maar volgorde kan strakker).
- Countdown "Bestel binnen ~48m" is kort voor een 17:00-cutoff; als het een rollende timer is erodeert dat vertrouwen. Koppelen aan echte cutoff.

## Aanbevolen mobiele stapelvolgorde

1. Gallery
2. Korte H1 (geen dubbele titel)
3. Sterren + aantal reviews
4. Prijs + korting + voorraad
5. **USP icon-strip (altijd zichtbaar)** ← nieuw
6. Aantal + Add to cart (prominent)
7. Bezorg-USP als badge + betaalmethodes (uit [[header-pdp-optimalisatie]])
8. "Combineer nu met" bundel (staat er al, goed)
9. Content-blokken: infographics + IP65-vergelijking ← uit gallery gehaald
10. Volledige omschrijving (uitklapbaar)
11. Kernspecs inline + volledige spec-tabel uitklapbaar
12. Reviews (positief eerst)
13. FAQ
14. Gerelateerd (ingekort)

## Nuance op Anna's brief

Anna's wens 5 was "omschrijving lager + uitklapbaar". Dat klopt voor de long-form, maar puur uitklapbaar maakt de mobiele body leeg. Voorstel: long-form uitklapbaar **plus** een altijd-zichtbare USP-strip. Zo blijft de pagina schoon en zie je de waarde zonder te tikken.

## Strategisch: 1 PDP met lengte-varianten

De store verkoopt 8+ losse lichtsnoer-PDP's (15 LED, 30 LED, 50 LED, 10m, solar). Dat voedt de kannibaliserende "gerelateerd"-carousel en verspreidt reviews over losse producten. Overweeg één PDP met lengte/LED als variant-switcher: bundelt reviews (social proof), minder keuzeverlamming, minder losse pagina's te onderhouden. Grote ingreep, apart bespreken met [[Anna Veerman]].

## Site-brede check (2026-07-13): is het echt "bagger"?

Talat vindt de site in het algemeen bagger en twijfelt over rebuild vs doorpatchen. Snelle mobiele check van de homepage weerspreekt dat deels:

- **Homepage-bones zijn goed.** Sterke hero (lifestyle + serif kop "Jouw tuin verdient het mooiste licht van het jaar"), nette "Waarom Lichtendirect?" USP-grid met iconen (Alles in eigen beheer / Gegarandeerde veiligheid / Persoonlijke lichtexperts / 2 jaar garantie), en goede IA: Assortiment, Categorieën, Uitgelicht, Meest Gekozen. Het theme *kan* er dus goed uitzien. Ironisch: de homepage heeft precies de icon-USP-grid die de PDP mist.
- **De "lege" carousels zijn grotendeels een preview-artefact.** DOM-check: content zit er wel (55 collectie-links, 14 product-links, 0 broken images, 13 lazy-pending). De witte voids in mijn in-app browser komen van lazy-load die niet paint in de preview, niet per se van een kapotte site. Op een echt toestel checken voordat we "kapot" concluderen.
- **Echte, bevestigde problemen:** zwakke PDP (verstopte/ongestructureerde data), dubbele cookiebanner die niet dismisst (op elke pagina), lage-contrast hero-subtekst.
- **Waarschijnlijk snelheid.** Zware app-stack (PageFly + heatmap, Smart Tabs, Judge.me, Trustpilot). De preview-renderer worstelde zichtbaar. Op mid-range mobiel/4G kan dat traag + janky voelen = "bagger"-gevoel + CVR-verlies. Meten met Lighthouse/PageSpeed.

**Conclusie:** geen rebuild-case op esthetiek. De bones en het design-systeem zijn oké; het "bagger"-gevoel komt van een zwakke PDP + specifieke bugs + vermoedelijk laadsnelheid. Dat fix je zonder alles om te bouwen. Rebuild-beslissing hoort bij de client/[[Anna Veerman]] met echte cijfers (huidige CVR vs benchmark, PageSpeed), niet op gevoel.

## Harde cijfers (Shopify, 90d: 16 apr - 15 jul 2026)

- **CVR 3,09%** (+15% vs vorige periode)
- **Omzet €103,8K** (+71%) → ~€420K/jaar run-rate
- **Bestellingen 1.347** (+50%)
- **Sessies 28,7K** (+27%)
- Verkeer: voornamelijk Google Ads (high-intent, landt op PDP's/collecties)
- AOV ~€77

**Verdict tegen rebuild:** deze cijfers weerleggen "bagger". Gemiddelde e-com CVR is 1,5-2,5%; 3,09% zit erboven en groeit. Een echt slecht gebouwde store converteert <1% en krimpt. Deze schaalt 50-71%. Een full rebuild op een Google-Ads-gevoede €100K/90d-funnel is risico (conversietracking + productfeed breken = directe omzethit), geen upside. Talats "nieuw theme kost minder tijd dan alles herinrichten" vergelijkt het verkeerde: de dure/risicovolle laag (data, apps, tracking, feed) betaal je sowieso; het theme is het goedkope deel. Echte CVR-hefboom: PDP (waar Ads landt) + snelheid. 3,09% → ~3,6% bij gelijk verkeer = ~€60-70K/jaar extra, zonder rebuild-risico. Taste/maintainability-bezwaar is legitiem maar hoort een bewust, data-first, gemeten project te zijn, niet een big-bang tijdens het opschalen.

## PageSpeed / Lighthouse (mobiel, homepage, 2026-07-13)

- Prestaties **74** (oranje) · Toegankelijkheid **90** · Praktische tips **96** · SEO **100**
- FCP 2,6s · **LCP 5,9s (rood)** · TBT 80ms (groen) · CLS **0** (groen) · Speed Index 2,9s (groen)

**Interpretatie:** technische basis is solide (SEO 100, Best Practices 96, A11y 90). Dat is geen bagger-site. CLS 0 = géén layout-jank, dus het "alles zit door elkaar"-gevoel is smaak/organisatie, niet technische instabiliteit. TBT 80ms = JS blokkeert nauwelijks. Het enige echte probleem is **LCP 5,9s**: de hero/main-image rendert te traag. Dat is een gerichte fix (hero-image preload + WebP/AVIF + juiste maat + `fetchpriority=high`, niet lazy-loaden; niet-kritische app-scripts deferren), geen rebuild-argument, een nieuw theme fixt LCP niet vanzelf. Google-Ads-relevantie: trage LCP drukt Quality Score → hogere CPC. LCP fixen = goedkopere klikken + betere CVR. TODO: PageSpeed ook op de PDP/collectie draaien (money-pages waar Ads landen, mogelijk zwaarder dan homepage).

## Correctie snelheid: veldwaarden slagen (15 jul 2026)

PageSpeed op 3 paginatypes (homepage, collectie /lichtsnoeren, PDP smart-a33 RGB). **Veldwaarden (echte gebruikers, CrUX) SLAGEN voor Core Web Vitals op alle drie:** LCP 1,2s, INP 138ms, CLS 0, FCP 1,2s, TTFB 0,9s. De eerdere lab-LCP van 5,9s (homepage) en 9,4s (PDP-lab) zijn throttled worst-case lab-artefacten; homepage-lab sprong tussen runs van 74 → 88, wat de labruis aantoont. **Conclusie: snelheid is voor echte gebruikers geen probleem; mijn eerdere "vermoedelijk traag"-hypothese is weerlegd.** Vertrouw veld boven lab. Enige nuance: PDP-lab 67 laat zien dat de app-stack de worst-case op zwakke toestellen zwaar maakt, alleen relevant bij later apps opschonen. Geen urgentie, geen rebuild-argument. De laatste technische zorg valt weg: resterende hefboom is puur PDP-conversie.
