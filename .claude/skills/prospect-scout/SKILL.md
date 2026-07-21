---
name: prospect-scout
description: Vind en onderzoek potentiële Passendonline-klanten, per lead een dossier met stack, pijn-signalen en eerlijk ICP-fit-oordeel, plus gepersonaliseerde outreach-concepten. Gebruik bij "zoek klanten", "wie kan ik benaderen" of het vullen van de agency-pijplijn. Verstuurt nooit zelf.
---

# Prospect Scout

Lead-machine voor [[Passendonline]]. Tot nu toe kwam alles inbound ([[FIX Group]]); dit maakt acquisitie repeteerbaar. Bewerkt overgenomen uit de 187N agents-les (zie [[leon-187n-brand-building-course-extract]]).

## Input

Van [[me|Talat]] of uit `Projects/Passendonline/`: welke dienst pitchen we (site-bouw, CRO, merkfundament, ads), welk type bedrijf (lokaal MKB, e-com, dienstverlener), welke regio, en hoeveel leads deze run. Zonder dienst-focus niet starten: "iedereen" is geen ICP.

## Werkwijze

### 1. Sweep
Verzamel kandidaten via meerdere ingangen (elk blind voor de ander): Google Maps per regio en branche, web search op branche + plaats, bedrijven met verouderde of trage sites in de doelgroep, bedrijven die al adverteren (die hebben budget). Output: bruto lijst met naam, site, plaats, bron.

### 2. Dossier per lead
Per kandidaat kort en feitelijk:
- **Site-audit**: platform/stack, mobiel, snelheid-indicatie, duidelijkste conversielekken (bel-knop, formulier, reviews, SEO-basics).
- **Omvang-signalen**: reviews-aantal, personeel-indicaties, meerdere vestigingen, ad-activiteit.
- **De haakbare pijn**: het ene concrete, zichtbare probleem dat de openingszin van de outreach wordt.

### 3. Fit-oordeel, eerlijk
Per lead: **fit / borderline / skip** met één regel waarom. Skips expliciet benoemen en laten staan (te groot, al goed bediend, buiten ICP). Een geforceerde fit kost meer dan een lege regel; het 187N-voorbeeld skipte zelf een enterprise-lead en dat is het patroon.

### 4. Outreach-concepten
Voor de fits: kort, concreet, in Talat's directe toon (geen agency-jargon, geen "ik hoop dat dit bericht u goed bereikt"). Structuur: het geobserveerde probleem in één zin, wat dat kost, één zin wat wij doen, lichte CTA. Per lead het beste kanaal (mail, WhatsApp Business, DM, bellen-notitie). Referentie-werk noemen waar relevant (live sites zoals fixgroup-website.vercel.app zodra die op eigen domein staat).

> [!important] Verstuur-gate
> Claude verstuurt nooit outreach. Alles staat klaar als concept; Talat verstuurt zelf of geeft per lead expliciet akkoord. Berichten versturen namens Talat vereist sowieso zijn toestemming per actie.

## Output

- `Projects/Passendonline/prospects.md`: de lijst, per lead status (fit/borderline/skip → benaderd → reactie → deal), dossier-samenvatting en outreach-concept. Bestaande file bijwerken, niet vervangen; eerder geskipte leads niet opnieuw opvoeren.
- Sessielog in `Daily/` met aantallen: gevonden / fit / skip.
