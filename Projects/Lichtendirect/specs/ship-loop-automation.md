---
type: spec
date: 2026-07-21
project: Lichtendirect
client: Lichtendirect
status: design
tags: [automation, shopify, cro, ship-loop, pipeline, passendonline]
priority: high
---

Ontwerp voor het automatiseren van de [[Lichtendirect]] theme-CRO-cyclus (de "ship-loop"). Doel: de grind van changelist-item → geshipte staging-wijziging door een agent laten doen, zodat [[me|Talat]] alleen de gates houdt. Pilot voor een herbruikbare Shopify-CRO-pipeline voor elke Passendonline-klant. Bron-changelist: [[pdp-cro-changelist]] en [[no-connector-backlog]].

## Waarom dit nu kan (geen connector nodig)

De theme-helft van het werk is niet geblokkeerd. De repo `talatpassendonline/lichtendirect-woodstock-theme` is via de Shopify GitHub-integratie aan het **staging**-theme gekoppeld. `gh` is lokaal ingelogd (`talatpassendonline`, `repo`+`workflow`-scope). Alleen per-product data (metafields) en admin-zaken (menu, prijzen, orders) wachten op Murats connector-goedkeuring en vallen buiten deze loop.

> [!important] Veiligheidsmodel
> `main` synct naar het **staging**-theme, niet naar live. Een agent mag vrij branchen, PR'en en naar `main` mergen zonder de live winkel te raken. **Live gaat alleen als Talat handmatig publiceert** (publiceert alles tegelijk, dus batchen en met eigen ogen checken). Dat is de harde gate.

## De loop (per changelist-item)

1. **Selecteer** het volgende item met tag `[nu]` of `[theme]` uit [[pdp-cro-changelist]] (connector-items overslaan).
2. **Branch** `feat/...` of `fix/...` vanaf `main`.
3. **Implementeer** de wijziging in Liquid/CSS/JS. Voor blinde visuele fixes: eerst simuleren/screenshotten of tijdelijk in de live pagina injecteren en meten (de truc uit de blog-hero- en banner-fixes).
4. **PR + merge naar `main`** → Shopify synct naar staging.
5. **Verifieer op staging** in de browser (preview-URL), screenshot als bewijs.
6. **Rapporteer**: changelist-item afvinken met PR-nummer + één regel wat er gebeurde en wat er nog te previewen valt.
7. **Batch-gate**: Talat previewt de staging-batch en publiceert naar live.

## Wat de agent doet vs wat Talat houdt

| Stap | Wie |
|---|---|
| Item kiezen, coderen, PR, merge naar staging, verifiëren, rapporteren | agent |
| Preview-batch beoordelen + publiceren naar live | Talat |
| Connector-goedkeuring bij Murat regelen | Talat |
| Klant-akkoord / terugkoppeling Anna | Talat |

## Scope: wat valt er nu in de loop

Uit [[pdp-cro-changelist]], alleen theme-code (connector-items expliciet eruit):

- **Prio 0, urgent business:** "morgen in huis"-USP + countdown pauzeren tot verzending hervat (magazijnverhuizing, vanaf 28 juli). Nu misleidend richting Google Ads-verkeer. Puur theme-code, moet eerst.
- PDP: USP icon-strip onder prijs/CTA, mobiele stapelvolgorde, omschrijving uitklapbaar, ATC hoger, titel niet 2x, lege witruimtes, gerelateerde-carousel inkorten.
- Polish: "Description" → "Productomschrijving", US-datum → NL-datum, ATC-knop tekst i.p.v. tasje-icoon, dubbele cookiebanner.
- Trust: universele trust-strip hardcoden, `usp-strip.liquid` + `spec-table.liquid` snippets.
- Header: sticky menu, betaalmethodes onder koopknop, reviews onder titel (deels code al klaar).
- Homepage: hero-contrast, footer, Trustpilot-sectie.
- Announcement bar op mobiel inkorten, banner-foto ook op cart weghalen.

**Buiten scope (connector):** menulabel "Contactpagina" → "Contact" (navigatie), odd-cent kortingen (prijzen), alle metafield-data.

## Prerequisite (het enige wat nog mist)

- **Staging preview-URL** van het gekoppelde staging-theme (Shopify admin → Online Store → Themes → staging → Preview). Nodig voor stap 5. Zonder dit kan de agent wel bouwen + mergen, maar niet op echt staging verifiëren (alleen lokaal simuleren).

## Herbruikbaarheid

Deze loop is klant-agnostisch: repo + staging-koppeling + changelist + gh-auth. Zodra hij voor Lichtendirect draait, is het de template voor elke volgende Shopify-klant. Dit is de geproductiseerde levering waarmee een retainer hoge marge houdt in plaats van uren te vreten.
