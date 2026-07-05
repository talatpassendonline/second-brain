Podcast research drop zone. Audio of transcript files van afleveringen die [[business|Goatly]] copy informeren (bot-gezondheid, calcium, hormoonbalans 50+, ondernemerschap, marketing).

## Drop and forget flow

[[me|Talat]] dropt één van deze:

1. **Raw transcript** (`.txt`, `.srt`, `.vtt`) als de aflevering al ergens getranscribeerd is (Spotify export, Otter, Fireflies, YouTube auto-captions, Notion AI). Hernoem naar `{podcast-show-slug}-{episode-slug}.txt` als je een naamsverbetering kunt geven, anders laat het zoals het is.
2. **Raw audio** (`.mp3`, `.m4a`, `.wav`) als je geen transcript hebt. Vereist transcription pipeline (zie hieronder).

## What a Claude session must do per unprocessed item

For each podcast file without a paired `.md` extract:

### Step 1, get transcript

- **Als source al `.txt`/`.srt`/`.vtt` is**: skip naar Step 2.
- **Als source `.mp3`/`.m4a`/`.wav` is**: check of Whisper geïnstalleerd is:
  ```bash
  which whisper || which whisper-cpp || which /opt/homebrew/bin/whisper
  ```
  - Als geïnstalleerd: `whisper "{audio-path}" --model base --output_format txt --output_dir /tmp/`. Lees `/tmp/{basename}.txt`.
  - Als niet: schrijf in Operator Tasks Housekeeping queue: *"Whisper niet geïnstalleerd, [[me|Talat]] handmatig transcript dropen of `brew install whisper-cpp` runnen"*. Skip deze file, ga naar volgende.

### Step 2, write extract

Use the template below. Save als `{slug}.md` naast de audio/transcript.

### Step 3, update INDEX

Append: `- [[episode-slug]] . focus . source . status`.

### Step 4, angle-bank check

Als de aflevering nieuwe angle(s) oplevert voor [[brand]]: append aan `/Users/talat/Desktop/Goatly_kennis/brand/angle_bank.md` met source citation (podcast naam + aflevering + timestamp van quote).

## Extract template (use exactly)

```markdown
---
type: podcast-extract
podcast: "{podcast show name}"
episode: "{episode title}"
host: "{host name(s)}"
guest: "{guest name(s) or 'none'}"
duration: "{HH:MM:SS or unknown}"
date_aired: "{YYYY-MM-DD or unknown}"
date_processed: 2026-06-17
status: extracted
tags: [podcast, copy-source, {topic-tag}]
---

# {Podcast show}, {episode title}

## Wat het is
1-zin samenvatting voor [[me|Talat]].

## Top inzichten voor copy bij [[icp|De Versterker]] avatar
Cite **timestamps** waar mogelijk (`[00:14:22]`) zodat [[me|Talat]] direct naar het stuk kan luisteren.

1. {inzicht} `[HH:MM:SS]` . paraphrase of quote
2. ...
(streef naar 8-12)

## Feiten + bronnen (voor [[me|Talat]]'s eigen compliance-call)

Per feitelijke claim: korte beschrijving + timestamp + originele formulering. [[me|Talat]] oordeelt zelf welke claims hij waar gebruikt (zie root CLAUDE.md rule 16). Geen "veilig in copy"-tabel meer.

- {claim} . `[HH:MM:SS]` . originele wording: *"..."*
- ...

## Avatar-taalgebruik
Verbatim quotes van host/guest die [[icp|De Versterker]] zou herkennen. Goud voor [[Gezond Ouder Worden]] voice work.

## Bruikbare angles (vergelijk met `/Goatly_kennis/brand/angle_bank.md`)
- {angle} `[HH:MM:SS]` . nieuw of variant op bestaande
- Voeg toe aan angle_bank met source citation.

## Bullshit / niet bruikbaar
Eerlijke avoid-pile. Veel podcasts in dit domein klotsen vol Amerikaanse hype, supplement-spam, of arts-tegen-arts polemiek.

## Audio cue
Path naar audio (als geupload): `Resources/research/podcasts/{filename}`. [[me|Talat]] kan de quote-timestamps gebruiken om terug te zoeken.

## Cross-links
- [[icp]] . avatar pasvorm
- [[pain-points]] . pijnen geraakt
- [[brand]] . voice + compliance
- [[business|Goatly]] . product context
- [[Nadine Hermans]] . als autoriteits-style nodig
- [[Gezond Ouder Worden]] . als peer-voice nodig
- [[strategy]] . als angle nieuwe priority raakt
- Deep canon: `/Users/talat/Desktop/Goatly_kennis/claude.md`
```

## Rules

- **Minstens 8 wikilinks per extract** (graph + bruikbaarheid).
- **Timestamps citeren** waar mogelijk. Zonder timestamps is een quote half-bruikbaar.
- **Audio/transcript blijft hier permanent** voor archief en terug-luister.
- **Eén extract per aflevering**.
- **Geen "compliance check" tabellen door Claude.** Lever feiten + bronnen, [[me|Talat]] beoordeelt zelf (zie root CLAUDE.md rule 16).
- **Geen em-dashes**.
- Voor copy-werk: `Grep` op topic of guest-naam, niet alle extracts inladen.
