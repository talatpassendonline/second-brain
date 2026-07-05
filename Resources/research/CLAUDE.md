Research drop zone parent. Bevat raw bronmateriaal voor [[business|Goatly]] ad copy + decisions, verwerkt naar markdown extracts die permanent doorzoekbaar zijn.

## Routing per type

| Source type | Drop folder | File types |
|---|---|---|
| Ebooks, whitepapers, PDF research | `ebooks/` | `.pdf` (plus auto-generated `.md` extracts) |
| Podcast episodes (audio + transcripts) | `podcasts/` | `.mp3`, `.m4a`, `.wav`, `.txt`, `.srt`, plus `.md` extracts |
| Articles, blog posts, longreads | `articles/` (create when first needed) | `.pdf`, `.html`, `.md`, `.txt` |
| Videos / YouTube transcripts | `videos/` (create when first needed) | `.txt`, `.srt`, `.vtt`, plus `.md` extracts |

Elke subfolder heeft zijn eigen `CLAUDE.md` met format-specifiek verwerk-recept en template.

## Universal drop-and-forget flow

1. [[me|Talat]] dropt raw source in de juiste subfolder.
2. Vergeet.
3. Later in een Claude sessie: *"verwerk de nieuwe research in Resources/research/{type}/"* of *"verwerk alle nieuwe research"*. Claude scant alle subfolders, vindt elke bron zonder bijbehorende `.md` extract, verwerkt ze.

## Output rules across all types

- **Extracts gaan naast de bron** in dezelfde subfolder (`foo.pdf` + `foo.md`).
- **Elke extract heeft minimaal 8 wikilinks** naar bestaande Context files (vooral [[icp]], [[pain-points]], [[brand]], [[business|Goatly]], voice personas).
- **Source citations + facts** per extract: lever feitelijke claims met paginanummer/timestamp + bronvermelding zodat [[me|Talat]] zelf de compliance-call kan maken (zie root CLAUDE.md rule 16).
- **INDEX.md per subfolder** bijgehouden door Claude bij elke verwerking.
- **Geen em-dashes** in extracts (root CLAUDE.md rule 14).

## When NOT to read research

Niet auto-loaden bij elke sessie. Lees extracts alleen wanneer:

- De taak is ad copy / advertorial / VSL / email-flow / avatar-werk
- [[me|Talat]] specifiek refereert aan een bron
- Een nieuwe claim of angle moet gevalideerd

Voor daily ops, housekeeping, strategie-vragen: skip research helemaal.
