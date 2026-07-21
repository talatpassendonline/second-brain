# Recepten

Overgenomen en aangepast uit de 187N ad-creatives-prompts. `[BRACKETS]` vervangen; paden relatief aan `Projects/{Klant}/`.

## 1. Angle-types (kies wat de research draagt)

Elk type mappen op een echte pijn of belief uit de foundation, nooit forceren:
- **Kosten/verlies-angst**: de prijs van NIET oplossen.
- **Mechanisme-onthulling**: waarom de gebruikelijke fix faalt + het unieke mechanisme ("het doet niet X, het doet Y").
- **Vijand / anti-positionering**: "Geen [verwachte ding]. Een [echte ding]."
- **Before/after-transformatie**: de dag-uit-het-leven-verschuiving.
- **Bezwaar-killer**: het nummer-1-bezwaar frontaal beantwoorden.
- **Autoriteit / bewijs**: een gesourced getal, een genoemd resultaat.
- **Identiteit**: wie de klant mag worden.
- **Wij-vs-zij**: ons model vs de kapotte default van de categorie.

## 2. Hook-patronen (eerste 1,5 sec)

Pattern-interrupt visual + gesproken regel · "Stop met scrollen als [pijn]" · een groot getal in beeld · before/after-snap · directe callout van de avatar. Drie distinctieve hooks per body, elk een ander patroon. Weging en regels: `hook-punch` skill.

## 3. Copy bank schema (`ads/copy-bank.md`)

```
## Concept N — [angle] (Belief #X)
- Hook A / B / C: [eerste-1,5s-regels, verschillende patronen]
- Primary text: [1-3 zinnen, probleem → mechanisme → CTA, merkvoice]
- Headline (max 40 tekens): [...]
- Description: [...]
- CTA-knop: [Boek een gesprek / Shop nu / Meer info]
```

## 4. Static-achtergrond prompt (generate_image)

```
A [1:1 / 9:16] static ad background for [KLANT] — [angle in een paar woorden].
On-brand: palette [HEX uit design.md], mood [3 moodwoorden], [licht/donker].
Composition: duidelijk focuspunt + royale negatieve ruimte [boven/onder] voor een hook-regel en CTA-knop. Premium, scroll-stopping, hoog contrast.
No text in the image. No watermarks.
```

Copy-overlay daarna via de brand-locked HTML-card (§8), nooit door het beeldmodel.

## 5. Video-script schema (per concept)

```json
{ "concept": 1, "angle": "...", "aspect": "9:16", "beats": [
  {"t":"0-1.5s","label":"hook","vo":"[hookregel]","onscreen":"[max 5 woorden]","visual":"[still-prompt]"},
  {"t":"1.5-7s","label":"probleem","vo":"[pijn, klantwoorden]","onscreen":"","visual":"[...]"},
  {"t":"7-12s","label":"mechanisme","vo":"[de fix]","onscreen":"[bewijs, gesourced]","visual":"[...]"},
  {"t":"12-15s","label":"cta","vo":"[CTA]","onscreen":"[offer]","visual":"endcard"} ] }
```

VO-tekst schoonmaken vóór generate_audio: getallen uitschrijven ("€65.000" → "vijfenzestigduizend euro"), acroniemen spellen, emoji's weg.

## 6. Motion-prompt (generate_video, image-to-video)

```
Animate this image into a [N]-second cinematic shot. Subtle motion only: slow push-in, gentle ambient drift, faint light movement. No new objects, no camera shake. Keep the exact colors and composition. Seamless, premium, [9:16 of 16:9].
```

Duur matchen op de VO van die beat (meet met `ffprobe -v error -show_entries format=duration -of default=nw=1:nk=1 vo/scene-N.mp3`).

## 7. ffmpeg-assemblage (9:16, captions, 3 hooks)

```bash
cd ads; mkdir -p work video
# body-beats concat (probleem → mechanisme → cta), 1080x1920
ffmpeg -y -f concat -safe 0 -i work/body_list.txt -c:v libx264 -crf 20 -pix_fmt yuv420p -r 30 -s 1080x1920 work/body.mp4
for H in A B C; do
  ffmpeg -y -f concat -safe 0 -i work/hook_${H}_list.txt -c:v libx264 -crf 20 -pix_fmt yuv420p -r 30 -s 1080x1920 work/v_$H.mp4
  ffmpeg -y -i work/v_$H.mp4 -i work/vo_$H.mp3 -c:v copy -c:a aac -b:a 128k -shortest work/va_$H.mp4
  # captions branden (Whisper-SRT of script-getimede SRT), veilige onderzone
  ffmpeg -y -i work/va_$H.mp4 -vf "subtitles=work/cap_$H.srt:force_style='FontName=[MERKFONT],Fontsize=14,PrimaryColour=&HFFFFFF&,BorderStyle=3,Outline=2,MarginV=120,Alignment=2'" -c:a copy work/vs_$H.mp4
  # logo rechtsboven; hook-tekst eerste 1,5s via drawtext; endcard is de laatste beat
  ffmpeg -y -i work/vs_$H.mp4 -i ../assets/logo.png -filter_complex "[1:v]scale=iw*0.12:-1[lg];[0:v][lg]overlay=W-w-40:40" -c:a copy "video/CONCEPT-1_[angle]_HOOK-$H.mp4"
done
```

Clip korter dan de VO: verlengen met `-vf "tpad=stop_mode=clone:stop_duration=X"`. Alles loggen naar `ads/assembly.log`.

## 8. Brand-locked HTML-card → PNG (statics-overlay en carousels)

Eén HTML-file per beeld/slide, tokens uit design.md, renderen met headless Chrome:

```html
<!doctype html><html><head><meta charset="utf-8">
<style>
  html,body{margin:0}
  .card{width:1080px;height:1350px;box-sizing:border-box;padding:96px 80px;
    background:[CANVAS_HEX];color:[TEXT_PRIMARY];font-family:[DISPLAY_FONT],system-ui,sans-serif;
    display:flex;flex-direction:column;justify-content:space-between;position:relative;overflow:hidden}
  .glow{position:absolute;filter:blur(120px);border-radius:50%;width:560px;height:560px;
    background:[ATMO_HEX];opacity:.22;top:-120px;right:-120px}
  .kicker{font-size:22px;letter-spacing:.2em;text-transform:uppercase;color:[TEXT_TERTIARY]}
  h1{font-size:104px;line-height:1.02;letter-spacing:-.02em;margin:0;font-weight:600}
  p{font-size:40px;line-height:1.4;color:[TEXT_SECONDARY]}
</style></head>
<body><div class="card"><div class="glow"></div>
  <div class="kicker">[KLANT]</div>
  <h1>[de ene grote regel]</h1>
  <p>[optionele ondersteunende regel]</p>
</div></body></html>
```

```bash
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
"$CHROME" --headless=new --disable-gpu --hide-scrollbars --force-color-profile=srgb \
  --window-size=1080,1350 --virtual-time-budget=4000 \
  --screenshot="slide-1.png" "file://$PWD/slide-1.html"
```

1080x1350 = IG-portrait, 1080x1080 = square, 1080x1920 = story. Voor statics met foto-achtergrond: gegenereerde achtergrond als `background-image` in de card, tekst eroverheen. Carousel-regel: slide 1 = hook, slides 2-6 = één waarde-beat per slide, laatste slide = CTA.
