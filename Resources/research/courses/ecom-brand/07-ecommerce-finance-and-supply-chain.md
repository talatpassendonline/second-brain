---
type: research
source: Informatie Ecom en Brand (course dump)
course: Evolve Finance (Grayson) + Evolve Supply Chain (Canary Solutions) + Origins
status: distilled
tags: [ecom, unit-economics, cash-conversion-cycle, ltv, supply-chain, payment-terms]
---

> [!info] Bron
> Gedistilleerd uit 12 transcripts. Ruw archief: [[G_finance_supply]] in `_transcripts/`. Dit is cursusmateriaal, geen evangelie; [[me|Talat]] maakt de compliance- en claim-calls zelf.

## Waar dit over gaat

De geld- en operatielaag onder een DTC-merk. Twee losse programma's: [[business|Goatly]]-relevant tot in de kern. Grayson's Evolve Finance leert je de exacte math van contribution margin, cohort-LTV, de vier "barometers" die je bedrijf fixen of doden, en de cash conversion cycle waarmee je op 0.5 ROAS kunt draaien zonder ooit geld uit je bankrekening te zien vertrekken. Canary's Evolve Supply Chain leert je manufacturers kiezen, QC'en en payment terms afdwingen. Voor [[business|Goatly]] is de finance-helft goud: het is een abonnementsmerk dat van ~€50k naar €200k MRR wil, en dit model vertelt precies hoeveel je mag verliezen op order één. Voor [[passendonline|Passendonline]] voedt dit de sales- en economics-onderbouwing per klant.

## Kernframeworks

### Contribution Margin (Evolve Finance, Module 1)

Contribution margin `= revenue − variable costs`. Niet hetzelfde als profit: profit (operating income) is wat overblijft nadat élke rekening betaald is; contribution margin kijkt alleen naar kosten die meebewegen met de omzet. De vijf variabele kosten die je moet meetellen:

1. **COGS**, volledig geleverd aan de klant (product + verzending), niet alleen je grondstof.
2. **Ad spend**, per definitie variabel.
3. **Processing fees**, rond 3% (Shopify 2.8% + $0.30 per transactie; Shopify Plus zo laag als 2.4%).
4. **Sub-X / subscription-app fees** (Recharge, Skio, Loop): 0.5% tot 1% van de omzet. Klein percentage, maar op $1M/maand is dat $10k, een heel salaris.
5. **Variabele teamkosten**: een agency of medewerker die 5% van ad spend pakt is een variabele kost. Op $1M spend is dat $50k.

Cruciaal inzicht: ad spend en de daaraan gekoppelde teamfees hangen alléén aan de eerste order (de CAC), niet aan rebills. Daarom is de margin op vervolgorders beter dan op order één. Vuistregel die de rest van het programma draagt: `het is oké om $20 contribution margin te verliezen op order één (naar −$20 te gaan) als je binnen ~3 maanden $30 profit maakt`.

### LTV Cohort-model: "How to Outspend Everyone" (Module 2)

Het doel van LTV is niet meten om te meten, het is: zoveel mogelijk uitgeven om een klant te kopen en tóch profit draaien, zodat je iedereen in de markt kunt overbieden. De data komt uit **Shopify**, niet uit Facebook.

- **CAC ≠ CPA.** CAC = totale ad spend in een periode gedeeld door net-new customers (Shopify-filter: new customer = true; returning niet meetellen). Trek de spend uit Meta maar reken hem af tegen Shopify-klanten.
- **LTV = dollars, niet customers.** Tool: Lifetimely (aanrader, goedkoop). Triple Whale kan handmatig maar minder accuraat.
- **De cohort-tabel.** Maand 0 = 100% (in de praktijk 101-102%, want ~1-2% van klanten herkoopt binnen 28 dagen). Elke maand daarna is een retentie-percentage. Met dummy-data: maand 1 = 60.8%, maand 2 = 38.1%, maand 3 = 26%.
  - **Revenue-rij** = retentie% × AOV. Bij AOV $64 en 60.8% retentie = $38.91.
  - **Margin-rij** = (revenue × margin%) − (CAC × aantal customers).
  - **Total margin** = cumulatief opgeteld. Zo zie je in maand 0 bijvoorbeeld −$23, en het kruipt maand na maand naar positief.
- **Splits eerste en tweede order.** AOV én margin verschillen per orderpositie. Razor/blade-model: intro-offers, one-click upsells en post-purchase upsells zitten wel in order één maar niet in rebills. Vul dus aparte cellen voor first-order AOV/margin en second-order AOV/margin.
- **OpEx als functie van COGS.** Voorbeeld: $100k OpEx op $10M omzet bij $64 AOV = ~156k transacties = $0.64 OpEx per transactie ≈ 1% van COGS. Zo wordt 20% COGS effectief 21.6% inclusief OpEx.
- **Gezondheidsnorm:** een gezond bedrijf heeft cumulatief >100% LTV in maand 1, 2 én 3.

### De Vier Barometers: Fix Fast vs Kill You (Module 3)

Het "perfecte" voorbeeldbedrijf: **$64 AOV, $74 CAC = 0.86 ROAS**. Dat kun je de hele dag draaien. Grayson's advies: houd jezelf op **0.7 of hoger**. Ter kalibratie: $100 CAC op $64 AOV (0.6 ROAS) werkt óók nog, met +$12.95 profit tegen maand 3, +$35.53 tegen maand 6, +$62.19 tegen maand 12.

Drie dingen zijn makkelijk te fixen, één is bijna onmogelijk:

1. **Hoge CAC** (te lage ROAS zoals 0.5-0.6): fix je creative en je landing page. Makkelijk.
2. **Lage LTV / subscription take rate** (bijv. maand 0→1 blijft op 30%): opt-in-probleem. Verhoog je one-time-prijs met 10-20% zodat het prijsverschil de abonnement-take-rate opdrijft. Zelfs als je CAC daardoor $10 stijgt: je gaat van +$1.56 naar +$22.95 profit tegen maand 3. Regel: houd de hoogst mogelijke take rate, óók als CAC omhoog gaat.
3. **Slechte COGS** (bijv. 35%): verhoog prijzen of wissel van manufacturer. Target sub-30%; **30% COGS is het absolute maximum**.
4. **Lage AOV = de killer.** Niet fixbaar. Bij een laag ticket ($19.99) haal je nooit genoeg vlees van het bot: CPM's, CTR, CPC en conversieratio hebben harde vloeren/plafonds die je met geen enkele ad of landing page verslaat. **Minimum subscription-AOV $29.99, liefst $39-49; nooit onder $39 tenzij de marges absurd zijn of het een micro-subscription is.**

De horizontale lijnen in het model op maand 3, 6 en 12 zijn de cash-conversion-punten. Zie volgende framework.

### De Cash Conversion Cycle (Module 4 + Meta Billing)

Het paradepaardje: van 0 naar tientallen miljoenen zonder eigen kapitaal in te leggen. De cash conversion cycle is de tijd tussen geld uitgeven en profit binnenkrijgen. Bij een LTV-model waar je pas maand 3 breakeven bent, is dat gat je "great wall of death": 100k klanten kopen vergt bijvoorbeeld $2.7M die je niet hebt.

De oplossing is het **stapelen van betaaltermijnen zodat je CAC pas betaalt nadat de LTV al binnen is**:

- **Meta net invoicing**: net 30 met 15 dagen grace = effectief **net 45**. Bestaat al eeuwig, bijna niemand gebruikt het.
- Meta laat je die invoice niet met creditcard betalen (alleen wire/ACH). Los dat op met een **third-party bill-pay**: Melio, Bill.com of Plastic. Fee 2.5-2.9%. Melio is favoriet (setup in ~30 min).
- Betaal die third-party met de juiste kaart. **Amex Plum Card = 60-daagse termijn.**
- **Stapel:** Meta net 45 + Plum net 60 = **net 105** (reken 104 voor een dag buffer). Je CAC verlaat je rekening pas na 105 dagen, tegen die tijd zijn rebill 1, 2 en de maand-3-conversie al binnen. Effectief first-order-profitable.

Kostenberekening van de stapel: 2.9% fee minus 1.5% statement credit = **netto 1.4% voor 105 dagen krediet ≈ 4% APY**. De goedkoopste lening die bestaat. Punt-tot-fee-logica: als je cashback 2-3% is en de fee 2-3%, heffen ze elkaar op.

> [!warning] De math móet kloppen
> Als je in je maand-0-cohort **5% te optimistisch** zit, kantelt in het voorbeeld +$158k naar −$257k. Op $2.9M omzet is 5% al $145k. Tot je dit dialed hebt: mik op maand 2 als break-evenpunt, niet maand 3. Dat geeft 30 dagen speling. Op maand 6 en 12 is verlies vrijwel onmogelijk, zelfs met een matige ratio.

### Meta Billing tiers (los transcript)

Meta stopt met creditcards accepteren (deadline rond april; kan teruggedraaid worden). Drie profielen: **Virgin** (bank/debit direct betalen, $800-2000 increments, geen schuld maar het slechtste voor je kapitaal), **Decent** (net 30 creditcard, verdwijnt nu), **Chad** (net invoicing + third-party bill-pay + creditcard). Kaart-ranking: Amex Gold = F-tier (3-4x punten alleen op eerste $150k). Platinum = middenmoot (2% terug op purchases >$5k voor eerste $2M, daarna 1%, meestal hoogste limiet). De "grandpa"-kaart = S+ (net 60 + 1.5% unlimited statement credit). Debt is goed mits gestructureerd en gedisciplineerd gebruikt.

### Due Diligence op Manufacturers (Evolve Supply Chain)

Waar alles begint. Je manufacturer doet grondstof-inkoop, QC en final assembly, en je communiceert dagelijks met ze.

- **Initial research:** cast een breed net. Alibaba is een mijnenveld (trade companies vermommen zich als factory met stockfoto's). CJ mailde 50+ bedrijven en filterde op wie hem op WeChat toevoegde ("kan geen instructies volgen = weg"). Andere bronnen: FDA-database (skincare), medical-device-databases, trade associations, expo-exhibitorlijsten, LinkedIn.
- **Factory vs trade company:** factories geven concretere, snellere antwoorden en hebben directe engineer-toegang. Trade companies communiceren gladder aan de oppervlakte maar breken bij details. **Geografie is een snelle filter:** de stad staat vaak vooraan in de bedrijfsnaam. Shenzhen/Dongguan = electronics, Yiwu/Hangzhou = veel factories, inland zoals Zhengzhou = geen factory-land. Factories zitten dicht bij de haven.
- **Response evalueren:** snelheid + directheid (Chinese communicatie is cultureel indirect, dus wie recht-door-zee is, is een win). Vraag factory-grootte, QC-teamgrootte, testapparatuur, of je een engineer of alleen een salesmanager krijgt.
- **Factory-sizing:** klein (50-75 mensen; schildert mooi plaatje maar mist soms resources), medium (100-200; beste pricing en systemen, sweet spot voor starters), groot (200+ tot duizenden; hoge MOQ, productie-queue, buttoned-up, minder toegang). Een klein factory dat door een engineer-eigenaar wordt gerund met goede kwaliteit is een "gem", maar zeldzaam.
- **Certificeringen verifiëren tot op de lab.** Verifieer niet alleen de factory maar het testlab zelf (bel het certificerende bedrijf). Reputabele labs: SGS, Intertek.
- **Red flags:** vage antwoorden over productieprocessen, trage responses, ontbrekende certificeringen, bandaid-oplossingen. Zoek proactieve manufacturers die zelf issues melden.

### QC op Manufacturers (Evolve Supply Chain)

QC is een proces over de héle supply chain, niet één moment. Setup: **OQC** (outgoing quality control) bij de sub-vendor, **IQC** (incoming) bij de assembly-factory, plus in-line en final inspections. Zo lokaliseer je de root cause als een speaker- of batterij-component fout is in plaats van de assembly.

- **Golden samples:** jij én de factory houden een goedgekeurd referentie-exemplaar in de hand.
- **Go/no-go-systemen:** definieer acceptatiecriteria tot op de millimeter. Voorbeeld: een kras van 1mm × 5mm is acceptabel, 1.5mm niet. Voor Nutra/skincare draait het om pilot-batches, certificate of analysis, textuur/kleur-match. Voor electronics: accelerated age testing van batterijen (80-100 laadcycli), spot-checks.
- **DFMEA / PFMEA:** design- en process-failure-mode-analyses die tonen waar je product kwetsbaar is.
- **Certificeringen als litmus test:** GMP (good manufacturing practice), ISO 9001 (quality management), ISO 13485 (medical device), CPSIA (kinderproducten).
- **Third-party inspectie:** laat een onafhankelijke partij ~10% random pullen (niet de vijf perfecte units die de factory aandraagt). Kosten laag houden door niet alles te inspecteren.
- **Nooit QC uitbesteden aan je fulfillment-company:** die wordt betaald om te shippen, fundamenteel belangenconflict. En de factory kan ook geen neutrale QC voor zichzelf doen. Gekoppelde go/no-go-criteria maken debit notes/chargebacks bij defecten je recht.

### Payment Term Negotiating (Evolve Supply Chain)

Payment terms = cashflow = meer ad spend zonder kapitaal vast te zetten in product. Als je moet pauzeren omdat je cash vastzit, moet je je ads her-optimaliseren; dat is het verschil tussen een winstgevend seizoen en niet.

- **Incoterms bepalen wanneer de betaalklok start:** EXW (ex works, af fabrieksvloer, jij regelt alles), FOB (freight on board, factory levert tot haven, vaak betere pricing door VAT-refund en risico-mitigatie), DDP (delivery duty paid, landed cost end-to-end incl. douane, gangbaar voor lichte producten).
- **Onderhandelingsfundament:** (1) bouw credibiliteit / order-history op, (2) demonstreer business strength met een forecast ("hier sta ik nu, hier bij net 30"), (3) benadruk het long-term partnership zodat de factory op een lange-termijn-winstmodel kan plannen.
- **Creatieve modellen:**
  - **Rolling deposit:** laat 10-30% voor grondstoffen bij de factory staan, betaal per verscheping (net 15/30) de volle orderwaarde en laat de deposit staan.
  - **Pay-as-you-ship:** deposit op bijv. 30k units, ship maar 10k/maand, factory houdt de rest voor je op voorraad (betere lead times, flexibel bij scaling en meerdere SKU's).
  - **Line of credit:** kredietlimiet met net terms. Voorbeeld: $500k aan orders, $250k limiet net 30 = betaal de helft up front, float de andere $250k. Zet cashflow-exposure vast.
- **In-person is een multiplier.** China is relatie-gedreven. Fabrieksbezoek, diner, drank, KTV bouwen preferential treatment op. Neem klanten mee, dumb de e-com-economics down voor de factory (die snapt geen CAC). Een skincare-deal die zo gesloten werd: 20% deposit, balans 60 dagen na verscheping uit China.
- **Group buying power:** een sourcing-company (zoals Canary, 100+ merken) krijgt terms die naar jou doorgezet worden. Als je fulfillment/sourcing-partner zegt "geen terms mogelijk", challenge dat: waarom niet via een factory waar ze wel een relatie hebben?
- **Tariffs als leverage:** gebruik de tariefpijn als onderhandelingspunt voor pricing-verlichting of langere terms. Zet duties op **Periodic Monthly Statement (PMS)** bij CBP (maandelijkse credit i.p.v. auto-debit; tijd om op accuraatheid te checken). Overweeg **free trade zones** om duties uit te stellen tot tarieven stabiliseren. Vergeet niet net 30 op shipping/fulfillment zelf: fulfillmentkosten zijn vaak hoger dan productkosten, dus daar zit soms de grotere cashflow-win.

### Q1/Q2 Launch + CNY-planning (Evolve Supply Chain)

Q1 en Q2 moeten samen gepland worden omdat Chinese New Year (CNY) in Q1 valt en tot in Q2 nadreunt.

- **Pre-CNY:** factories dicht ~2 weken voor de feestdag; grondstofleveranciers (katoen, staal) stoppen nóg eerder. Post-CNY draaien factories op halve capaciteit (mensen komen laat terug of nemen ontslag), plus een orderbacklog. Normale capaciteit pas ~mid-maart. Havencongestie en shipping-rates stijgen (Nov-Feb-rush, hun kerst).
- **Q1-strategie:** (1) lock production schedules vóór CNY (het #1 advies), (2) front-load je critical/best-selling SKU's, (3) bouw buffered inventory, (4) doe new product development tijdens de downtime. Deel je forecast vroeg én issue je PO's pre-CNY, want een PO triggert vaak pas de grondstofinkoop. Regel altijd alternate factories/backup plants.
- **Prime Day-keten:** orders in mei betekent shippen in april betekent produceren in Q1. Anders val je terug op dure air freight.
- **Q1 = beste onderhandelmoment**, vooral januari (niet tijdens CNY zelf; onderhandelen kost een maand van heen-en-weer). Q4-heavy merken komen cash-heavy uit Q4: bestel Q1 ruim en "speel nice", eis dan in Q2 betere terms/pricing terug.
- **Cross-functional alignment:** marketing gekoppeld aan echte voorraad (anders ads uitzetten en je read verliezen), sales-forecast aan productiecapaciteit, customer service voorbereid op volumepieken.

### Last-Minute CNY Prep 2026 (Evolve Supply Chain)

CNY 2026 start ~17 februari. Laatste verschepingsdatum uit China ~8-10 feb. China-3PL's dicht ~1 week vanaf de 17e. Normale productie pas mid-maart. Vier actiegebieden: production/supplier-tactics, payment/leverage, shipping/inventory-workarounds, expectation-management.

- **Partial shipments:** als de volle order niet lukt vóór CNY, vraag een gedeeltelijke verscheping of push de limiting sub-vendor (bijv. packaging) voor een deellevering.
- **Boek freight NU.** Surcharges lopen op (~$80/container en stijgend, kan in februari verdubbelen/verdriedubbelen). Congestie rolt geboekte containers door naar de week erna.
- **Product development-window:** januari is het moment om samples te finaliseren en de mold-deposit te plaatsen vóór CNY. Staalleveranciers (voor mallen) zijn al ~15 januari dicht. Het tooling-proces is ~30 dagen, waarvan staal-procurement de eerste 7-10 dagen. Engineers hebben nú juist tijd. Pre-order staal zodat je post-CNY meteen kunt snijden.
- **Hybrid shipping:** air-freight een week voorraad (paar pallets) om te overbruggen wat je 3PL dicht is, zodat je ads niet uit hoeven. Reken per product of dat unit-economisch kan (productgewicht × air-freight-cost vs. marge en CAC).
- **Relatie-onderhoud:** betaal openstaande facturen vóór CNY (bonusseizoen voor hun personeel), verschijn op de annual party, breng cadeaus voor eigenaar én engineers/production managers. Preferential treatment is de payoff.

## Procedures / SOP

**Het finance-model opzetten en lezen (Grayson):**
1. Trek CAC uit Shopify: ad spend (uit Meta) gedeeld door net-new customers (filter new customer = true) over dezelfde periode.
2. Trek cohort-retentie uit Lifetimely; zet maand 0 op ~101%.
3. Vul de oranje cellen van het template: first-order AOV, second-order AOV, CAC, COGS (product + processing fee), margin first/second order, OpEx als functie van COGS, aantal customers. Grijze cellen zijn formules, niet aankomen.
4. Lees de total-margin-rij: waar wordt cumulatief positief? Dat is je cash-conversion-punt.
5. Check de vier barometers: CAC/AOV-ratio ≥0.7, take rate hoog, COGS <30%, AOV ≥$39. Fix in die volgorde; als alleen AOV te laag is, herzie het hele aanbod.

**De cash-conversion-stapel bouwen:**
1. Zet Meta op net invoicing (net 30 + 15 grace = net 45).
2. Setup Melio (of Bill.com/Plastic) om Meta-invoices met creditcard te betalen (~2.9% fee).
3. Gebruik een net-60-kaart (Amex Plum of de high-reward-kaart) → totaal net ~105.
4. Onderhandel met je manufacturer richting net 30, zodat óók je COGS pas na binnenkomst LTV betaald wordt.
5. Verifieer wekelijks dat de cash er is tegen de tijd dat de bill valt. Bij twijfel: mik op maand-2-breakeven.

**Nieuwe manufacturer onboarden:** breed net → 50+ outreach → factory-vs-trade filteren op geografie + response → 3-5 samples (label A/B/C/D) → test kwaliteit/durability → certs + labs verifiëren → golden samples vastleggen → go/no-go-criteria + OQC/IQC/in-line/final-inspectiepunten afspreken → payment terms opbouwen via order-history.

## Templates, prompts, formules

```
Contribution Margin = Revenue − Variabele kosten
  Variabele kosten = COGS(geleverd) + Ad spend + Processing (~3%)
                     + Sub-app fee (0.5-1%) + Variabele teamfee (bijv. 5% ad spend)

CAC = Totale ad spend / Net-new customers (Shopify: new customer = true)
  (CAC ≠ CPA; trek uit Shopify, niet uit Facebook)

CAC/AOV-ratio (pseudo-ROAS): mik ≥ 0.7   (0.86 = ideaal, 0.5-0.6 = fixbaar)

Cohort-rij:
  Revenue(maand n)      = Retentie%(n) × AOV
  Margin(maand n)       = Revenue(n) × Margin% − (CAC × #customers)
  Total margin(maand n) = Total margin(n−1) + Margin(n)
  Gezond = cumulatieve LTV > 100% in maand 1, 2 én 3

OpEx per transactie = OpEx-budget / (Revenue / AOV)
  bijv. $100k / ($10M / $64) = $0.64/transactie ≈ 1% van COGS

Cash-conversion-stapel:
  Meta net 45 (30 + 15 grace) + kaart net 60 = net ~105 dagen
  Effectieve kredietkost = fee(2.9%) − statement credit(1.5%) = 1.4% / 105d ≈ 4% APY

Drempels: COGS max 30% · subscription-AOV min $39 (absoluut $29.99)
Foutmarge: 5% mis in maand-0-cohort kan +$158k → −$257k kantelen
```

Profit-calculator uit het Origins-transcript (los te checken): `ecombusiness.com/profit-calculator`. Grayson's LTV-template zit in de Evolve-module zelf; de oranje/grijze-celstructuur hierboven reproduceert de logica.

## Quotables

- "It is okay to lose $20 of contribution margin... if in three months we make $30 or any profit." (Grayson, Evolve Finance Module 1)
- "How can I outspend everyone else in the marketplace while still making a profit?" (Grayson, over het doel van LTV, Module 2)
- "The least sexy things in life are the most profitable." (Grayson, over de net-60 grandpa-kaart, Module 4)
- "You are first order profitable... because by the time the money actually leaves your account, you're positive." (Grayson, cash conversion cycle)
- "Where there's smoke, there's fire." (Chris, over red flags bij due diligence)
- "If there's ever a time to micromanage, it's now." (CJ, over communicatie in de laatste CNY-week)

## Zo pas je dit toe op Goatly + Passendonline

De finance-helft is direct inzetbaar op [[business|Goatly]] en verdient prioriteit. Goatly is precies het abonnementsmodel waar Grayson voor bouwt, en de sprong van ~€50k naar €200k MRR is een cash-conversion-probleem, niet alleen een acquisitieprobleem. Concreet:

- **Bouw het cohort-model in Lifetimely** met echte Goatly-data en check de vier barometers. Mijn sterke vermoeden: bij vrouwen 50+ met botgezondheid als [[pain-points|pijnpunt]] is de retentie hoog, dus de LTV rechtvaardigt een agressievere CAC dan [[business|Goatly]] nu durft. Dat is exact de purple-ocean-hefboom tegen [[Rynse]]: als Goatly's maand-1-2-3-LTV boven 100% zit, mag je op 0.6-0.7 ROAS kopen waar Rynse first-order-profitable moet blijven, en dan overbied je ze structureel. Zie ook [[05-media-buying-and-testing]] en [[09-offers-and-origins-media-buying]] voor de spend-kant.
- **AOV is de niet-fixbare barometer, dus die moet nú goed.** €39+ subscription is de vloer. Als Goatly onder dat ticket zit, is dat een offer/bundel-probleem dat vóór de scaling opgelost moet, niet een ad-probleem. Koppel aan [[08-cro-and-landing-pages]] voor de CAC-kant (creative + landing fixen is de makkelijke barometer).
- **De cash-conversion-stapel werkt in NL anders.** Amex Plum en de US-credit-line-trucs zijn niet 1-op-1 overzetbaar; de EU/NL-equivalenten (leverancierskrediet, factoring, betaaltermijnen bij het co-packer) moet [[me|Talat]] apart uitzoeken. Het principe staat als een huis: laat de CAC je rekening pas verlaten nadat rebill 1-2 binnen is. Reken wél elke keer opnieuw, want de 5%-foutwaarschuwing is geen grap.

De supply-chain-helft is minder direct: Goatly's geitenmelkpoeder komt vermoedelijk uit NL/EU, niet uit Shenzhen, dus CNY, Alibaba en battery-testing zijn hier framework, geen playbook. Wat wél overdraagbaar is naar élke co-packer: golden samples + go/no-go-criteria (certificate of analysis per batch voor een supplement/poeder is exact de Nutra-QC die ze beschrijven), en de payment-term-onderhandeling (rolling deposit, forecast delen, long-term-partnership-frame).

Voor [[passendonline|Passendonline]] voedt dit vooral de onderbouwing, niet de bouw. De contribution-margin- en LTV-definities horen in het rekenmodel achter de [[services|dienstverlening]] en de sales-dossiers: als je een klant een omzet-uplift belooft, moet je in deze termen (CAC, AOV, cohort-LTV, breakeven-maand) kunnen rekenen in bandbreedtes. Dit sluit aan op de [[strategy|strategie]] om een agent-gedreven CRO-pipeline per klant te draaien: de barometer-diagnose (welke van de vier knop is stuk) is een perfecte auditstap vóór je aan de [[08-cro-and-landing-pages|landing pages]] begint. Kritisch: de "0.5 ROAS en toch winst"-belofte is waar bij hoge subscription-LTV, maar geen one-size-fits-all. Bij een one-time-product-klant zonder rebills is first-order-profitability wél de wet, en dan is deze hele stapel niet van toepassing. Niet klakkeloos doorverkopen.

## Skill-haakjes

Primair **unit-economics**: dit cluster is de kwantitatieve ruggengraat ervan. Voeg de exacte formules toe (contribution margin met alle vijf variabele kosten, de cohort-LTV-rijlogica, de vier barometer-drempels COGS<30% / AOV≥$39 / take-rate / ROAS≥0.7, en de cash-conversion-stapel met de 5%-foutgevoeligheid). Secundair **sales-dossier**: het cohort-rekenmodel in bandbreedtes onderbouwt omzet-claims per [[passendonline|Passendonline]]-lead. De supply-chain-modules (due diligence, QC, payment terms, CNY) zijn eerder los referentiemateriaal dan een bestaande skill; als er ooit een operations/sourcing-skill komt, is dit de bron.
