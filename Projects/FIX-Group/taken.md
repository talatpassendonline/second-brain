---
type: tasks
date: 2026-07-21
project: FIX-Group
status: active
tags: [client, tasks, passendonline]
---

Takenlijst voor [[FIX Group]]. De dagelijkse Operator voegt hier klantmail-taken aan toe; [[me|Talat]] en agents vinken af.

## Open

- [x] Review-gate 2 gepasseerd; v8 staat op productie: https://fixgroup-website.vercel.app (deelbaar met de klant).
- [ ] Bij de klant checken: kloppen de 4 beveiligings-diensten (evenementen, horeca/portiers, object, verkeersregelaars)? Ingevuld op basis van "beveiliging op evenementen enzo". (Talat)
- [ ] 3 foto's genereren via [[foto-queue]] (beveiliging.jpg, onderweg.jpg, klant.jpg), dan build + deploy v7. **Geblokkeerd: Higgsfield down.** 21 jul een retry-loop gedraaid (10 rondes, ~04:00–07:30), `balance` gaf elke keer `net::ERR_FAILED`. Service bleef de hele nacht dood; loop op verzoek gestopt. Mogelijk ook een afgebroken MCP-verbinding: eerst de Higgsfield-connector opnieuw koppelen, dan `balance` testen, en pas draaien als die antwoordt. (agent)
- [ ] Vóór livegang: echt adres + KVK-nummer op de contactpagina (staat nu Voorbeeldstraat 1 + KVK 12345678) en echt e-mailadres (info@fixgroup.nl aanname). (Talat vraagt op)
- [x] Site (fixgroup-website.vercel.app) naar de klant gestuurd (21 jul).
- [x] Reviews, oprichtingsverhaal en domein opgevraagd bij de klant (21 jul); nu wachten op aanlevering.
- [ ] Van de klant: echte reviews + oprichtingsverhaal aanleveren, placeholder-reviews gaan niet live. (klant levert)
- [ ] Domein kiezen en koppelen. (Talat + klant)
- [ ] **SEO-launch bij domein-koppeling** (agent): noindex verwijderen uit layout.tsx, domein checken in sitemap/robots/schema (staat nu op fixgroup.nl), Google Search Console aanmaken + sitemap indienen, Google Business Profile koppelen. Pas doen als echte reviews + echt adres erin staan.
- [ ] Referentie-klanten/logo's opvragen bij FIX (met toestemming) voor een logo-strip op de home, zoals metoschoonmaak.nl. (Talat)
- [ ] Google Business Profile aanmaken voor FIX Group en reviews verzamelen; daarna echte Google-reviews op de site tonen. (Talat + klant)
- [x] Promote naar productie gedaan (21 jul).
- [ ] Factuur EUR 400 (vriendenprijs) na livegang. (Talat)

## Mail

## Afgerond
