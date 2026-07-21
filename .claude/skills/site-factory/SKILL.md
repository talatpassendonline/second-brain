---
name: site-factory
description: Bouw een complete klantsite uit een intake-formulier plus voorbeeldsite-URL. Pipeline van referentie-analyse tot publieke deploy, met foto's via Higgsfield, huisstijl-standaarden, SEO-pass en QA. Gebruik bij elke nieuwe Passendonline site-klus ("maak een site voor klant X", "bouw dit na"). Twee review-gates voor Talat; doel is één build-run + één fix-ronde.
---

# Site Factory

Productie-pipeline voor [[Passendonline]] site-werk. Doel: [[me|Talat]] levert een complete intake, agents leveren een deelbare site in één run plus maximaal één fix-ronde. Talat is reviewer, geen bouwer.

Versie 2, herzien na de [[FIX Group]]-pilot (9 rondes; doel is 2). De les-sectie onderaan is bindend.

## Input: intake moet COMPLEET zijn

Template: `intake-template.md` in deze skill-folder → `Projects/{Klant}/specs/site-intake.md`.

**Harde regel na FIX**: bouw niet op een intake met open vraagtekens op deze velden: alle diensten/divisies (vraag expliciet "doen jullie nog meer?"), telefoonnummer, adres + KVK, e-mailadres, domeinwens. Ontbreekt er iets: genereer eerst een kort WhatsApp-klaar vragenlijstje dat Talat naar de klant stuurt, en bouw pas als de antwoorden er zijn. Elke aanname wordt anders een eigen feedback-ronde. Reviews mogen als gemarkeerde placeholders, al het andere niet.

## Huisstijl-standaarden (geleerd op FIX, altijd toepassen)

1. **Scanbaar boven alles.** De home toont het complete aanbod zonder één klik: per team/categorie alle diensten als chips. Detailpagina's zijn de SEO-laag, nooit de gebruikersflow. Max één zin per sectie-intro, werkwijze als compacte strip, geen FAQ/teaser-stapels op de home.
2. **Mobiel eerst reviewen.** Talat en de klant kijken op een telefoon. Elke hero-foto ook mobiel zichtbaar (achtergrond met gradient-overlay, geen los fotoblok), sticky bel/app-balk, alles wat telt boven de vouw.
3. **Foto's overal, vaste shotlist** (GPT Image 2, high/2k, 16:9 tenzij anders, klant-logo op kleding/bus in de prompt, documentair-realistisch, geen studio-glans): hero-aankomst (3:4), één beeld per team/dienstgroep, onderweg/werkwijze, klant-aan-de-deur, team-bij-bedrijfswagen, CTA-achtergrond (hergebruik team-beeld). Genereer de hele set VÓÓR review-gate 2, na de 3-stills-smaakkeuze. Reken ~7 credits per beeld.
4. **Menu zonder dode links**: parent-items met children zijn labels, geen `href="#"`.
5. **Copy**: hook-punch-regels, u-vorm bij dienstverleners, claims alleen als de klant ze waar kan maken, geen emoji's in de site.
6. **Nooit verzinnen wat controleerbaar is**: geen nep-KVK, adres, klantlogo's of reviews-als-echt. Placeholders markeren in code én als livegang-blokkade in het project-README.

## Pipeline

1. **Referentie-analyse**: structuur van de voorbeeldsite, nooit pixels. → `specs/referentie-analyse.md`
2. **design.md** → **Review-gate 1: Talat's akkoord vóór de build.**
3. **Build**: laad `frontend-design` + `site-craft`. Statisch/Next.js via Vercel of Shopify-theme volgens intake.
4. **Foto's**: 3 stijl-stills aan Talat (smaakkeuze), daarna de volledige shotlist. Check Higgsfield-verbinding bij de start van de run; dood = eerst melden, niet halverwege ontdekken.
5. **SEO-pass**: metadata per pagina, schema.org, sitemap/robots, metadataBase + OpenGraph, plaats-pagina's bij lokale klanten. **Standaard `robots: noindex` zolang de site op een tijdelijke URL of met placeholder-data draait**; SEO-launch-checklist (noindex eraf, Search Console, GBP) als taak bij domein-koppeling.
6. **QA**: mobiel 375px + desktop, dode links, formulieren, Lighthouse, menu-klikpad end-to-end.
7. **Review-gate 2, op een DEELBARE URL**: Vercel preview-URL's zitten achter login; deploy dus direct naar de productie-URL van het Vercel-project (die is publiek) of zet protection uit. Talat bekijkt, stuurt hem eventueel direct door naar de klant. **Feedback verzamelen als één lijst en in één fix-ronde verwerken**, niet druppel voor druppel deployen.

## Output-administratie

Na elke werksessie (werkafspraak agency-breed): `Projects/{Klant}/uren.md` + `taken.md` bijwerken, dashboard-app (`~/passendonline-dashboard`, `src/data/clients.ts`) bijwerken + prod-deploy, sessielog in `Daily/`. Higgsfield-credits noemen in het eindrapport.

## Lessen uit de FIX-pilot (bindend)

- Elke open intake-vraag werd een extra ronde; de helft van de 9 rondes was vermijdbaar met een complete intake en de huisstijl-standaarden hierboven.
- Higgsfield-verbinding kan per sessie dood zijn; reconnect door Talat geldt alleen voor nieuwe sessies. Bij dode verbinding: prompts + bestandsnamen in een `specs/foto-queue.md` zetten zodat elke verse sessie het kan afmaken.
- Talat's review = vaak direct doorsturen naar de klant; lever daarom nooit een URL op die achter een login zit.
