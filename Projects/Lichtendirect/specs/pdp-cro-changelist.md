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
- [ ] Engels label "Description" → "Productomschrijving"
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
- [ ] Grote afbeelding bovenaan weg
- [ ] Trustpilot updaten

### Contactpagina
- [ ] Volledige redesign met FAQ zodat er over tijd minder klantvragen komen (niet alleen een contactformulier)

### Productpagina
- [ ] Redesign zoals afgesproken (zie top-prioriteit + PDP-secties hierboven)

## Nog te bespreken
- [ ] 
