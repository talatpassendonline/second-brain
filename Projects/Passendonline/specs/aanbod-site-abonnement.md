---
type: spec
date: 2026-07-22
project: Passendonline
status: design
tags: [aanbod, pricing, abonnement, sales, passendonline]
priority: high
---

Het instap-aanbod van [[Passendonline]]: site-als-abonnement, verkocht door Talat's broertje, gebouwd en onderhouden door de agents. Gemodelleerd op de sterktes uit de [[sparsi-teardown]] en bewust eerlijk waar Sparsi dat niet is.

## Het pakket: Website-abonnement

**€50 per maand, ex btw. Geen opstartkosten.**

Inbegrepen:
- Professionele website tot ±5 pagina's (home, diensten, over, reviews, contact), maatwerk-design op de [[site-craft]]-standaarden, gebouwd via [[site-factory]].
- Hosting op Vercel (snel, CDN, SSL), domein inbegrepen (op naam van de klant).
- Mobiel-eerst, echte reviews-integratie, klikbare telefoon/WhatsApp, leadformulier.
- Technische SEO-basis: meta's, H1-structuur, LocalBusiness-schema, WebP.
- Kleine tekst- en beeldwijzigingen doorlopend inbegrepen (via de ship-loop).
- Transparantie-USP: de klant krijgt een eigen statuspagina met wat er wanneer verbeterd is (de klant-changelog).

NIET inbegrepen (meerwerk of hoger pakket):
- Webshop, boekingssystemen, koppelingen.
- SEO-campagnes, content-schrijfwerk, advertenties (upsell: ad-factory).
- Zakelijke mailbox (doorstuur-adres gratis; echte mailbox = upsell).
- Grote redesigns na oplevering.

**Contract, eerlijk en zichtbaar in alle uitingen:** 12 maanden looptijd, daarna maandelijks opzegbaar. Domein is en blijft van de klant; bij vertrek gratis meeverhuizen. Geen kleine lettertjes, dat is het verkoopargument tegenover partijen als Sparsi (12-mnd stilzwijgende verlenging + exit-fee).

## Kostenkant (waarom dit uit kan)

- Vercel Pro: ~€19/mnd totaal, dekt alle klantsites samen. Marginaal per site ~€0.
- Domein: ~€12/jaar per site (~€1/mnd).
- Bouw: agents (site-factory) + review-uur Talat. Onderhoud: ship-loop.
- Brutomarge op techniek ~95%; de echte kosten zijn reviewtijd en support.

## Split met broertje (verkoper)

Familie-keuze van [[me|Talat]]; op papier zetten, juist omdat het familie is (één A4: wat telt als "zijn" deal, wanneer wordt uitbetaald, wat gebeurt er bij churn binnen X maanden).

Opties besproken (Talat kiest):
1. **50/50 doorlopend** (Talat's voorstel): broertje €25/mnd per actieve klant. Simpel, maximaal motiverend, maar Talat draagt alle kosten en risico uit zijn helft.
2. **50% jaar één, daarna 15%** (advies Claude): broertje pakt €300 per gesloten deal in jaar 1, Talat houdt de lange staart voor groei.
3. **€150 bounty per deal + 20% doorlopend**: directe beloning plus staart.

Anti-churn-clausule in alle varianten: provisie loopt alleen zolang de klant betaalt; klant weg binnen 3 maanden = bounty terug of verrekening.

## Sales-flow (de machine)

1. **Prospect-loop** (dagelijks, cloud) vindt leads en bouwt dossiers → Leads-tab dashboard.
2. Talat keurt de goede leads, exporteert de **dossier-PDF** (/lead/{id}) en stuurt die naar broertje.
3. **Broertje benadert** (mail/WhatsApp/bellen) met het concept-bericht en het dossier als houvast. Sales-playbook (uit de deep-research) als doctrine: pijnpunt → wat het kost → oplossing → bewijs (fixgroup-site) → lichte CTA.
4. Deal → intake-formulier → **site-factory** bouwt → review-gates Talat → live.
5. Klant draait mee in de **ship-loop** (doorlopende kleine verbeteringen) + klant-changelog.
6. Na 3-6 maanden tevredenheid: upsell-gesprek door Talat (CRO-pakket, ads, hoger tarief).

## Positionering: twee lagen

- **€50-laag = de sokkel en de funnel.** Volume via broertje, geautomatiseerde levering. 20 klanten = €1000/mnd omzet.
- **Retainer-laag = het echte geld.** CRO/groei-retainers zoals [[Gordijnfestijn]] (~€1500/mnd), verkocht door Talat zelf, deels gevoed vanuit tevreden €50-klanten.

## Prijsladder Passendonline (besloten 22 jul)

1. **Instap:** site-abonnement €50/mnd ex btw (dit document).
2. **Loop:** doorlopende optimalisatie €350/mnd; [[Lichtendirect]] als startklant €250/mnd (zichtbare startklant-korting, eerbetoon aan Murat als eerste klant).
3. **Projecten:** vaste prijs vooraf, nooit uren. Klein €250-400, middel €500-800, groot €900-1500; Murat 25% startklant-korting. Uurtarief €20 is met pensioen.
4. **Apps:** maatwerk-tools als abonnement, €100-180/mnd (Sparsi's app-laag is €180). Maildesk voor Lichtendirect: €100/mnd (frame: normaal €150), bouw €0 tegen 12 mnd looptijd, onderhoud inbegrepen, nieuwe features = project.

**Status Murat-gesprek:** GEPARKEERD tot hij terug is van vakantie. Voorstel dan: loop €250 + maildesk €100 = €350/mnd recurring. De maildesk bestaat al (door Talat gebouwd) maar heeft nog veel fixes nodig; kandidaat voor een eigen ship-loop.

## Open

- Talat: split-variant kiezen + A4-afspraak met broertje.
- Prijsvoorstel afronden zodra het sales-playbook (deep-research, loopt) klaar is; playbook-cijfers voeden de pitch en de PDF's.
- Eerste 5 leads uit de Leads-tab als pilot voor broertje.
