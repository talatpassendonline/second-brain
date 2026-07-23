---
type: research
source: Informatie Ecom en Brand (course dump)
course: Evolve / Origins (Spencer Pawliw Mini CRO + EAM Media) + DR Marketing Playbook
status: distilled
tags: [ecom, cro, landing-pages, split-testing, offers, pagedeck]
---

> [!info] Bron
> Gedistilleerd uit 58 transcripts. Ruw archief: [[H_cro_lp]] in `_transcripts/`. Dit is cursusmateriaal, geen evangelie; [[me|Talat]] maakt de compliance- en claim-calls zelf.

## Waar dit over gaat

Dit is het complete CRO-arsenaal van Spencer Pawliw (EAM Media, bouwt pagina's voor merken als Trisnow en LifeIn, $100M-bedrijven) plus de DR Marketing Playbook voor product-aware verkeer. De kern: CRO is niet je Shopify-conversie oppoetsen, het is de customer journey verbeteren zodat je harder kunt schalen op ads. Voor [[passendonline|Passendonline]] is dit letterlijk de dienst die we verkopen, dus dit voedt direct [[site-factory]] en [[site-craft]]. Voor [[business|Goatly]] is dit het speelboek om de landingspagina achter een winnende ad te bouwen en het verschil tussen $300 en $2000 per dag spend te maken zonder de ad te veranderen.

## Kernframeworks

### De drie soorten CRO

Spencer verdeelt alle CRO in drie emmers en zegt keihard dat de meeste mensen op de verkeerde inzetten.

1. **Send It Strategy.** Niets testen, gewoon live zetten op de store en hopen. Het probleem is bijna nooit de strategie maar de executie: hij voegde site-wide reviews toe die per ongeluk de productspecifieke reviews overschreven en de conversie kelderde. Alleen voor beginners zonder site of voor een rebrand. Referentie voor "send it maar dan goed": het bureau Audit (Sean en Taylor) dat UI/UX op data baseert.
2. **Scientific Method.** Echte A/B split-tests tot statistische significantie EN statistical power. Kost een minimum van 300 tot 1000 orders per variant, minstens twee weken per test, en een gigantisch QA-team. Spencer had $25.000 per maand aan payroll voor zijn CRO-team, betaalde iemand $6.000/maand puur voor QA, en de rapporten zeiden "+$50k/maand winst" terwijl de store jaar-op-jaar zakte. Alleen voor merken boven $1M/maand of 300 tot 500 orders per dag. Dylan Ander (splittesting.com) rekent hier $10k tot $30k/maand voor.
3. **Ad-Focused CRO (de money printer).** Pagina's en offers testen specifiek voor je ads. Je hoeft niet te wachten op stat-sig: zie je een goede ROAS of CPA, dan schaal je direct binnen 2 tot 3 dagen. Werkt voor elk niveau, van $0 in sales tot $10M/maand. De grote merken (Athletic Greens, Ridge, HexClad, MUD\WTR, allemaal via de Atria-data) sturen 30 tot 70% van hun verkeer naar landingspagina's, niet naar hun homepage, want ze weten dat een ad-klikker een compleet andere journey heeft dan iemand die je organisch vindt.

> [!tip] De centrale mantra
> "Test landing pages like you test ads." Je zou nooit één ad bouwen, hem laten floppen en concluderen "Facebook ads werken niet". Doe dat ook niet met landingspagina's.

### Wat CRO wel en niet is

CRO is NIET je Shopify-conversie verhogen, NIET optimaliseren rond die conversie-metric, en NIET knopkleuren en breintrucjes (tenzij je Nike bent met een miljoen orders per dag). CRO is de customer journey verbeteren om de schaalbaarheid van de business te vergroten. De hiërarchie van wat telt: **offer > messaging > content > design**. Design heeft een plek maar staat onderaan. Belangrijkste mindshift: je conversie mag zakken terwijl je omzet stijgt. Spencer had een klant met conversie 40% omlaag die toch $2M in sales deed, omdat de schaalbaarheid omhoog ging. "We don't care about conversion rate. We care about sales."

### CRO-metrics en de Shopify Score

Ken CVR (conversion rate), AOV (average order value) en RPS (revenue per session). De sleutelmetric is de **Shopify Score = CVR × AOV**. Bandbreedtes en wat te doen:

- **0 tot 100:** product communiceert geen waarde, verkeerde prijs, of slecht verkeer. Fix het product/de prijs of het traffic-probleem.
- **100 tot 250:** je doet iets goed maar nog niet schaalbaar. Optimaliseer store en pagina's, bouw betere landingspagina's.
- **250 tot 400:** de sweet spot. Schaal je verkeer hard, blijf de site optimaliseren.
- **400+:** je store verwerkt verkeer uitstekend. Focus volledig op betere ads maken en spend opvoeren.

Voorbeeld: klant met 4,23% CVR en $152 AOV (score 640) deden $75k/maand; puur op ads focussen bracht ze in 45 dagen naar $220k/maand. Regel: hoe hoger je marge, hoe lager je score meestal. Een klant met 96% marge had een dramatische conversie. Extra diagnostische metric: **add-to-cart-to-CVR-ratio.** 4:1 of hoger = probleem (vaak verkeer), 3:1 is prima, 2:1 is elite. Bij Goatly zou ik met een AOV rond de 40 tot 50 euro en de [[icp]] van vrouwen 50+ mikken op een score van minstens 250 door de AOV via bundels op te tillen.

### De ROAS-vergelijking als CRO-kompas

ROAS = (CVR × AOV × CTR) ÷ CPM. De meeste mensen rammen alleen op CTR (betere ads, betere ads). Maar twee van de drie tellers die je kunt beïnvloeden zijn CVR en AOV, en dat is precies waar landingspagina's op inhaken. Ads verbeteren CTR en CVR; pagina's verbeteren CVR en AOV. Bouw je een pagina, dan val je de helft van de ROAS-vergelijking aan die ads links laten liggen. Dit is het wiskundige argument waarom LP-werk schaalbaarheid ontgrendelt.

### Het 3:2:2:2-testmodel

De nieuwste Evolve-manier om pagina's te testen binnen de bestaande one-campaign CBO-structuur (zie [[05-media-buying-and-testing]]). Per creative-batch: **3** ad-varianten × **2** body copies × **2** headlines × **2** landingspagina's = 6 ads per ad set. Je dupliceert je drie ads en stuurt de ene set naar LP-A, de andere naar LP-B, en laat Meta's AI het budget verdelen op basis van welke pagina wint. Belangrijk: die derde en vierde "2" (de twee LP's) test je pas als je al winnende ads hebt. Voor bestaande winnaars maak je een aparte "page"-ad set in de hoofdcampagne. Descriptions worden overgeslagen; gebruik altijd de topperformer-copy plus één nieuwe versie.

### Growth loops: de ad-focused CRO-workflow

De feedbackloop die alles bindt. Strategiseer, executeer, test, analyseer, itereer, en rond en rond. Concreet:

1. Doe de research (ad account, competitors, angle) en ken je **control** (waar test je tegen).
2. Bouw de pagina rond één specifieke ad, met de juiste **angle, avatar en awareness level** (zie [[03-avatar-desire-market-sophistication]]). Stuur je een problem-aware ad naar een direct-response buy-now pagina, dan converteert die slecht; dan wil je een advertorial of listicle.
3. Zorg dat de messaging van de ad congruent doorloopt tot op de pagina. Spencer's voorbeeld: een soep-ad met hook "stomach issues, there's a soup for that" naar een generieke homepage floppte; naar een pagina "frustrated with doctors and digestive issues, I was too" schaalde van $300 naar $2000 per dag. Zelfde ad, betere pagina.
4. Dupliceer de ad, zet de nieuwe URL erin, launch in dezelfde campagne of een aparte LP-testing ABO ($50/dag minimum, CBO uit om spend te forceren, 7-day-click attributie zodat je geen view-through meetelt).
5. Maak twee custom metrics: AOV = purchase conversion value ÷ purchases, CVR = purchases ÷ landing page views.
6. Performt het, schaal na 2 tot 3 dagen. Crusht het echt, drip de post-ID in je champions ad set.
7. Flopt het, analyseer waarom net als bij een gefaalde ad en bouw de volgende iteratie.

Cadans: op schaal één nieuwe pagina per week plus één iteratie; kleiner één tot twee per maand.

### Het CRO-researchsysteem (zes bronnen)

De research werkt meer op jou dan jij op de research: het maakt je een betere marketeer, niet een ingevuld formulier. Zes bronnen, elk in de research-doc (zie [[10-research-system-and-product-research]]):

- **Ad account.** Top 3 creatives op hoogste spend en laagste CPA/beste ROAS (prospecting), zowel laatste 30 dagen als laatste 6 maanden. Plus: ads met hoge CTR maar lage CVR (die zijn te repareren met een betere pagina) en ads met hoge **hook rate** (custom metric: 3-second video plays ÷ impressions). Tool: Motion voor creative reporting.
- **Directe competitors.** Vind ze via productzoekopdracht, VPN aan naar je doelland (NordVPN). Per competitor: ad library (via hun FB-pagina hun ads vinden), landingspagina's waar ads heen gaan, prijsrange, actieve offers, notes. Bekijk Shark Tank-afleveringen en reviews om hun data gratis te laten doen. Spencer's soep-voorbeeld: Spoonful of Comfort brandde soep als "sending care when you can't be there", een cadeau-angle die veel krachtiger is dan "smaakt goed".
- **Angle-research op Google + Reddit.** Zoek de angle, mine oplossingen, beliefs en buzzwords (fiber, ginger, zinc, FODMAP kwamen boven voor gut health) en tel elk buzzword met een "+1". Voeg "reddit" toe achter je zoekterm voor echte koppen: "frustrated with doctors and digestive issues", "the go-to meal for sensitive stomachs". Reddit is een goudmijn voor headlines omdat het echte mensen zijn.
- **Twitter.** Volg Audit (Sean en Taylor, zeer visueel, before/afters), Dylan Ander (heatmap.com, "18px is de optimale prijs-fontgrootte, add-to-cart boven de vouw, Baymard-studies"), Harry, Oliver. Best-practice CRO. Onthoud: design enhancet, het leidt niet.
- **Landingspagina-research.** Atria of Foreplay (spy-tools die de top-LP's per merk tonen mét traffic-percentage) en de PageDeck Lander Library (lps.pagedeck.com, filter op landing pages, zoek elk merk). Bouw een Figma-swipe-file met de GoFullPage Chrome-extensie plus split-image om screenshots scherp te houden. Kopieer geen templates: begrijp WAAROM een sectie werkt. Een listicle-structuur werkt niet door de structuur maar door de content erin.
- **Store analysis en live website audit.** Pak je telefoon, scroll je eigen store, probeer dingen te breken, zoek bugs, verouderde badges (een "2019 award"), inconsistenties. En map wat je NU zegt tegen wat je zou moeten zeggen, opgesplitst in action items, vragen en opportunities.

### Offer-strategie voor de landingspagina

Offers hebben de grootste swing en ontgrendelen schaal het snelst. Het doel is één van twee: agressief de CVR omhoog, OF agressief de AOV omhoog terwijl je de CVR gelijk houdt. Types: basis ($/% korting) versus creatief (buy one get one, buy X get X%, gratis gift, bundle & save, subscribe & save). Gebruik Triple Whale om te zien wat nieuwe klanten daadwerkelijk kopen (niet returning). Prijs bundels op marge: als je marge 72% was en je doet buy-two-get-one-free, verschuift je breakeven, reken dat door. Regels:

- Zeg altijd "save 20%" of "save $50", nooit "save $3.75". Bij kleine bedragen voelt het percentage groter.
- **"Selling air":** shipping protection voor $3, priority processing voor $2,50. Op een $25 AOV is dat 10% erbij.
- De offer geldt alleen via de ad-pagina; op de website blijft de evergreen offer staan. Dat is precies wat de LP high-converting maakt.
- Offers zijn als drugs: ze moeten winstgevend blijven. Nooit break-even of verlies draaien op acquisitie tenzij de LTV het draagt.

### Het PageDeck-landingspaginasysteem

PageDeck is een drag-and-drop builder op een subdomein (try.merk.com) die direct op de Shopify-checkout aansluit. Spencer's hele filosofie: snelheid boven perfectie, en de limitaties van de tool zijn een feature omdat je geen tijd verspilt aan review-bubbels. "You need to be a designer" is precies wat je NIET hoeft te zijn.

- **Foundations.** Subdomein via een CNAME-record, logo, Google-fonts (of upload .woff via cloudconvert), Google Analytics, head-scripts (Triple Whale, Meta-pixel, heatmap.com) en end-of-body scripts (Klaviyo/e-mail). Dubbel-publiceren wist de cache.
- **Themes.** Zet merkkleuren, fonts, knoppen, radius en padding één keer; het geldt voor elke pagina. Consistentie helpt conversie meer dan fancy gradients. "The best part of this landing page is it's ugly. I love that it's ugly." Ugly-maar-dialed verslaat mooi.
- **Templates.** Kies er één die past bij de angle, forceer geen secties. Twee soorten pagina's: een pre-sell page (redirect naar de site) of een buy-on-page (order form direct naar checkout).
- **Offer-functionaliteit.** Plak een product-URL in de buy box en klik "sync product data". Werkt met native Shopify-varianten (custom-gebouwde variant selectors trekken niet mee). BOGO-box, multi-product/shoppable card, en Shopify-permalinks voor custom bundels: `merk.com/cart/VARIANT_ID:QUANTITY`, met meerdere producten gescheiden door een komma.
- **Messaging.** Hero founder-letter (alleen als het authentiek is; forceer geen verzonnen verhaal), een benefit-stack geordend naar wat de klant het meest boeit (real food, dan fiber, dan zero sugar, gluten-free, vegan, ready-to-eat), en handmatig geplukte reviews die de avatar spiegelen. 75% van kopers zegt dat reviews hun beslissing sturen, dus zet nooit generieke reviews neer.
- **Content.** Show don't tell: een video/GIF van echt eten dat gesneden en gekookt wordt is krachtiger dan een stilstaand bord soep. Canva voor labels, AI voor beeld waar nodig, maar authentiek merkbeeld boven stock.
- **Functionaliteit.** Link elke knop, ontlink het logo en beelden die niet mogen klikken (Spencer had bijna 50% van zijn verkeer naar Magic Spoon gestuurd omdat hij een template-logo vergat te ontlinken). Gebruik een coupon-code-generator om kortingslinks vooraf in de CTA te bakken.
- **Page information.** Naam, slug, description en favicon zodat try.merk.com er professioneel uitziet.
- **Wat A/B-testen (volgorde van impact):** 1) de offer (grootste swing), 2) hero-sectie versus order-form boven de vouw, 3) headline en alles boven de vouw. Verander eerst grote, duidelijke dingen. Test onderin de pagina niet, want maar 5% ziet het.
- **A/B-tool.** Ga naar `/ab-test`, GA4 vereist, vul slugs in, kies split-percentage. Dupliceer de pagina, test een nieuwe offer, en wissel de slug om als de winnaar bekend is.

### IntelliGems split-testing (de scientific-method tool)

Voor merken die wél echt willen split-testen. ~$89/maand voor content-testing, ~$500/maand voor profit optimization (prijs- en shipping-tests). Setup: app installeren, script in theme.liquid, COGS en shipping-kosten syncen vanuit Shopify voor accurate winstdata.

**Vijf content-test-types:**
1. **Split URL redirect.** Zeldzaam, alleen als je tussen twee verschillende templates test (bijv. een `/pages` LP versus een `/collections` pagina). Nooit andersom vanaf een pagina die iedereen bezoekt.
2. **On-site edits / Visual A/B.** Headline- of image-swaps in een visuele builder. Handig maar glitchy op mobiel; ze gebruiken het vooral om code in de menu-sectie te injecteren (via een dev).
3. **Template test (de beste).** Integreert met Shopify's vier templates: homepage, collection, product, pages. Dupliceer de control, edit in Shopify zelf. Targeting-regel: een homepage-template zit maar op één URL, dus laat targeting open (of "equals"). Een default product-template zit op honderd producten, dus zet "URL contains" plus specifieke targeting, anders test je op alle producten tegelijk.
4. **Theme test.** Alleen voor een compleet nieuwe site. Zwaar, laat geen andere tests tegelijk draaien.
5. **Advanced.** Nooit gebruikt.

Winnende tests executeren: theme test = thema publiceren; on-site edit = in de customizer overnemen; split URL = de URL in het ad account wijzigen of een Shopify-redirect; template = de product/collection/page-template-dropdown wijzigen; homepage = de code uit het template in index.json plakken (eng, maak eerst een backup als "old-HP").

### Powered stat-sig: de wachtregels

De belangrijkste discipline in scientific CRO. IntelliGems' eigen drempel (100 visitors, 10 orders, $1 revenue) noemt Spencer "super dumb". De echte regel: **minimaal 300 orders per variant, idealiter 400 tot 500.** Reken na met een calculator zoals abtestguide.com/calc. De trend-chart laat zien hoe winnaars kruisen: een test die er bij 100 orders uitzag als +10% CVR ging bij 200 orders naar -3% en eindigde bij 300+ orders op +14% winst. Een AA-test (identieke pagina's) toonde "10% lift" die pure ruis was over 8000 bezoekers. Push je te vroeg, dan zet je bij een 50/50-test de helft van de tijd de verkeerde variant live. Het muntje-voorbeeld: gooi je drie keer kop, dan wed je niet je bankrekening dat het altijd kop is.

> [!warning] QA-discipline: de $90k-les
> Een generic-reviews-test overschreef per ongeluk de productspecifieke reviews via een developer-fout: op weg naar -$60.000/maand. Na grondige QA (voorwaarde toegevoegd: overschrijf niet als er al reviews zijn): +$30.000/maand. Eén regel code was het verschil. Verreweg de nummer-één reden dat split-tests floppen is niet het idee maar iets dat kapot is. QA in een verse incognito-window, op meerdere browsers en echte devices, en spam de live split-test op je telefoon.

### Landingspagina-testen analyseren op Meta

Geef een nieuwe pagina 3 tot 5 dagen (soms 5 tot 7), en spend 2 tot 3× je CPA voordat je oordeelt. Filter op 7-day-click attributie om view-through eruit te halen (een "purchase" die geen klik-purchase was is false data). De custom metrics: AOV = purchase conversion value ÷ purchases, CVR = purchases ÷ landing page views. Analyseer in de "core four quadrants": desktop versus mobiel, new versus returning. In Spencer's live-case deden de eerste drie dagen niks, daarna ripte het van $50 naar $300/dag met 10× hogere CVR en $30 hogere AOV dan de control, allemaal op dezelfde ad.

### Shopify discount codes (drie formats)

1. **Manual code.** Voor geheime codes, influencers, abandoned-cart-mails. Nadeel: de klant moet hem onthouden en handmatig invoeren, en hij toont niet in de cart. Gebruik een coupon-code-generator die een link maakt die de korting automatisch bij checkout toepast.
2. **Automatic discount.** De aanrader voor elke site-wide sale. Past automatisch toe bij iedereen en toont wél in de cart. Let op de "only apply once per order"-checkbox.
3. **Manual markdown.** Op productniveau via de compare-at-price. Voor clearance of weinig SKU's. Toont geen besparing in de cart tenzij je custom code toevoegt.

End-to-end sale-setup (LifeIn, hielp klanten $10M+ omzet doen): announcement bar, collectie, PDP, cart en checkout allemaal congruent, toon de besparing overal, en het gouden principe: "make sure the customers aren't doing math."

### DR Marketing Playbook voor product-aware audiences

Een aparte doctrine, cruciaal voor sophisticated markten. De nummer-één fout: een problem-aware landingspagina bouwen voor een product-aware publiek. Die kopers vragen niet "wat is dit?" maar "waarom DEZE?". Daarom verslaat een generieke PDP vaak een "perfecte" long-form LP. Drie conversion-killers: prijs onder $50 (lage beslissingskost, geen thesis nodig), product-complexiteit (als een beeld het uitlegt heb je geen 2000 woorden nodig), en traffic-temperatuur (koud verkeer gaf je 2 seconden, geen roman). De halo-effect/trust-shift: problem-aware kopers kopen omdat je hun pijn perfect beschreef, product-aware kopers kopen omdat alles "dit is het echte werk" signaleert.

De third-party presell funnel op Meta: draai ads NIET vanaf je merkpagina maar vanaf een publisher/community/reviewer-pagina, zodat de ad voelt als een echte ontdekking. Ad → presell-listicle (bijna volledig productvergelijking, frame "wij deden het huiswerk", kroon de winnaar) → branded PDP → checkout. De extra stap voelt alsof het conversie kost maar verhoogt buyer-quality en AOV. Op Google Search (het meest product-aware kanaal) match je keyword aan bestemming en draai je ads naar je eigen presell-pagina's op een apart domein. Google Demand Gen = Meta-creative plus Google-intentdata. De hybride PDP: bovenste 20% werkt als een snelle PDP (hero, one-line benefit, prijs+offer, sterren, add-to-cart boven de vouw), onderste 80% is geruststelling voor scrollers. Sticky add-to-cart is non-negotiable. Kill de mechanism-uitleg en de problem-agitation-sectie; die horen in e-mail/SMS. Gouden regel: **PRESELL = why this one, PDP = buy it now.** Diagnoseer altijd eerst het awareness-level.

### CRO easy wins (backed by data)

Rapid-fire testideeën, meeste met echte cijfers: policies op orde (shipping/return/refund, wettelijk verplicht), homepage above-the-fold, homepage headline (één headline = +$14 tot $15k/maand), product-carousel above-the-fold, research-backed FAQ's (+$35k/maand), reviews die niet allemaal vijf sterren zijn (reageer op 3- en 4-sterren om echtheid te tonen), optimale size guides, en satisfaction-guarantees (je doet het toch al, dus benoem het).

## Procedures / SOP

**De volledige landingspagina-build (van research tot live):**

1. **Ad account research.** Kopieer de research-doc. Filter ads op spend, pak de top 3 (30 dagen + 6 maanden). Noteer high-CTR-lage-CVR ads en high-hook-rate ads. Kies de ad waarvoor je bouwt.
2. **Identificeer de angle, avatar en awareness level** van die ad. Bouw nooit zonder deze drie.
3. **Competitor research.** VPN aan. Per competitor: ad library, LP's, prijsrange, offers, notes. Screenshot in een Figma-swipe-file.
4. **Angle research op Google + Reddit.** Mine buzzwords, beliefs, headlines. Tel buzzwords met "+1".
5. **Store/website audit.** Scroll je eigen site op mobiel, noteer bugs en gaten tussen wat je zegt en zou moeten zeggen.
6. **Strategiseer de offer.** Bekijk in Triple Whale wat nieuwe klanten kopen. Bouw een bundel-ladder (bijv. 10% / 15% / 20% off op 3/6/12), reken de marge en breakeven door.
7. **PageDeck foundations.** Subdomein (CNAME), logo, fonts, GA, pixels (Triple Whale, Meta, heatmap), e-mailscript. Dubbel-publiceren.
8. **Zet het theme.** Kleuren, fonts, knoppen, radius, padding.
9. **Kies een template** die bij de angle past. Forceer geen secties.
10. **Bouw de order-form** via buy box / BOGO / multi-product, of Shopify-permalinks voor custom bundels.
11. **Schrijf de messaging.** Founder-letter (alleen authentiek), benefit-stack geordend naar klantprioriteit, handmatig geplukte reviews, ingredient/nutrition-proof.
12. **Optimaliseer content.** Show don't tell met video/GIF/Canva/AI, consistent beeld.
13. **Check functionaliteit.** Link elke knop, ontlink logo/beelden, bak kortingscodes in de CTA.
14. **Zet page information** (naam, slug, description, favicon).
15. **QA, QA, QA.** Verse incognito, meerdere browsers en echte devices, breek alles, proofread hardop (Google Doc spelling + Grammarly), check je meest voorkomende schermresolutie via GA4 (Reports > Tech > screen resolution).
16. **Launch op Meta.** Dupliceer de ad, nieuwe URL, testing-ABO of hoofdcampagne, $50/dag, 7-day-click, CTA naar "Learn More" voor advertorial-achtige pagina's.
17. **Analyseer.** Geef 3 tot 5 dagen, spend 2 tot 3× CPA, kijk naar CVR en AOV vs control op click-through data.
18. **Schaal of itereer.** Wint het, drip de post-ID in champions. Verliest het, analyseer en bouw de volgende iteratie (growth loop).

**IntelliGems template-test uitvoeren (voor merken op schaal):** maak een template test, dupliceer de control, edit in Shopify, zet targeting ("contains" + URL voor producten, open voor homepage), QA in incognito, laat draaien tot 300+ orders per variant, check abtestguide.com/calc, en execute door de template-dropdown te wisselen.

## Templates, prompts, formules

**Formules:**
- Shopify Score = CVR × AOV. Bands: 0-100 / 100-250 / 250-400 / 400+.
- ROAS = (CVR × AOV × CTR) ÷ CPM.
- Custom metric AOV = purchase conversion value ÷ purchases.
- Custom metric CVR = purchases ÷ landing page views.
- Hook rate = 3-second video plays ÷ impressions.
- Add-to-cart-to-CVR ratio: 3:1 prima, 2:1 elite, 4:1+ probleem.
- Stat-sig regel: minimaal 300 orders per variant, idealiter 400-500.
- Shopify-permalink voor custom cart: `merk.com/cart/VARIANT_ID:QUANTITY`.

**Naamgeving:** LP-testcampagnes heten "page deck testing" of "page-N"; ad-batches heten "batch-N" (strategist) of "edit-N" (editor); template-testen heten bijv. "EAM-LP-Hero-V5".

**De CRO Research Doc structuur (kopieerbaar):**
```
Marketing Brain Dump: Market Awareness / Headline Ideas / Offer Ideas / Overall Ideas
Core Research: Wie is het bedrijf / Wat is het product (fysiek) / Wat doet het (functie) /
  Features / Benefits / Competitive advantages & claims / Use cases / Reviews (eigen, Amazon,
  competitors) / Buzzwords & phrases (+1 elke keer) / Wants & needs / Wat willen ze niet /
  Mogelijke desires (rank op kracht) / Klant nu vs klant na product / Vragen van klanten /
  Andere oplossingen / Day-to-day struggles / Beliefs & objections / Bad competitor reviews
Competitor Research (5-6): Ad Library / LP's in ads / Website / Prijsrange / Actieve offers / Notes
Creative Audit deel 1: top 3 op hoogste spend & laagste CPA/beste ROAS (30d + 6mnd)
Creative Audit deel 2: top 3 hook rates + top 3 CTR's
```

**Tool-stack:** PageDeck (builder, code EZA15), IntelliGems (split-testing, code EZ810/EZA10), Atria of Foreplay (LP-spionage), Motion (creative reporting), Triple Whale (order-analyse), heatmap.com (Dylan Ander), GoFullPage + split-image + Figma (swipe-file), NordVPN, abtestguide.com/calc.

## Quotables

- "Test landing pages like you test ads. If you guys can do that, you're gonna be so far ahead of everybody else, because nobody looks at this." (Spencer Pawliw)
- "CRO is about improving the customer journey to increase the scalability of your online business. It's not about your Shopify conversion rate." (Spencer Pawliw)
- "The best part of this landing page is it's ugly. I love that it's ugly. It's about the information that's on here, not the way it looks." (Spencer Pawliw)
- "You need so much more data than you think. QA, and then QA, and then QA, and then you do more QA." (Spencer Pawliw, over de scientific method)
- "Product-aware buyers aren't asking 'what is this?', they're asking 'why THIS one?'. Diagnose the awareness level before you optimize anything else." (DR Marketing Playbook)
- "Whatever you show people and tell people to buy is likely what they're going to buy." (Spencer Pawliw, over offers)

## Zo pas je dit toe op Goatly + Passendonline

Voor [[passendonline|Passendonline]] is dit het ruggenmerg van de [[services|CRO-dienst]]. De grote [[strategy|strategische]] keuze: verkoop **ad-focused CRO**, niet scientific split-testing. Bijna geen enkele klant van ons heeft de 300-tot-500-orders-per-dag om stat-sig binnen weken te halen, dus IntelliGems-werk zou ze maanden laten wachten op een resultaat dat we in Meta binnen 3 tot 5 dagen zien. De PageDeck-build-SOP hierboven is vrijwel één-op-één de pipeline die [[site-factory]] moet draaien, en de "offer > messaging > content > design"-hiërarchie hoort de default-review-volgorde in [[site-craft]] te zijn. Bouw de research-doc-template in als vast intake-artefact per klant; dat is meteen het verhaal waarmee je de pitch onderbouwt ([[sales-dossier]]).

Voor [[business|Goatly]]: dit is precies het gereedschap om achter een winnende ad een congruente landingspagina te zetten in plaats van naar de generieke productpagina te sturen. De soep-case (van $300 naar $2000/dag, zelfde ad) is letterlijk je situatie: een gezondheids-DR-merk voor 50+ vrouwen met [[pain-points]] rond botgezondheid. De Reddit-headline-methode ("frustrated with doctors") en de founder-letter-structuur passen naadloos op de [[brand]]-voice en de [[icp]]. Bouw een bundel-ladder om de Shopify Score via AOV op te tillen, want dat is waar Goatly waarschijnlijk het meest laat liggen. Let op tegen [[Rynse]]: die draaien food-not-pills op schaal met 10.000+ reviews, dus doe de Atria/competitor-research op hén, screenshot hun LP's, en zoek waar hun offer of messaging een gat laat.

Kritische kanttekeningen. Het goud: de ad-focused loop, de Shopify Score als diagnose, de research-discipline, de QA-doctrine en de offer-hefboom zijn tijdloos en direct toepasbaar. Wat gedateerd of overhyped is: PageDeck als tool is een aanbeveling met affiliate-smaak (Spencer geeft toe dat het limitaties heeft en dat "any builder" werkt), dus bind Passendonline niet vast aan één builder. De stat-sig-drempels zijn correct maar irrelevant voor onze schaal, gebruik ze alleen om klanten te temperen die te vroeg "winnaars" willen uitroepen. En de DR Marketing Playbook (product-aware) is een andere denkwereld dan Spencer's problem-aware soep-pagina's: kies bewust welke past bij het awareness-level van de klant, want ze door elkaar husselen levert de long-form LP op die verliest van een simpele PDP.

## Skill-haakjes

Dit voedt primair [[site-factory]] en [[site-craft]] met de complete build-SOP, de test-prioritering (offer > hero/order-form > headline) en de stat-sig-regels. De offer-strategie en Shopify Score raken [[unit-economics]] (AOV/CVR/breakeven-diagnose). De research-doc en competitor/angle-methode versterken [[prospect-scout]] en [[sales-dossier]]. Overweeg een aparte `cro-audit` skill die de live-website-audit en de "CRO easy wins"-checklist als losse dienst verpakt voor Passendonline-leads.
