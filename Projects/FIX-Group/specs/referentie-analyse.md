---
type: spec
date: 2026-07-21
project: FIX-Group
status: completed
tags: [site-factory, referentie, facilicom]
---

Referentie-analyse voor de [[FIX Group]] site. Twee bronnen: de bestaande draft op fixgroup-website.vercel.app (inhoud + diensten) en facilicom.nl (structuur-referentie, door de klant aangewezen "omdat zij ook meer sectoren hebben").

## Wat FIX Group is (uit de draft-site)

Multiservice-vakmannenbedrijf, thuisbasis Hilversum, landelijk netwerk. Vier divisies:

| Divisie | Diensten |
|---|---|
| Fix 24/7 Service | spoedreparatie, klussen & montage, schilderwerk |
| Fix Cleaning | kantoorschoonmaak, bedrijfsschoonmaak, vakantiewoningen |
| Fix Electra | storing verhelpen, elektra aanleggen, meterkast vervangen |
| Fix Loodgieters | lekkage verhelpen, CV-ketel onderhoud en installatie |

Kernbeloftes: 24/7 bereikbaar, binnen 45 min ter plaatse bij spoed, geen voorrijkosten*, vakwerk gegarandeerd. Telefoonnummer is nog placeholder (085-XXXXXXX). Huidige draft-nav: Home, Diensten, Spoed, Werkgebied, Reviews, Contact. Huidige stijl: blauw/oranje template-look, rood alleen in de spoedbalk.

## Structuur-extract Facilicom (niet de pixels)

Waarom de klant dit mooi vindt en wat we ervan overnemen:

1. **Moedermerk boven divisies.** Facilicom presenteert zich als groep ("de grootste facilitaire dienstverlener") met daaronder bedrijven-kaarten die elk naar een eigen landingspagina leiden, met eigen submenu. Dit is exact het FIX-model: FIX Group als merk, vier divisies elk met een eigen pagina.
2. **Dubbele navigatie-ingang.** Menu splitst "Onze bedrijven" (merk-ingang) en "Facilitaire diensten" (probleem-ingang), beide naar dezelfde pagina's. Bezoekers zoeken op probleem, niet op merknaam.
3. **Doelgroep-grid.** "Oplossingen voor" met 9 sectoren. Voor FIX vertalen naar doelgroepen: Particulier, Zakelijk (kantoor/bedrijfspand), VvE & vastgoedbeheer, Vakantieparken (Fix Cleaning doet al vakantiewoningen).
4. **Eén herhaald CTA-blok.** "Neem contact op" komt op elke pagina terug in dezelfde vorm. Voor FIX: tweeledig, bel direct (spoed) naast offerte aanvragen (gepland werk); dat onderscheid heeft de draft al goed.
5. **Trust via verhaal, niet via claims.** Familiebedrijf, historie, impact. FIX-vertaling: werkwijze in 3 stappen (staat al), reviews, werkgebied-kaart, "één aanspreekpunt voor alles"-verhaal.
6. **Wat we NIET overnemen**: nieuws/blog-sectie (onderhoudslast zonder team), vacature-site, CSR-verhaal, cookie-wall met OneTrust. Te zwaar voor een bedrijf van deze maat; een site die actueel oogt zonder onderhoud wint.

## Pagina-structuur voorstel

1. **Home**: hero (positionering + bel/offerte), spoedbalk, 4 divisie-kaarten, hoe-werkt-het, doelgroepen-grid, reviews, werkgebied, FAQ, CTA-blok.
2. **4 divisiepagina's** (`/24-7-service`, `/cleaning`, `/electra`, `/loodgieters`): eigen hero, dienstenlijst met korte uitleg per dienst, relevante reviews, eigen FAQ, zelfde CTA-blok.
3. **Zakelijk** (`/zakelijk`): één pagina voor bedrijven/VvE/vastgoedbeheer/vakantieparken, contractwerk en onderhoudsafspraken.
4. **Werkgebied**: bestaande opzet (Hilversum-basis + plaatsen) uitbouwen, ook SEO-drager voor "loodgieter Hilversum"-achtige zoektermen.
5. **Contact/Offerte**: formulier (naam, telefoon, dienst-select, omschrijving, foto-upload optioneel), WhatsApp-optie, bel-knop.
6. **Over FIX Group**: kort, het één-aanspreekpunt-verhaal. Geen blog.

## De funnel

Twee sporen, allebei naar telefoon of formulier: **spoed** (rode balk overal zichtbaar, bel-knop primair, "binnen 45 min") en **gepland** (offerte-formulier, vrijblijvend, foto meesturen). Mobiel: sticky bel-knop onderin.

## Kwaliteitslat

Facilicom's niveau zit in rust en hiërarchie: veel wit, één boodschap per sectie, professionele fotografie van echte mensen aan het werk. De huidige FIX-draft oogt als een template; de nieuwe site moet ogen als een bedrijf dat er al 15 jaar staat.
