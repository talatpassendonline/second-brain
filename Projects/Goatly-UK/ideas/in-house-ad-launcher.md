---
type: idea
project: Goatly-UK
status: parked
tags: [goatly-uk, scaling, infra, ad-launcher, later]
date: 2026-07-14
---

> [!note] Geparkeerd, bewust
> Dit is een opschaal-tool, geen crisis-fix. Nu bouwen zou focus wegtrekken van waar het deze weken op aankomt (schoon herlanceren, CFS-oorzaak dichten, winnende ads vinden). Vastgelegd zodat het niet verdampt, niet zodat het nu je aandacht opeist.

## Wat het is

Een bouwhandleiding voor een eigen Meta ad-launcher: een zelfgebouwde app (Next.js, Postgres, S3) die in bulk advertenties naar Facebook/Instagram schiet via Meta's Marketing API, met je eigen Meta-app en system-user-token, zónder externe SaaS die je account-toegang vasthoudt. Bron-gids bewaard naast dit bestand: [[ad-launcher-build-guide]].

Functies: creative-bibliotheek (uploaden + AI-sortering), een Launch Studio waar je spreadsheet-gewijs tientallen ads tegelijk opbouwt en in één klik live zet, plus campagne/adset-builders. Het soort tool dat grote media-buyers gebruiken om launch-tempo te maken.

## Waarom ooit relevant voor ons

Onze strategie is launch-cadans (elke dag nieuwe ads, [[framework-depth-not-area|depth-not-area]]). Handmatig klikken in Ads Manager is dan de bottleneck. Deze tool haalt die bottleneck weg en maakt ons onafhankelijk van tools die onze toegang beheren ([[reference_vault_mcp|WeTracked-achtige]] afhankelijkheid).

## Waarom NU niet

- Lost het huidige probleem niet op: de pijn is de CFS-ban en fragiele BM/pixel-infra ([[project_goatly_meta_cfs_ban]]), niet launch-snelheid. Dezelfde launcher schiet naar dezelfde Meta-infra met dezelfde ban-risico's.
- Leunt op een system-user-token, precies het type dat deze week dood ging toen de oude BM omviel.
- Weken developer-werk (Next.js, OAuth, encryptie, opslag, Meta app review voor multi-account). Solo-operator-capaciteit ontbreekt nu.

## Re-entry-trigger (wanneer dit weer oppakken)

Alle drie tegelijk waar:
1. Minstens 1 gevalideerde winnende ad (Shopify-gereconcilieerde CPA onder target, 3-7 dagen data).
2. Account draait 2-4 weken stabiel zonder CFS-signalen op moeders BM.
3. Launch-volume is aantoonbaar de bottleneck (je wilt >10-20 varianten/dag en handwerk remt).

Tot die drie kloppen: laten liggen.
