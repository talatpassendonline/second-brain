---
name: ad-factory
description: Produceer een complete ad-set voor een Passendonline-klant, van angles en copy bank tot statics en video-ads met voice-over via Higgsfield en ffmpeg. Vereist een brand-foundation. Gebruik bij "maak ads voor klant X", social creatives of een launch-set naast een nieuwe site. Twee review-gates voor Talat.
---

# Ad Factory

Creative-productie-pipeline voor [[Passendonline]]-klanten: angles → copy bank → statics → video-ads → launch sheet. Bewerkt overgenomen uit de 187N ads-factory (zie [[leon-187n-brand-building-course-extract]]), omgebouwd naar de Higgsfield MCP en de Passendonline-werkwijze.

**Niet voor [[business|Goatly]].** Goatly-ads volgen de kennisbank (`AD_COPY_SOP.md`, angle bank, native image doctrine). Deze skill is voor agency-klanten.

## Vereisten

- `Projects/{Klant}/foundation/` uit `brand-foundation` (minimaal avatar-sheet, necessary-beliefs, project-knowledge). Zonder fundament niet starten; eerst die skill draaien.
- `Projects/{Klant}/specs/design.md` voor palette, fonts en mood.
- Higgsfield MCP (generate_image, generate_video, generate_audio, create_voice) en `ffmpeg` lokaal.

## Specs (in alles bakken)

9:16 (1080x1920) primair, 1:1 voor feed. Hook in de eerste 1,5-2 sec. CTA in de laatste 3 sec. Captions altijd ingebrand (autoplay staat muted). 3 hooks per body voor testen. Persona-specifiek verslaat generiek.

## Pipeline

### 1. Angles + copy bank
Laad `hook-punch` vóór het schrijven van hooks. Lees avatar-sheet (pains, angsten, mislukte oplossingen, bezwaren), necessary-beliefs en de messaging library. Schrijf 5-8 concepten naar `Projects/{Klant}/ads/ad-concepts.md` + Meta-klare `ads/copy-bank.md`. Elk concept: angle (de psychologische wig), 3 distinctieve hooks, primary text, headline (max 40 tekens), description, CTA, en de ene belief die het concept installeert. Klantentaal letterlijk voor hook en pijn; merktaal voor de oplossing. Alleen gesourcede claims. Angle-types en schema's: `recipes.md` in deze skill-folder.

> [!important] Review-gate 1
> Talat leest en snoeit de angles voordat er één beeld gegenereerd wordt. Copy is goedkoop, creatives niet.

### 2. Character sheet + stijl-lock
Vóór massaproductie twee ankers vastzetten, anders wordt het AI-slop:
- **Character sheet**: genereer de avatar-protagonist (past bij de klant-avatar, spiegel de koper), kies met Talat één variant, maak er een multi-view character sheet van (front/side/back). Elke scene refereert hieraan.
- **Stijl-lock**: 3 goedkope stills in verschillende richtingen (documentair / cinematisch / clean) aan Talat voorleggen, winnaar wordt het stijlprofiel voor de hele set. Zelfde les als de FIX Group fotografie-ronde.

### 3. Statics
Per concept een tekstvrije achtergrond genereren (generate_image, stijl-lock + design.md-palette, negatieve ruimte voor hook en CTA), daarna de copy er pixel-perfect op branden via een brand-locked HTML-card die met headless Chrome naar PNG gaat (recept in `recipes.md`). Nooit tekst door het beeldmodel laten zetten. Output: `ads/static/concept-N-{1x1|9x16}.png`.

### 4. Video-ads
Voor de top 2-3 concepten, 15 sec, 9:16:
1. **Storyline**: script beat-voor-beat uitschrijven (hook / probleem / mechanisme / CTA), schema in `recipes.md`.
2. **Voice**: vaste merkstern per klant via create_voice (NL-stem voor NL-klanten), voice-over per scene via generate_audio. Tekst eerst schoonmaken: getallen uitschrijven, acroniemen spellen, geen emoji's.
3. **Beelden**: still per scene (generate_image, character sheet + stijl-lock als referentie), daarna motion via generate_video (subtiel: langzame push-in, ambient drift, geen nieuwe objecten, kleuren locked).
4. **Assemblage**: ffmpeg-recept uit `recipes.md`: beats concat, VO eronder, captions branden, hook-tekst eerste 1,5 sec, CTA-endcard met logo, 3 hook-varianten per body. Output: `ads/video/CONCEPT-{n}_{angle}_HOOK-{A|B|C}.mp4` + `ads/assembly.log`.

### 5. Launch sheet
`ads/launch-sheet.md`: per creative de primary text, headline, CTA en target-belief, upload-klaar. Higgsfield-credits en kosten in het eindrapport.

> [!important] Review-gate 2
> Talat ziet de set vóór er iets richting klant of ad-account gaat. Claude publiceert nooit zelf. Compliance-oordelen zijn aan Talat: feiten + bron, geen veilig/onveilig-tabellen.

## Administratie

Alles onder `Projects/{Klant}/ads/`. Sessielog in `Daily/`, klant-README bijwerken. Uren naar `Projects/{Klant}/uren.md`.
