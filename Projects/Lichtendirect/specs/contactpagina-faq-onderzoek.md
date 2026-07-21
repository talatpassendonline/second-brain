---
type: spec
date: 2026-07-20
project: Lichtendirect
client: Lichtendirect
status: in-progress
tags: [contactpagina, faq, klantonderzoek, voc, bol, trustpilot]
priority: high
---

Onderzoek voor de nieuwe [[Lichtendirect]]-contactpagina met FAQ (model = trygoatly-contactpagina, zonder 17track). Doel: klantenservice ontlasten door de meest voorkomende klantvragen preventief te beantwoorden. Bron: alle Trustpilot- + bol.com-reviews. Voedt de `lichtendirect-faq`-sectie.

## Bron 1: bol.com (~300 reviews, ~13 producten)

Verkoperspagina: Lichtendirect op bol.com (`bol.com/nl/nl/b/lichtendirect/604112535/`), alles self-shipped. Kanttekening: de aparte "Vragen over dit product"-blokken laden via JS en waren niet te scrapen; de vraag-content zit in de reviews.

Meest voorkomende onderwerpen (gerangschikt):
1. **Afstandsbediening + app** (zeer hoog): dimmen/standen positief, maar afstandsbediening hapert soms, app in het Chinees, ingestelde kleur springt terug na uitschakelen.
2. **Klantenservice bij defect/beschadigd** (zeer hoog, positief): snelle coulante vervanging, zelfs buiten garantie. FAQ: wat aanleveren (bestelnr + foto) + belofte snelle oplossing.
3. **Levertijd/verzending** (hoog, positief): meestal snel/netjes.
4. **Reservelampjes + vervangbaarheid** (hoog): beloofde reserves soms afwezig; per model verschilt of losse lampjes vervangbaar zijn (kleuren-ballen NIET, extra-dik 1W WEL).
5. **Koppelen/verbinden** (hoog): sommige snoeren koppelbaar tot 100m, LED-strip inkortbaar/koppelbaar, smart lichtsnoer juist NIET (eigen stekker per set).
6. **Kabellengte/verlengsnoer** (midden-hoog): aanvoerkabel soms te kort, verlengstuk los verkrijgbaar.
7. **Waterdicht/buiten (IP)** (midden-hoog): meeste IP65 (jaarrond buiten), Ster-LED IP45 (alleen spatwater).
8. **Montage/installatie** (midden): plafondlampen/ventilatoren wisselend; montagemateriaal zit erbij.
9. **Lichtkleur wisselen** (midden): 3-staps schakelen via wandschakelaar (3500/4500/6500K) niet altijd begrepen; enkelen vinden licht te wit.
10. **Maat vs foto** (midden, grootste 1-ster-oorzaak): "kleiner dan op de foto".
11. **Lumen/energielabel** (laag-midden): lumen ontbreekt soms, energielabel F valt op.
12. **Solar-prestaties** (laag-midden): brandduur/winterwerking, oplaadtijd, schemersensor.

Rode draad die als losse FAQ-regel waard is: **2 jaar garantie + 30 dagen gratis retour**.

Letterlijke/impliciete klantvragen uit reviews: kan ik een lamp vervangen; zitten de reservelampjes erbij; waarom geen lumen vermeld; tot hoeveel meter koppelbaar; heb ik een verlengsnoer nodig; app in het Chinees, hoe NL; blijft lichtkleur bewaard na uit; is de lamp echt zo groot als op de foto.

## Bron 2: Trustpilot (4,7/5, 414 reviews, alle negatieve gelezen)

Verdeling: 87% 5★, 8% 4★, kleine negatieve staart (~12x 1★, ~4x 2★, ~6x 3★) die strak clustert. Bedrijf beantwoordt 100% van de negatieve reviews binnen 24u.

Meest voorkomende contactredenen (gerangschikt):
1. **Levertijd + track&trace** (dominant): PostNL-vertraging, "waar is mijn pakket".
2. **Retour + terugbetaling**: hoe lang duurt terugbetaling (statusvragen).
3. **Defect + garantie**: klanten kennen de 2 jaar garantie vaak niet → meteen 1★.
4. **Verkeerd/incompleet/afwijkend geleverd** (o.a. UK- i.p.v. EU-stekker).
5. **Nalevering/backorder**: niet proactief geïnformeerd.
6. **Kabel-/adapterlengte te kort** → verlengsnoer.
7. **Afstandsbediening + dimmen**: koppelen lukt niet, geen geheugen na schakelaar, te fel.
8. **LED-strip plakt niet**: 3M hecht alleen op schone/vetvrije ondergrond.
9. **Product wijkt af van omschrijving**: aantal/maat/fitting (E27 vs geïntegreerd).
10. **Klantenservice bereiken** (positief): telefoon + WhatsApp + mail.
11. **Buiten/solar** + IP.
12. **Betaling** (zeldzaam, heet): iDEAL afgeschreven, geen bestelnummer.

Echte contactgegevens (live geverifieerd op contactpagina): Tel 035 206 3056, info@lichtendirect.nl (antwoord binnen 24u), WhatsApp/chat `wa.link/q9uff8`, ma-za 10:00-16:00, KVK 96300167, BTW NL867552451B01, Zeverijnstraat 24-C Hilversum.

## FAQ-concept (gebouwd: PR #11)

12 FAQ-items op de contactpagina, boven het bestaande contactformulier, in de nieuwe `lichtendirect-faq`-accordion-sectie (model = trygoatly-FAQ, Lichtendirect-stijl). Onderwerpen: (1) levertijd + track&trace, (2) retour + terugbetaling, (3) defect + 2 jaar garantie, (4) verkeerd/incompleet geleverd, (5) nalevering, (6) kabellengte + verlengsnoer, (7) afstandsbediening + geheugen, (8) LED-strip plakken, (9) koppelen, (10) buiten + solar/IP, (11) aantal/maat/fitting, (12) klantenservice bereiken. Geen 17track.

**Te verifiëren door Talat vóór publiceren:** exacte retour-/terugbetalingstermijn (nu bewust vaag "zo snel mogelijk" geformuleerd) en of alle antwoorden kloppen met het beleid. Daarna staging previewen → publiceren.
