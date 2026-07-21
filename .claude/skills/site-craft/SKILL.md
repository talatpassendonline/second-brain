---
name: site-craft
description: Bouwstandaarden voor klantsites van Passendonline. Semantische HTML, fluid CSS-tokens, sectie- en copy-patronen, two-step leadformulier, proof-secties en een performance-checklist. Wordt automatisch geladen in de build-fase van site-factory; ook los bruikbaar bij losse landingspagina's of site-audits.
---

# Site Craft

Bouwstandaarden voor elke [[Passendonline]] site-build. Gedestilleerd uit een prompt-pack van [[me|Talat]] (2026-07-21), ontdaan van buzzwords, teruggebracht tot wat aantoonbaar werkt. Aanvulling op de `frontend-design` skill (esthetiek); dit document gaat over structuur, snelheid en conversie.

## 1. Semantisch skelet

- Strikte HTML5-structuur: `header`, `nav`, `main`, `section`, `article`, `footer`. Divs alleen als layout-wrapper zonder betekenis-alternatief.
- Elke pagina: exact één `h1`, koppen dalen zonder niveaus over te slaan.
- Layout-shift voorkomen: afbeeldingen en video's krijgen altijd `width`/`height` of `aspect-ratio`; fonts met `font-display: swap` en een gematchte fallback.
- Landmarks compleet (nav met `aria-label`, skip-link) zodat de site zonder muis en met screenreader werkt.

## 2. CSS-systeem

- Alle merkbeslissingen als custom properties in één `:root`-blok: kleuren, spacing-schaal, radii, schaduwen. De tokens komen 1:1 uit de design.md van het project.
- Fluid typografie met `clamp()`: kop- en bodymaten schalen tussen 375px en 1440px zonder breakpoint-trappen.
- Grid voor paginalayouts, flexbox binnen componenten. Geen utility-soep in de markup als een component-class hetzelfde zegt.
- Dark mode alleen als het merk erom vraagt; een vakmannenbedrijf heeft er geen, een tech-klant misschien wel. Niet standaard meebouwen.

## 3. Sectie-patroon (diensten, features)

- Elke sectie beantwoordt één vraag en heeft één CTA. Meerdere boodschappen = sectie splitsen.
- Vast ritme per sectie: eyebrow-label (klein, caps, accent), kop (de belofte), 1-2 regels toelichting, dan de kaarten/inhoud.
- Scanbaar in 3 seconden: de koppen alleen moeten het verhaal al vertellen. Test: lees alleen de h2's, klopt de pitch dan nog?
- Geen ALL-CAPS-paragrafen of schreeuw-opmaak; contrast komt uit maat en gewicht, niet uit hoofdletters.

## 4. Copy-patroon (zero fluff)

- Hero-volgorde: wat lost u op → voor wie → bewijs → actie. In die volgorde, geen mission statements.
- Elke claim concreet: "binnen 45 minuten ter plaatse" verslaat "snelle service". Geen claim die de klant niet kan waarmaken.
- Plain language, geen em-dashes, geen uitroeptekens, geen corporate vulsel ("wij streven ernaar", "kwaliteit staat voorop").
- Schrijf zoals de doelgroep praat; B2C-diensten meestal u-vorm, check de design.md.

## 5. Scripts en dynamiek

- Zo min mogelijk JavaScript; alles wat statisch kan, is statisch. Interactie (accordion, mobiel menu) eerst met native elementen (`details`, `dialog`) proberen.
- Geen externe widgets die de laadtijd slopen (chat-embeds, review-carrousels van derden). Bewijs wordt statisch getoond, hooguit met lichte lazy-load.
- Third-party scripts alleen met expliciete reden en altijd `defer`/lazy.

## 6. Leadformulier: two-step

- Stap 1 is drempelloos: telefoonnummer prominent (klik-om-te-bellen) en een mini-formulier met maximaal 2 velden (naam + telefoon, "wij bellen u terug").
- Stap 2 (optioneel, na of naast stap 1): het volledige offerteformulier (dienst-select, omschrijving, foto-upload). Nooit stap 2 als enige ingang.
- Beschikbaarheid tonen waar hij waar is: "24/7 bereikbaar" of openingstijden-indicator. Nooit een nep-"nu online"-pulse.
- Elke succesvolle submit krijgt een bevestigingspagina met verwachting ("wij bellen binnen X").

## 7. Proof-sectie

- Bewijs is concreet of het is er niet: echte cijfers, echte reviews, echte cases. Placeholder-bewijs mag alleen in previews en staat dan als placeholder gemarkeerd in de code, met een livegang-blokkade in het project-README.
- Vorm: kleine matrix of kaarten met per item één cijfer of één citaat plus context (wie, waar). Geen muren met logo's van bedrijven die geen klant zijn.
- Reviews krijgen naam + plaats/context; anonieme 5-sterren-rijen overtuigen niemand.

## 8. Performance-checklist (vóór elke oplevering)

- Lighthouse mobiel: Performance en Accessibility beide 90+, CLS < 0.1, LCP < 2.5s.
- DOM slank: geen wrapper-lagen zonder functie; component-bibliotheken niet importeren voor één knop.
- Beelden: moderne formaten (WebP/AVIF), responsive `srcset`, lazy-load onder de vouw, hero eager.
- Fonts: maximaal 2 families, subset, preload van de kop-font.
- Klik-paden: elke CTA werkt op mobiel met duim-formaat (44px+), telefoonnummers zijn `tel:`-links.
