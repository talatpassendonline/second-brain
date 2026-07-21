---
type: spec
date: 2026-07-21
project: FIX-Group
status: open
tags: [site-factory, images, higgsfield]
---

Wachtrij voor de 3 ontbrekende [[FIX Group]]-beelden. De site-code verwacht deze exacte bestandsnamen in `~/fix-group/public/images/`. Genereer met Higgsfield `gpt_image_2`, aspect_ratio 16:9, resolution 2k, quality high (7 credits per stuk), daarna: `sips -Z 1920 -s format jpeg -s formatOptions 82 <in>.png --out <naam>.jpg`, png weggooien, `cd ~/fix-group && npm run build && git add -A && git commit && vercel deploy`, preview-URL in [[taken]] en het dashboard zetten.

## 1. beveiliging.jpg

> Candid documentary photograph, completely realistic: a professional Dutch event security steward in his 30s stands at the entrance gate of an outdoor event in the Netherlands, earpiece in ear, calm and alert posture, festival fencing (dranghekken) and a queue of visitors softly out of focus behind him, early evening light. He wears black trousers and a black jacket with a clean white chest logo: bold letters 'FIX.' with the dot in red, tiny word 'GROUP' beneath it. Natural skin texture, not looking at the camera, slightly imperfect documentary framing, realistic Dutch event context. No studio lighting, no posing, no gloss.

## 2. onderweg.jpg

> Candid documentary photograph, completely realistic: view through the windshield area from the passenger side of a Dutch service van driving on a Dutch residential road in the morning, driver is a service technician in his 30s wearing a navy softshell jacket with a small chest logo: bold white letters 'FIX.' with the dot in red, tiny word 'GROUP' beneath it, both hands on the wheel, focused on the road, Dutch brick houses and bicycle lane visible through the windows, soft overcast light, natural skin texture, slightly imperfect framing like a colleague took the photo from the passenger seat. No studio look, no gloss.

## 3. klant.jpg

> Candid documentary photograph, completely realistic: at the front door of a Dutch terraced house, a FIX service technician in navy workwear with a small white chest logo 'FIX.' with red dot and tiny 'GROUP' beneath it shows a clipboard with the completed job to a satisfied Dutch homeowner woman in her 50s standing in her doorway, both looking at the clipboard not at the camera, relaxed friendly moment, soft afternoon light, brick facade and doorbell visible, natural skin texture, slightly imperfect documentary framing. No studio lighting, no posing, no gloss.
