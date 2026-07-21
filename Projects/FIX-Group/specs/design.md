---
type: spec
date: 2026-07-21
project: FIX-Group
status: review
tags: [site-factory, design, brand]
---

Brand-fundament voor de [[FIX Group]] site. Wacht op akkoord van [[me|Talat]] (review-gate 1). Gebaseerd op [[site-intake]] + [[referentie-analyse]]. Klantwensen: rood erin verwerkt, minimalistisch logo (zelf genereren), leads + visitekaartje.

## Positionering in één zin

Eén nummer voor elk probleem in en om het pand: vier vakteams, 24/7, heel Nederland.

## Kleuren

Rood is de klantwens én past het merk: urgentie, spoed, actie. Maar rood-overal oogt als een folder. Dus: rood als signaal, rust als basis.

| Rol | Kleur | Gebruik |
|---|---|---|
| Primair accent | Signaalrood `#D7263D` | Logo-accent, primaire CTA's, spoedbalk, iconen-accent |
| Donker | Antraciet `#1A1D21` | Koppen, footer, tekst |
| Basis | Gebroken wit `#FAFAF8` | Achtergronden |
| Secundair vlak | Koel lichtgrijs `#EEF0F2` | Afwisselende secties, kaarten |
| Divisie-tint (subtiel) | Per divisie één gedempte tint (blauwgrijs, groengrijs, amber, staalblauw) | Alleen als dunne kaart-rand/icoon, nooit als vlak |

Regel: maximaal één rood element per viewport naast de vaste spoedbalk. Rood verliest zijn urgentie-functie als het decoratie wordt.

## Typografie

- **Koppen**: een strakke grotesk met karakter (Archivo of Space Grotesk), zwaar gewicht, krap gespatieerd. Geeft het "sterk bedrijf"-gevoel zonder corporate-saai.
- **Body**: Inter of systeem-grotesk, 16-18px, regelhoogte ruim. Leesbaarheid boven alles, de doelgroep is 30-65.
- Geen script-fonts, geen afgeronde "vriendelijke" fonts. Dit is een bedrijf dat 's nachts je lekkage komt fixen.

## Logo (minimalistisch, te genereren)

Wordmark: **FIX** in de zware kop-grotesk, antraciet, met "Group" eronder of ernaast in licht gewicht. Eén rood element als vast merkteken: het punt op de X-kruising of een rood blokje/punt achter FIX ("FIX."). Werkt op wit, op antraciet en als favicon (alleen "F." in rood blokje). Geen beeldmerk-illustraties, geen gereedschap-iconen in het logo.

## Beeldtaal

- Fotorealistisch, echte werksituaties: monteur bij een meterkast, loodgieter onder een gootsteen, schoonmaker in een kantoor bij ochtendlicht. Nederlandse settings (rijtjeshuis, kantoorpand, VvE-portiek).
- Geen stock-glimlach naar de camera, geen handen-schudden-in-pak, geen Amerikaanse huizen. Kandidaat-checks: zou dit een foto kunnen zijn die een monteur's collega maakte?
- Kleurtoon: neutraal daglicht, licht koel. Rood komt uit de UI, niet uit de foto's.
- Iconen: dunne lijn-iconen, één gewicht, antraciet met rood accent-detail.

## Toon (copy)

- **U-vorm.** Doelgroep is huiseigenaren 35+ en zakelijke beslissers; "je" ondermijnt het vakmanschap-frame.
- Direct en concreet: "Binnen 45 minuten bij u" verslaat "wij streven naar snelle service". Plain language, geen em-dashes, geen uitroeptekens.
- Elke pagina beantwoordt drie vragen in deze volgorde: wat lost u op, hoe snel, wat kost het me om te vragen (niets, vrijblijvend).
- Cijfers alleen als ze waar te maken zijn. "Geen voorrijkosten*" met sterretje ondermijnt vertrouwen: één keer helder de voorwaarde noemen in plaats van een asterisk.

## Layout-principes

- Veel wit, één boodschap per sectie (de Facilicom-rust, niet de template-drukte van de huidige draft).
- Mobiel eerst: sticky bel-knop onderin op mobiel, spoedbalk altijd zichtbaar bovenin.
- Divisie-kaarten als primaire home-navigatie, groot en klikbaar.
- Secties wisselen wit / lichtgrijs, spoed-elementen zijn de enige rode vlakken.

## Technisch

Next.js + Vercel (preview-URL's per wijziging, domein kan later gekoppeld worden). Formulier via een serverless endpoint naar e-mail. Statisch waar mogelijk, snel op mobiel.
