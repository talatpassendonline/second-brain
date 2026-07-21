---
type: project
date: 2026-07-21
project: FIX-Group
client: FIX Group
status: lead
tags: [client, website, passendonline, site-factory]
priority: medium
---

Site-lead van [[Passendonline]]: [[FIX Group]] heeft [[me|Talat]] gevraagd een website te maken. Nog niet gestart, nog geen domein. Eerste klus voor de `site-factory` pipeline zodra de intake gevuld is.

## Status

**LIVE op productie-URL** (2026-07-21): review-gate 2 gepasseerd (Talat wilde de link naar de klant sturen = akkoord), v8 gepromoot. Publieke, deelbare link: **https://fixgroup-website.vercel.app**. Previews blijven achter Vercel-login.

- Repo: `~/fix-group` (Next.js 16 + Tailwind 4, gelinkt aan Vercel-project `fixgroup-website`).
- Productie (v8, publiek deelbaar): https://fixgroup-website.vercel.app
- Laatste preview: https://fixgroup-website-hy3xaftfg-talat-3342s-projects.vercel.app (alleen met Talat's Vercel-login)
- Fotoset: 9 beelden via GPT Image 2 met FIX-branding in `public/images/` (mix: documentair basis, corporate voor cleaning/zakelijk; spoed.jpg = cinematische reserve, nog niet geplaatst)

- Gebouwd volgens [[design]]: rood/antraciet, Archivo, FIX.-wordmark, eyebrow-blokjes, scherpe hoeken. Echt nummer (06 36 13 14 23) overal doorgevoerd, incl. WhatsApp-links.
- Nieuw: `/over-ons` (oprichtingsverhaal twee jonge ondernemers) en `/zakelijk` (MKB, VvE, horeca, vakantieparken).
- Prijs: vriendenprijs EUR 400.

> [!warning] Livegang-blokkades
> Reviews op de site zijn **placeholders** (gemarkeerd in `src/data/reviews.ts` en `ReviewGrid.tsx`). Vervangen door echte klantreviews vóór het domein eraan gaat. Domein: klant registreert op eigen naam.

## Next steps

1. Review-gate 2: Talat bekijkt de preview → feedback of akkoord.
2. Na akkoord: `vercel deploy --prod` en delen met de klant.
3. Klant levert: echte reviews, evt. eigen foto's, domeinnaam-keuze.
4. Optioneel ronde 2: echte fotografie (Higgsfield-stills, 3 richtingen ter keuze), offerteformulier aan e-mail koppelen.
