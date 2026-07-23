---
type: project
date: 2026-07-21
project: Passendonline
status: active
tags: [agency, operations, dashboard]
priority: high
---

Agency-hub van [[Passendonline]]: het overkoepelende operations-niveau boven de klantprojecten [[Lichtendirect]], [[Gordijnfestijn]] en [[FIX Group]].

## Klantboard (live app met database)

Echte Next.js-app op **https://passendonline-dashboard.vercel.app**, met **Neon Postgres** als database (bron van waarheid). Talat bewerkt data op de app zelf.

- Repo: `~/passendonline-dashboard` (Next.js 16 + Tailwind 4), Vercel-project `passendonline-dashboard`, scope `talat-3342s-projects`.
- **Database**: Neon (`neon-green-ribbon`), gekoppeld via de Vercel-integratie. Env-vars met prefix `database_` (o.a. `database_DATABASE_URL`), zijn "sensitive" dus niet lokaal uitleesbaar. Migreren/seeden gebeurt daarom runtime op Vercel.
- **Schema** in `src/db/schema.ts` (Drizzle): clients, tasks, deliverables, time_entries, invoices, invoice_items, settings. Query-laag `src/db/queries.ts` levert dezelfde vormen als voorheen; server-acties `src/app/actions.ts` doen de writes.
- **Init/seed**: `GET /api/admin/init?key=<APP_PASSWORD>` (eenmalig gedraaid, `&reset=1` om opnieuw te vullen). `src/data/clients.ts` is nu alleen nog de seed, niet de live bron.
- Pagina's: `/` dashboard, `/uren` (tarief aanpassen + uren toevoegen/verwijderen + factuur maken uit uren), `/facturen`, `/factuur/{id}` (exacte template + EPC-QR), `/klant/{id}` (publiek deelbaar), `/instellingen` (bedrijfsgegevens bewerken).

> [!important] Data bewerken gaat nu op de app, niet meer in `clients.ts`
> Tarieven, uren, facturen en bedrijfsgegevens wijzigt Talat direct op de site (schrijft naar Neon). Claude hoeft `clients.ts` niet meer te spiegelen. Wil Claude toch data zetten vanuit een sessie: schrijf naar de database (server-actie of een tijdelijke admin-route), niet naar `clients.ts`.

## Facturen (in de app)

De app maakt facturen op, exact nagebouwd naar Talat's echte template (Passend Online, P.-logo, kolommen aantal/omschrijving/bedrag/totaal/btw). Routes: `/facturen` (lijst) en `/factuur/{klant}` (afdrukbare factuur, print naar PDF). Bedrijfsgegevens ingevuld in `src/data/business.ts` (KVK 98726587, Btw NL005348359B25, IBAN NL93 KNAB 0781 0526 10, BIC KNABNL2H, 21% btw, betaaltermijn 14 dagen). Rekenlogica in `src/lib/invoice.ts`, factuurregels per klant in `clients.ts` (`invoices[]`).

**Betaal-QR**: elke factuur heeft een EPC069-12 SEPA-QR (`src/lib/epcqr.ts`, `qrcode`-package), scanbaar met bankieren-apps. De betaalreferentie is een ISO 11649 RF-code afgeleid van het factuurnummer.

> [!warning] Twee dingen checken vóór verzenden
> 1. **Factuurnummer**: FIX Group staat nu op placeholder `2026-001`. Talat's echte reeks loopt anders (voorbeeld: 2026-3422). Het juiste volgnummer moet in `clients.ts` gezet worden.
> 2. **EUR 400 incl of excl btw?** Nu behandeld als excl (400 + 21% = 484). Als de vriendenprijs 400 all-in moet zijn, stukprijs aanpassen naar 330,58 of btwPlichtig-logica herzien.
> De officiële administratie (doorlopende nummering, btw-aangifte) hoort in een boekhoudtool; de app levert de factuur-PDF.

## Uren, tarieven & auto-facturatie

Route `/uren`. Per klant een tariefsoort in `clients.ts` (`billing: { type: "uur" | "maand" | "project", tarief }`) en een urenlog (`timeEntries[]`). Logica in `src/lib/billing.ts`:
- **Lichtendirect**: uurtarief EUR 20 (uit de echte april-factuur).
- **FIX Group**: projecttarief EUR 400.
- **Gordijnfestijn**: project, tarief nog 0 (volgt uit de deal).

De pagina toont gelogde uren, niet-gefactureerde uren, factureerbaar bedrag (uren × tarief, of projectbedrag minus al gefactureerd) en de btw daarover. Alle bedragen zijn **exclusief btw** (bevestigd door Talat 21 jul). Voor uurtarief-klanten bouwt `/factuur/{klant}` zich automatisch op uit de niet-gefactureerde uren als er geen expliciete factuur staat. Factuurnummer verschilt per klant (Talat's keuze), staat per invoice in de data.

> [!important] Uren loggen = factuur vult zichzelf
> Zet werksessies als regels in `timeEntries[]` (datum, omschrijving, uren). De Uren-pagina en de auto-factuur rekenen het door. Tarief aanpassen = `billing.tarief` wijzigen in `clients.ts`.

## Klant-facing pagina's

Elke klant heeft een deelbare status-pagina op `/klant/{klant}` (lichte, professionele huisstijl, los van het donkere interne board). Toont intro, wat er opgeleverd is (met links naar previews/plannen) en de volgende stappen. Bron: `clientIntro`, `deliverables`, `clientNext` in `clients.ts`. Dit is de "HTML richting de klant" die Talat kan sturen.

## Toegang, beveiliging & domein

- **Login-beveiliging** staat op de app (middleware + cookie). Alles achter login, behalve `/klant/{slug}` (bewust publiek, deelbaar). Wachtwoord in Vercel env `APP_PASSWORD`, cookie-secret in `APP_SECRET`. Wachtwoord wijzigen: `printf "nieuw" | vercel env add APP_PASSWORD production --scope talat-3342s-projects --force` en redeployen.
- **Eigen domein**: `dash.passendonline.nl` is toegevoegd aan het Vercel-project. Talat moet bij zijn DNS (Hostnet, nameservers ns01/ns02.hostnet.nl) een A-record zetten: `dash → 76.76.21.21`. Vercel verifieert automatisch en regelt het SSL-certificaat.

## Zelf beheren op de app (klaar, database-versie)

Talat beheert nu alles op de site zelf, opgeslagen in Neon:
- `/uren`: tariefsoort + tarief aanpassen, uren toevoegen/verwijderen, factuur maken uit uren.
- `/klanten`: nieuwe klant toevoegen, status + volgende actie + contact bewerken, taken toevoegen/afvinken/verwijderen.
- `/facturen`: **betaalstatus** per factuur (concept → verstuurd → betaald) met stats openstaand / waarvan te laat / betaald / nog te versturen.
- Dashboard: taken afvinken slaat direct op in de database (geen "stuur naar Claude"-omweg meer).
- `/instellingen`: bedrijfsgegevens.

Server-acties in `src/app/actions.ts`. Taken/facturen in de DB bijwerken vanuit een sessie kan via `GET /api/admin/tasks?key=<APP_PASSWORD>&complete=<label|label>` (afvinken op tekst-match).

## Aanbod

- [[aanbod-site-abonnement|Site-abonnement €50/mnd]] (`specs/aanbod-site-abonnement.md`): het instap-pakket dat broertje verkoopt (prospect-loop → dossier-PDF → outreach → site-factory → ship-loop). Split-varianten en contract-voorwaarden staan erin; Talat kiest de split. Retainer-laag (à la [[Gordijnfestijn]]) blijft de bovenverdieping.

## Concurrentie-onderzoek

- [[sparsi-teardown|Sparsi teardown]] (`research/sparsi-teardown.md`): deep-research van sparsi.nl, het website-als-abonnement (€30/mnd, €0 setup) dat zwaar op Meta adverteert. Bevat hun bouw-recept, de scheuren tussen marketing en fine print (12-mnd lock-in vermomd als "opzegbaar"), en een kopiëren/vermijden/differentiëren-lijst. Kern: kopieer hun verpakking, versla ze op CRO/SEO/proof/snelheid.

## Openstaand agency-breed

- Factuurgegevens Passendonline aanleveren (zie waarschuwing hierboven).
- Tarieven [[Lichtendirect]] en [[Gordijnfestijn]] vastleggen in de uren-files.
- Boekhoudtool kiezen (Moneybird / e-Boekhouden) voor de officiële administratie.
