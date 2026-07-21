---
type: spec
date: 2026-07-13
project: Lichtendirect
client: Lichtendirect
status: backlog
tags: [shopify, cro, productpagina, changelist, backlog]
priority: high
---

Levende changelist voor de [[Lichtendirect]] CRO-ronde. Alles wat we gaan aanpassen, gegroepeerd zodat [[me|Talat]] er makkelijk aan toevoegt. Voedt uit [[mobiel-pdp-cro-audit]], [[productdata-metafield-architectuur]] en [[header-pdp-optimalisatie]]. Legenda: `[nu]` = kan met staff-toegang, `[connector]` = wacht op Shopify Claude Connector, `[theme]` = wacht op theme-push-toegang.

## Top-prioriteit (grootste CVR-impact)

- [ ] USP icon-strip altijd zichtbaar onder prijs/CTA, uit de dichtgeklapte omschrijving gehaald `[theme]`
- [ ] Productdata structureren met `specs`-metafields zodat elke PDP zichzelf vult `[connector]`
- [ ] Reviews positief-eerst tonen, negatieve 3-ster van Hans niet vooraan in de Judge.me carousel `[nu]`
- [ ] Dubbele cookiebanner fixen die niet dismisst `[theme]`
- [ ] Infographics (Waarom dit lichtsnoer, IP65-uitleg, merk-vergelijking) uit de gallery naar de body als content-blokken `[theme]`

## PDP: layout & content

- [ ] Aanbevolen mobiele stapelvolgorde toepassen (gallery → korte H1 → sterren → prijs → USP-strip → ATC → trust → bundel → content → omschrijving → specs → reviews → FAQ → gerelateerd)
- [ ] Volledige omschrijving uitklapbaar, kernspecs inline zichtbaar
- [ ] "Gerelateerde producten" carousel inkorten, concurrerende lichtsnoeren + het product zelf eruit
- [ ] Lege witruimtes dichten
- [ ] Titel niet 2x bovenaan (breadcrumb volledige titel + H1)
- [ ] Hoofd add-to-cart hoger in de flow, niet onder de trust-accordions
- [ ] Countdown koppelen aan echte 17:00-cutoff i.p.v. rollende timer

## PDP: polish / kleine bugs

- [ ] Gespookte dubbele sectiekop ("Gerelateerde producten" watermark-glitch) `[theme]`
- [ ] Engels label "Description" → "Productomschrijving" `[app]` (komt uit Smart Tabs-app, niet theme; Talat past aan in de app. PR #19 was mis en is gesloten, 21 jul)
- [ ] Amerikaanse datumnotatie in reviews (11/15/2025) → NL 15-11-2025
- [ ] Add-to-cart-knopjes in productkaarten: tekst i.p.v. alleen tasje-icoon

## Datastructuur (het fundament)

- [ ] `specs`-metafields aanmaken (definitielijst staat klaar in [[productdata-metafield-architectuur]]) `[connector]`
- [ ] Universele trust-strip hardcoden: verzending, garantie, retour, veilig betalen `[theme]`
- [ ] `feature_block`-metaobjects voor herbruikbare uitleg (IP65, koppelbaar, dimmer, warm wit) `[connector]`
- [ ] Matrixify-import per familie, lichtsnoeren eerst (`lichtsnoeren-metafields-matrixify.csv`) `[connector]`
- [ ] `usp-strip.liquid` + `spec-table.liquid` snippets, vervangt de Smart Tabs-app `[theme]`
- [ ] SOP: nieuw product = specs-metafields invullen

## Header (werkorder Anna, deels code klaar)

- [ ] Trustpilot-score tussen logo en zoekbalk (code klaar)
- [ ] Sterren + aantal gestapeld (code klaar)
- [ ] Onderste losse reviewsbalk weghalen (code klaar)
- [ ] Menu sticky bij scrollen (desktop)
- [ ] Mobiel: menu sticky, reviews niet sticky (code klaar)
- [ ] Productreviews direct onder titel (Judge.me)
- [ ] Bezorg-USP "voor 17:00 = morgen in huis" als opvallende badge
- [ ] Betaalmethodes tonen onder de koopknop (code klaar)
- [ ] Totaal-reviewscore van de shop bij de titel
- [ ] Ruimte voor productvideo's in de gallery (content-taak)

## Sitewide / homepage

- [ ] Lage-contrast hero-subtekst leesbaar maken (witte tekst op lichte foto)
- [ ] Lege carousels op een echt toestel checken (was mogelijk preview-artefact)

## Snelheid (laag, veldwaarden zijn groen)

- [ ] Optioneel: app-stack opschonen voor low-end worst-case. Niet urgent, Core Web Vitals slagen al.

## Strategisch (apart met [[Anna Veerman]] / Murat)

- [ ] 1 PDP met lengte/LED-varianten i.p.v. 8 losse lichtsnoer-PDP's (bundelt reviews, minder keuzeverlamming)

## Toevoegingen Talat (per pagina, 2026-07-15)

### Homepage
- [ ] Minder assortiment-nadruk, meer over het bedrijf toevoegen
- [ ] Trustpilot-sectie verbeteren + review-aantal updaten (nu 414, staat 402)
- [ ] Blogsectie "advies en tips van onze experts" vernieuwen
- [ ] Footer mooier maken

### Menu
- [ ] Menu fixen, categorieën echt vooraan (al gepland)

### Categoriepagina
- [ ] Redesign
- [~] Grote afbeelding bovenaan weg (leidde af). `banner_image` leeggedwongen in `main-collection-banner` → alle categorieën vallen terug op de ingebouwde tekst-header (breadcrumb + titel, donker op licht rgb 250,250,250). **PR #8 + #9** (waterdicht: ook `collection.image`-bron geblokkeerd), maar Shopify weigerde de sync door een ongeldige inline `#`-comment in het `{% liquid %}`-blok → **PR #10** repareert dat (`assign banner_image = ''` zonder comment; inline `#` mag niet in Shopify Liquid, alleen op een eigen regel). Vooraf gesimuleerd + gescreenshot op plafondlampen: schone leesbare header. Nu valide + gesynct naar staging (2026-07-20). Preview → publiceren.
- [ ] Trustpilot updaten
- [~] Reviewgrid consistent op alle categoriepagina's (onder producten, boven SEO-tekst). Root cause: per collectie handmatig als custom-liquid geplakt (9 van ~21 hadden het, wisselende plek). Fix: `{% render 'trustpilot-reviews' %}` één keer in de gedeelde `main-collection-product-grid`-sectie + 9 losse kopieën verwijderd. **PR #2 gemerged** (injectie in gedeelde sectie). Daarna **PR #3 gemerged**: reviewgrid stond onder de categorietekst omdat de sectie die tekst zelf rendert (`description_position: below`); nu verplaatst naar direct na de producten en vóór dat tekstblok (producten → reviewgrid → categorietekst). Beide op main + gesynct naar staging (2026-07-20). **Nog te doen:** staging opnieuw previewen (solar-lampen) → publiceren om live te gaan. Zelfde staging-vs-live-situatie als favicon.

### Contactpagina
- [~] Volledige redesign met FAQ zodat er over tijd minder klantvragen komen (niet alleen een contactformulier). Model = trygoatly-contactpagina, zonder 17track. FAQ (12 vragen) uit onderzoek van alle Trustpilot- + bol.com-reviews, zie [[contactpagina-faq-onderzoek]]. **PR #11** (simpele FAQ+formulier) → daarna **PR #12**: volledige rijke supportpagina naar het trygoatly-model op verzoek van Talat. Nieuwe `lichtendirect-support`-sectie: hero ("Hoe kunnen we je helpen?") → ankernav → contactblok (werkend `{% form 'contact' %}` + directe-contactkaarten + bedrijfsgegevens) → FAQ per onderwerp (bestellen/verzending, product/gebruik, retour/garantie) → nieuwsbrief. Géén 17track. Ontwerp-preview als artifact `8dccbf65`. Op staging. Daarna **rijk redesign v2** (op verzoek Talat, naar de volledige trygoatly-structuur): hero + trust-balk (CE-gekeurd, Trustpilot, gratis verzending, 2 jaar garantie) + sticky pill-nav + contactblok (form + kaarten + bedrijfsgegevens) + FAQ per onderwerp (bestellen/verzending, product/gebruik in donkergroen, kwaliteit/garantie, retour/betaling) mét gegenereerde sfeerbeelden + nieuwsbrief. Concrete antwoorden (geen vaag), trust-content (getest/CE-gekeurd). Géén 17track. Ontwerp-artifact `140e45b6`. Gegenereerde beelden in `Projects/Lichtendirect/contact-images/` (sfeer-tuin, verzending-pakket, kwaliteit-keuring) om in de theme te uploaden. **v2 gemerged (PR #13) → staging.** Beelden voorlopig via directe cloudfront-URL (later als theme-asset uploaden voor productie). **Nog te doen:** Talat preview op staging → publiceren (publiceert alles); beelden als theme-asset uploaden; retour-/terugbetalingstermijn (14 dagen / 5 werkdagen) verifiëren.

### Productpagina
- [ ] Redesign zoals afgesproken (zie top-prioriteit + PDP-secties hierboven)

## Nog te bespreken
- [ ] 

## Techniek / SEO (los)

- [~] **Favicon komt niet door in Google** (toont generieke globe). Root cause: favicon werd op 32x32 gerenderd in 8 layout-bestanden. Google eist vierkant + veelvoud van 48px. Fix (32→96) = PR #1 op `lichtendirect-woodstock-theme`, **gemerged naar main** (2026-07-20). Repo is via Shopify GitHub-integratie gekoppeld (shopify[bot] sync-commits). **Maar:** live homepage toont na merge nog steeds 32px → het gekoppelde theme is vrijwel zeker het **staging-theme**, niet het gepubliceerde (de Dunion-changes van 6 jul staan ook op main maar zijn evenmin live). **Nog te doen:** verifiëren welk theme live is; óf de one-liner direct in het live-theme zetten (`theme.liquid` r21, 32→96), óf staging publiceren; daarna Search Console reindex. Bronbestand 1320x1000 (scherp genoeg) maar niet vierkant → los nog vierkant lampje-favicon overwegen.

## Blog / FAQ (Dunion, Jim Zwarthoed)

- [~] **Blogafbeeldingen standaard compacter + scherp** (referentie avv-vloeren.nl). Diagnose: body-afbeeldingen waren al 500px (via width-attribuut), NIET het probleem. De "kapotgroot" op desktop is de **uitgelichte afbeelding bovenaan**, die de leeskolom (`article-template__narrow` = 112rem = 1120px) vult. Fixes: body-img gecapt op 600px (**PR #4**, blijft staan). Hero: CSS-cap (PR #5) liet de foto verdwijnen (botste met de aspect-ratio-box) → **teruggedraaid (PR #6)**. Juiste route voor de hero is de theme-instelling: featured_image block heeft `image_height` (adapt/small/medium/large), staat nu op **adapt** → bijna-vierkante foto wordt reuzegroot vierkant op desktop. Customizer small/medium veranderen alleen de hoogte, niet de breedte → hero bleef full-width. **Werkende fix: PR #7** — aspect-ratio-box platgeslagen (`padding-bottom:0 !important`) + foto als normale afbeelding op max 600px gecentreerd. **Vooraf live in de blogpagina getest** (via JS-injectie): foto blijft zichtbaar op 600x591, geen collapse. Verificatie-truc voor toekomstige blinde visuele fixes: CSS tijdelijk in de live pagina injecteren en meten vóór shippen. Gemerged naar main + staging (2026-07-20). Preview op staging → publiceren.
- [ ] **FAQ onder de H1** (dev-taak, besproken met Anna). Wacht op context uit Jims eerdere mail: wat is het exacte issue? Nodig voordat de FAQ gevuld kan worden.
- [ ] Content-checks (voor Talat/Murat, niet dev): 2 nieuwe blogs (hoe-werken-solar-lampen, hoe-lang-gaat-een-solar-lamp-mee) + FAQ-vragen in Word-docs.

## Site-walkthrough (2026-07-20) — nieuwe bevindingen

- [ ] **Verzend-tegenstrijdigheid (urgent, business).** Aankondigingsbalk: bestellingen door magazijnverhuizing pas vanaf 28 juli verzonden. Maar PDP's tonen nog "voor 17:00 besteld = morgen in huis" + afteltimer. Dat is nu misleidend (Google Ads stuurt kopers die morgen-in-huis verwachten → klachten/refunds/slechte reviews). Pauzeer de "morgen in huis"-USP + countdown tot verzending hervat.
- [ ] **Bannerfoto ook op cart + overige pagina's.** De categoriefoto-fix (PR #8-10) pakte alleen collectiepagina's (`main-collection-banner`). Cart en andere niet-collectie-pagina's tonen nog de grote page-title-foto via `settings.page_heading_other_banner_image`. Weghalen in de Customizer (globale afbeelding leegmaken) of theme-breed.
- [ ] **Odd-cent kortingen.** Discount-badges tonen rare bedragen (-€10,05, -€20,01). Compare-at rond, verkoopprijs odd cents → oogt auto-gegenereerd. Prijzen afronden voor nette kortingsbedragen.
- [ ] **Menulabel "Contactpagina" → "Contact".**
- [ ] **Announcement bar** neemt op mobiel 4 regels / veel ruimte in (duwt hero omlaag). Inkorten.
- [ ] Zoekpagina: klein zwevend "in"-tekstfragment linksboven (afgekapt label), kleine glitch.
- Bevestigd (al genoteerd): categorieën weggestopt onder "Assortiment"; hero-subtekst lage contrast; persistente/dubbele cookiebanner.
