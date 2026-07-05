This folder is the **ebook drop zone**. [[me|Talat]] dumps raw PDFs (bot-gezondheid, osteoporose, calcium, A2-melk, hormoonbalans 50+) hier. Elke PDF wordt 1x verwerkt naar een markdown extract dat permanent doorzoekbaar is voor [[business|Goatly]] ad copy.

## Drop and forget flow

1. [[me|Talat]] dropt `{boek-titel}.pdf` direct in deze map.
2. Later in een willekeurige Claude sessie zegt hij: *"verwerk de nieuwe ebooks"* of *"process queued ebooks in Resources/research/ebooks/"*.
3. Claude scant deze map, vindt elke `.pdf` die nog **geen** bijbehorende `{boek-titel-slug}.md` extract heeft, en verwerkt ze.

## What a Claude session must do per unprocessed ebook

For each PDF without a paired extract:

1. **Extract text** via `/opt/homebrew/bin/pdftotext "{pdf-path}" /tmp/{slug}.txt`. Read the result. Skip table-of-contents pages and bibliography.
2. **Identify what's there**: focus topic (osteoporose, calcium-vormen, hormoonbalans, etc), avatar fit ([[icp]] = sceptische NL vrouwen 50-70), claim-density (compliance check).
3. **Write `{slug}.md`** alongside the PDF using the template below.
4. **Update `Resources/research/ebooks/INDEX.md`** with one line: `- [[ebook-slug]] . focus . source . status`.
5. **If the ebook delivers nieuwe angle(s)**: append them to `/Users/talat/Desktop/Goatly_kennis/brand/angle_bank.md` met source citation.
6. **Verify**: every extract must have **8+ wikilinks** to existing Context files. Lazy extracts with 0-2 wikilinks are rejected and re-done.

## Extract template (use exactly this shape)

```markdown
---
type: ebook-extract
source: "{auteur, jaar, titel}"
focus: "{1-zin scope, e.g. 'rol van K2 + magnesium in calcium-absorptie bij post-menopauzale vrouwen'}"
date: 2026-06-17
status: extracted
tags: [bone-health, ebook, copy-source, {topic-tag}]
---

# {Boek titel}

## Wat het is
1-zin samenvatting voor [[me|Talat]] om snel te scannen.

## Top inzichten voor copy bij [[icp|De Versterker]] avatar
1. {inzicht} . pagina {n} . quote of paraphrase. **Bron-link voor verificatie.**
2. ...
(streef naar 8-12)

## Feiten + bronnen (voor [[me|Talat]]'s eigen compliance-call)

Per feitelijke claim: korte beschrijving + pagina/sectie + originele formulering uit boek. [[me|Talat]] oordeelt zelf welke claims hij waar gebruikt. Geen "veilig in copy"-tabel meer (zie root CLAUDE.md rule 16). Voorbeeld:

- "31% verhoogd hartaanvalrisico bij carbonate-supplement" . p. X / Boland 2010 meta-analyse . originele wording: *"..."*. 
- "Bouwteam-mechanism" . p. X . *"..."*.

## Avatar-taalgebruik
Verbatim formuleringen / framings die [[icp|De Versterker]] zou herkennen. Direct copy-en-plakable quotes voor [[brand]] voice work.

## Bruikbare angles (vergelijk met `/Goatly_kennis/brand/angle_bank.md`)
- {angle} . relateert aan bestaande angle X, of is nieuw
- Voeg nieuwe angles toe aan angle_bank.md met source citation.

## Wat is irrelevant / weak
Stukken die niet [[business|Goatly]] avatar of mechanism raken. Tijd-besparend voor [[me|Talat]].

## Cross-links
- [[icp]] . waar avatar pasvorm zit
- [[pain-points]] . welke pijn dit boek raakt
- [[brand]] . voice + framing
- [[business|Goatly]] . product mechanism context
- [[Nadine Hermans]] . als boek autoriteits-style geeft
- Eventueel: [[me|Talat]], [[strategy]], [[Gezond Ouder Worden]], [[Goatly Nederland]], [[CalciumChew]]
- Deep canon: `/Users/talat/Desktop/Goatly_kennis/claude.md`
```

## Rules

- **Minstens 8 wikilinks per extract** naar bestaande Context files. Dat is wat de graph groeit en de extract bruikbaar maakt.
- **Raw PDFs blijven hier permanent** voor archief en verificatie. Niet verplaatsen.
- **Eén extract per ebook**, niet meerdere. Als een boek meerdere onderwerpen raakt: 1 extract met meerdere `## Top inzichten` subsecties.
- **Geen "compliance check" tabellen door Claude.** Lever feiten + bronnen, [[me|Talat]] beoordeelt zelf (zie root CLAUDE.md rule 16).
- **Geen em-dashes** in extracts (root [[CLAUDE]] rule 14).
- **Voor copy-werk**: lees relevante extracts via `Glob Resources/research/ebooks/*.md` en `Grep` op topic. Niet alle extracts elke sessie inladen.
