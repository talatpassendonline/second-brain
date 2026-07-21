---
type: research
date: 2026-07-21
status: processed
project: Passendonline
tags: [brand-building, ai-workflow, ad-production, site-pipeline, agency]
---

Extract uit de gratis "Brand Building From Scratch Academy" van Leon (187N.AI), zelfde maker als de Claude Design cursus die al als `design:*` skills geïnstalleerd staat. Repo: https://github.com/novusordos666/Brand-Building-with-AI-Course (10 lesson-skills, prompts, SOPs, install.sh). De cursus is een funnel naar zijn masterclass en de revenue-claims zijn onverifieerbaar, maar de workflows zijn concreet. **Toepassing: [[Passendonline]]**, niet [[business|Goatly]].

## De grote observatie

187N is zelf een AI-agency die "owned operations layers" aan e-com brands verkoopt. Dat is hetzelfde model als waar Passendonline heen wil (agent-gedreven pipeline per klant). De cursus is dus twee dingen tegelijk: een werkende demo van de dienst die Passendonline kan verkopen, én een template voor Passendonline's eigen merk, site en outreach. Zijn positionering ("operators first, consultants never", "own vs rent") is direct bruikbaar als referentie voor hoe Passendonline zichzelf neerzet.

## Wat wij al hebben (niet opnieuw bouwen)

- Site-pipeline met referentie-structuur-kopie = `site-factory` + `site-craft`, al gedraaid op [[FIX Group]].
- Mission control dashboard = passendonline-dashboard.vercel.app.
- 24/7 agent-harness (zijn "Hermes") = scheduled tasks + Operator hier. Een third-party harness op een externe API-key is precies het "borrowed ground"-risico waar hij zelf voor waarschuwt.

## Wel meenemen

1. **Zes-docs-fundament als vaste klant-deliverable.** deep-research.md, avatar-sheet, offer-brief, necessary-beliefs, project-knowledge, project-instructions per klant. Dit is fase 1 van het [[Gordijnfestijn]] groeiplan ("merk bouwen") als productiseerbaar pakket, en de laag die nu mist tussen site-intake en build: FIX Group kreeg een site, geen merkfundament. De **necessary-beliefs sheet** (4-6 "ik geloof dat..."-statements met current belief → bridge) voeren wij nog niet als los artefact; sluit aan op keystone beliefs uit `voc-research`.
2. **Prospect-research → outreach agent als lead-machine.** Zijn les 6: leads verzamelen (Google Maps / web), deep research per lead (stack, omzetindicatie, pijn), ICP-fit-oordeel inclusief expliciete skips, gepersonaliseerde outreach per lead. [[FIX Group]] kwam inbound; dit is de repeteerbare acquisitie-kant die Passendonline nog niet heeft.
3. **Beat-for-beat ad-pipeline als verkoopbare dienst.** Script → ElevenLabs voice design (vaste merkstern per klant) → storyline per zin (10-11 scenes op 15 sec) → image-prompt per scene met character-sheet-ref + stijl-ref → Seedance 2.0 image-to-video mét sound effects → stitchen. Higgsfield MCP kan dit al (soul cinema, character + color transfer). Maakt van Passendonline site-bouwer → merk-bouwer: site plus ads plus brand voice uit één pipeline.
4. **Character sheet voor creative-consistentie.** Eén avatar-beeld → multi-view character sheet (front/side/back) → elke scene-generatie refereert eraan. Voorkomt AI-slop; per klant één keer maken, daarna herbruikbaar voor alle creatives.
5. **Full-page PNG als build-input.** Mobbin/FireShot full-page screenshot van de referentiesite meegeven aan de build met "exacte structuur, onze copy", in plaats van alleen een URL. Kleine toevoeging aan de referentie-analyse-stap van `site-factory`, lost referentie-drift op.
6. **Stijl-referentie locken vóór generatie.** Eerst stijlprofiel kiezen (film-stock / grain / documentair), elk beeld refereert eraan. Zelfde principe als de 3-stijl-stills-keuze bij FIX Group, maar vastgelegd als herbruikbaar profiel per klant.

## Verwerkt (21 jul 2026)

De hele repo is doorgelezen (10 lesson-skills, 6 SOPs, 9 prompt-recipes; install.sh is schoon, kopieert alleen markdown). Ingebouwd in de vault:

- **`brand-foundation` skill**: de zes-docs-pipeline als klant-deliverable, met NL-templates en één review-gate.
- **`ad-factory` skill**: angles → copy bank → statics → video-ads, omgebouwd van ChatGPT-tool/ElevenLabs naar de Higgsfield MCP, met character-sheet-stap, stijl-lock, ffmpeg-recepten en de brand-locked-HTML-naar-PNG-truc voor tekst-overlays en carousels.
- **`prospect-scout` skill**: de lead-machine uit les 6, met eerlijk fit/skip-oordeel en een harde verstuur-gate.
- **`site-factory` uitgebreid**: full-page screenshot als structuur-input tegen referentie-drift, copy-first-discipline, en één-sectie-per-belief wanneer een foundation bestaat.

Bewust niet overgenomen: Hermes-harness, dashboard-les, launch-les, de losse content/email/deck-skills (email dekt `email-marketing-bible`; de carousel-mechaniek zit in ad-factory recipes). De beste losse vondst uit `website-pro`: parallelle sectie-agents hebben geen globaal zicht, dus altijd een consistency-pass over het geheel budgetteren (duplicate-headlines-probleem).

## Niet doen

- De repo blind laten installeren (zip → "install de course"): eerst de skills lezen, dan selectief overnemen. Random GitHub-account, self-installing skills.
- Hermes/OpenAI-harness naast de bestaande Operator zetten: tweede systeem, zelfde functie.
- Nog een dashboard bouwen.
