---
type: prompt-template
status: active
tags: [ad-copy, native, prompt, session-starter]
date: 2026-06-17
---

Een prompt-template om in een nieuwe Claude-chat te plakken zodat je meteen op niveau start zonder eerst context te moeten uitleggen.

## Gebruik

Kopieer het blok hieronder. Plak in nieuwe chat (Claude Code, claude.ai web, of mobile via vault MCP). Vul `{topic}` en `{angle/hook}` in. Stuur.

Claude leest dan automatisch [[brand]], [[icp]], [[pain-points]], relevante research-extracts en `/Goatly_kennis/`, past de filter toe, en levert iets dat al voor 80% bruikbaar is.

## Template

```
Schrijf native ad copy voor [[business|Goatly]]. Topic: {topic, bijv. "post-diagnose moment" of "vermalen kalk vs voeding"}.

Voor je begint:

1. Lees `Context/brand.md` (vooral "Native ad copy filter") en `Context/icp.md` (avatar + taal).
2. Scan `Resources/research/podcasts/INDEX.md` en `Resources/research/ebooks/INDEX.md` voor relevante extracts voor dit topic. Lees 1 of 2 die direct passen.
3. Voor diepe ad-copy canon: scheel `/Users/talat/Desktop/Goatly_kennis/claude.md` voor mechanism, voice, compliance reminders.

Voor de output:

- Stijl: native, niet als ad. Past in een feed naast vriendinnen-content.
- Stem: kies bewust [[Nadine Hermans]] (autoriteit / mechanism) OF [[Gezond Ouder Worden]] (peer / herkenning) OF [[Goatly Nederland]] (merk / offer). Niet mixen binnen één asset.
- Lengte: {korte hook / 3-5 zinnen / volledige advertorial / VSL-script-fragment}.
- Filter: elke zin moet de bar uit brand.md halen. Schrap aanloop, schrap herhaling, schrap adjectieven die niets specificeren.

Geef me drie varianten met verschillende openers. Voor elk:
- De copy zelf
- 1-zin reasoning waarom deze opener werkt voor [[icp|De Versterker]]
- Welke zin de zwakste is en waarom (zodat ik weet wat ik kan schrappen)

Compliance is mijn call. Lever de copy zonder ✅/⚠️/❌ tabellen.
```

## Voorbeeld-invulling

> Schrijf native ad copy voor Goatly. Topic: **post-diagnose moment, vrouw kreeg net telefoontje met t-score -2,7**.
> 
> [rest van template]
> 
> Stem: [[Gezond Ouder Worden]] (peer-empathie past hier).
> Lengte: korte hook van 3-5 zinnen, optimaal voor Facebook native feed.

## Wat NIET in dit template

- Geen compliance-tabellen vragen, geen "veilig?"-flags. [[me|Talat]] beslist (root CLAUDE.md rule 16).
- Geen verzonnen statistieken vragen. Cijfers komen uit research-extracts of `/Goatly_kennis/performance_data.md`.
- Geen "draft + ik review", maar "drie varianten + zwakste zin per variant". Sneller iteratie-cyclus.

## Variant voor VSL-script

Vervang in template:

```
Topic: {VSL angle, bijv. "ik werd 10 cm korter zoals mijn moeder"}.
Lengte: VSL-script eerste 60 seconden (~150 woorden), volg structuur uit `/Goatly_kennis/vsl/VSL_SOP.md`.
Output: scene-by-scene met visual cue + voice-over tekst per beat.
```

## Variant voor advertorial

Vervang:

```
Lengte: volledige advertorial-opener (~300 woorden), volg structuur uit `/Goatly_kennis/claude.md` §advertorial.
Output: 3 koppen + intro-paragraaf voor elk, dan ik kies welke ik laat uitschrijven.
```

## Variant voor Klaviyo e-mail

Vervang:

```
Lengte: subject line + preview text + e-mail body van max 200 woorden voor {moment in flow, bijv. dosing instruction op dag 3}.
Output: 3 subject lines met open-reasoning + één volledige e-mail.
```

## Cross-links

[[brand]] §Native ad copy filter is de bar. [[icp]] §What she'd say to a friend is de taalbank. [[pain-points]] §physical/emotional/category-trust zijn de drie pijn-lagen. Per asset bewust kiezen welke pijn je raakt en met welke voice. Research-extracts in `Resources/research/` zijn de feiten-bron. Goatly_kennis canon is de productie-laag. Voor strategy alignment zie [[strategy]] §priority #1 VSL en §priority #4 review-flow.
