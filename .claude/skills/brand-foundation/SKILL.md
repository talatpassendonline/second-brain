---
name: brand-foundation
description: Bouw het merkfundament voor een Passendonline-klant, zes documenten van deep research tot Claude-instructies, plus optioneel een brand guide. Gebruik bij "merk bouwen" voor een klant, als fase vóór site-factory of ad-factory, of als los verkoopbaar deliverable. Eén review-gate voor Talat.
---

# Brand Foundation

Merkfundament-pipeline voor [[Passendonline]]-klanten. Doel: de laag onder elke site, ad en email. Zonder dit fundament is alles wat erop gebouwd wordt een gok. Bewerkt overgenomen uit de 187N deep-research-SOP (zie [[leon-187n-brand-building-course-extract]]), aangepast op NL-klanten en de Passendonline-werkwijze.

**Niet voor [[business|Goatly]].** Goatly heeft de kennisbank als canon; dit is voor agency-klanten.

## Output

Zes bestanden in `Projects/{Klant}/foundation/`:

1. `deepresearch.md`, research-dossier: markt, concurrenten, klantentaal, pains, desires, proof points. Minimaal ~3.000 woorden, klantentaal letterlijk in blockquotes, bronnen-URL's inline.
2. `avatar-sheet.md`, volledig ingevulde klant-avatar (template in `templates.md` hier in de skill-folder).
3. `offer-brief.md`, product, belofte, uniek mechanisme, proof stack, garantie, prijs, positionering.
4. `necessary-beliefs.md`, de 4-6 "ik geloof dat..."-statements die de koper moet accepteren, elk met current belief en bridge, in funnel-volgorde.
5. `project-knowledge.md`, synthese van 1-4 in één referentie, inclusief de **verified vs unverified** splitsing en open research-gaten.
6. `claude-project-instructions.md`, plak-klare systeeminstructie zodat de klant (of wij) een Claude-project heeft dat de klant al kent.

Optioneel zevende deliverable: `brand-guide.html` + PDF (brand story + brand book als één self-contained pagina, export via headless Chrome). Alleen bouwen als de klant ervoor betaalt of het de deal helpt sluiten.

## Werkwijze

### 1. Intake
Vraag Talat (of haal uit bestaand projectmateriaal): wat verkoopt de klant, wie is de ideale klant, prijs en offer-structuur, bestaande site/ads, top-2-3 concurrenten, het grootste gewenste resultaat en de grootste angst, founder-verhaal en bestaand bewijs. Als er al een `Projects/{Klant}/` met intake of groeiplan ligt: eerst lezen, alleen de gaten vragen.

### 2. Research
Laad de `voc-research` skill vóór het schrijven; die bepaalt hoe klantentaal geëxtraheerd en per awareness-stage geclassificeerd wordt. Scrape reviews, fora, socials, concurrent-sites. Voor NL-klanten: NL-bronnen eerst (Trustpilot NL, Google reviews, NL fora), klantentaal in het Nederlands citeren.

### 3. Schrijven
Werk de zes documenten in volgorde af; elk document bouwt op het vorige. Principes:
- **Argument vóór woorden.** Elk toekomstig stuk copy installeert één necessary belief.
- **Klantentaal letterlijk.** Pains citeren, nooit parafraseren.
- **Proof-discipline.** Geen claim, cijfer of testimonial die niet gevonden is. Gaten flaggen als open vraag, nooit invullen. Verified vs unverified expliciet scheiden in `project-knowledge.md`.
- **Specifiek boven hype.** Echt getal, echte termijn, echte before/after.
- Compliance-oordelen zijn aan [[me|Talat]]: feiten + bron leveren, geen veilig/onveilig-tabellen.

> [!important] Review-gate
> STOP na het schrijven. Talat leest minimaal `deepresearch.md` en `necessary-beliefs.md` voordat er iets op gebouwd wordt. Fouten in het fundament vermenigvuldigen zich in alles erboven.

## Doorstroom

- `site-factory` leest `foundation/` als die bestaat: copy-first, één sectie per belief.
- `ad-factory` vereist dit fundament (of een gelijkwaardige canon).
- Frontmatter op elk document: `type: foundation`, `project: {Klant}`, `status`, `tags`.
- Sessielog in `Daily/`, README van het klantproject bijwerken.
