---
type: research
source: Informatie Ecom en Brand (course dump)
course: Evolve (Spencer Pawlik / Sean / Grayson) + Origins
status: distilled
tags: [ecom, media-buying, meta-ads, 3-2-2, scaling]
---

> [!info] Bron
> Gedistilleerd uit 40 transcripts (Evolve "How To Run Ads", media buying template, promo, scaling, KPIs, attributie, plus een live Q&A call). Ruw archief: [[E_mediabuying_testing]] in `_transcripts/`. Dit is cursusmateriaal, geen evangelie; [[me|Talat]] maakt de compliance- en claim-calls zelf.

## Waar dit over gaat

Dit is de operationele kant van Meta-ads bij Evolve: hoe je de knoppen in Ads Manager daadwerkelijk zet. Eén broad CBO-campagne waarin je tegelijk test en schaalt (de 3:2:2 methode), drie testmethodes om angles te valideren (Marksman, Sniper, Shotgun), en een reeks satellietcampagnes (raw content, promo, ABO-scaling, zombie/graveyard, page-test). Plus het rekenwerk eromheen: break-even en scaling ROAS, blended/MER/LTV-ladder, attributievensters, surf scaling tijdens sales, refunds claimen, en beschermingsregels tegen ads die je account leegzuigen. Voor [[business|Goatly]] is dit de blauwdruk om het account weer strak te runnen; voor [[passendonline|Passendonline]] is het de media-buying-SOP die je per klant kunt uitrollen. Zie ook de aanpalende docs [[01-ad-lifecycle-system]], [[04-creative-execution-and-ad-learnings]] en [[09-offers-and-origins-media-buying]].

## Kernframeworks

### De 3:2:2 methode (de hoofdcampagne)

Eén campagne, CBO, broad, waarin je ads test via ad sets. Vroeger heette dit een DCT-campagne met dynamic creative; nu draaien ze het met **manuele ads** omdat Facebook dynamic creative heeft vervangen door "flexible ads", en bij flexible ads kun je de losse creatives niet meer opsplitsen in de breakdown. Manueel houden lost dat op.

De naam 3:2:2 komt van de opbouw van elke test-ad set: **3 creatives, 2 headlines, 2 copies**. Alle drie de creatives zijn hetzelfde concept (bijv. drie hook-varianten van dezelfde video, of drie beeld-varianten van hetzelfde statische idee), zodat de test schoon is. Je houdt de 2 headlines en 2 copies identiek over de drie creatives; alleen het beeld verschilt. Facebook verdeelt de spend en vertelt je zo welke creative, headline en copy wint. Je kunt de tekst wél opbreken in de breakdown (dynamic creative element), de creative niet, dus zet je de creatives als aparte manuele ads klaar.

Regel: **1 ad set = 1 creative concept.** Meng geen beeld en video in dezelfde ad set, anders wordt de data niet zuiver verdeeld. De 2026-outline noemt dit inmiddels een "3:2:2:2"-test; de gedetailleerde setup-video leert nog steeds 3 creatives / 2 headlines / 2 copies, dus behandel de extra "2" als een nieuwere variant om in de sheet te checken.

Setup-instellingen die er echt toe doen:
- Sales-campagne, handmatig (manual), CBO aan, **minimum $100/dag** budget (hoger mag).
- Optimaliseer naar **maximize conversions**, niet value. Value hebben ze getest en losgelaten.
- Stuur naar **website only**, niet naar Shopify shops (discount- en AI-problemen).
- **Dynamic creative uit.** Multi-advertiser ad optie uit. Alle Disney/AI-verbeteringen uit.
- Placements op **Advantage+** laten staan (meer data = betere performance, ze optimaliseren niet meer handmatig naar bijv. alleen IG Reels).
- Ads **inplannen vanaf middernacht account-tijdzone** (12am tot ~4am), altijd op account-tijdzone ook al verkoop je naar een andere tijdzone.
- Alleen **9x16 verticale ads** maken, maar geëdit in safe zones zodat ze ook als 1x1 kloppen. Horizontaal converteert toch niet.

### Broad targeting en de 50+ workaround

"Broad" betekent bij Evolve letterlijk alleen **leeftijd, geslacht, locatie**. Geen interesses, geen lookalikes. Belangrijk voor [[icp|Goatly's 50+ vrouwen]]: Meta's nieuwe Advantage+ audience zet minimum leeftijd op 18 en laat je niet garanderen dat je 50+ raakt. De fix: in de ad set naar **advertentie-instellingen, audience controls, "switch to original audience options"**. Daar kun je wél 50-plus vrouwen selecteren. Voor een echt broad product laat je 18+ alle geslachten staan; heb je een specifieke demo, dan forceer je die via de originele audience-opties. Exclusions (purchasers) alleen nodig als je hoge terugkerende-klantratio hebt.

### Waarom 3:2:2 beter is dan ABO (de DCT-evolutie)

De redenering, opgebouwd uit echte accounts:
1. **1 ad set / 1 ad ABO-testen faalt** omdat je nooit weet of het concept slecht was of alleen de hook. Voorbeeld: "Lifestyle Video V1" bleef op 2.5x steken; dezelfde video met een andere hook (V1.2) draait een jaar later nog als beste ad op 3.3x, na twee jaar worstelen om 3x te halen. **Test daarom altijd in batches**, nooit één ad per ad set.
2. **Manuele tests valideren niet op schaal.** Een ad die in een aparte testcampagne een $52 cost-per-upsell haalde (break-even $70), sprong bij opschalen bijna 3x omhoog in kosten. Een week testen weggegooid.
3. **DCT lost dat op**: elke DCT is een batchtest binnen de scaling-campagne zelf, dus je test en schaalt in dezelfde arena. Engagement blijkt niet te tellen: nieuwe ads zonder likes verslaan oude ads met 13.000 likes al op dag één. CBO wil minimaal 3 ad sets om goed te werken, en 3 ads geven het algoritme genoeg om te leveragen, vandaar 3:2:2.

Nuance: DPA's (dynamic product ads) en instant experience kun je in deze structuur niet meer testen. Draait een DPA al goed bij een klant, dan drip je hem gewoon mee in de champions.

### De media-buying filosofie: de arena

De kern-mindset. Eén broad acquisitiecampagne doet prospecting, retargeting en middle-of-funnel tegelijk; je hoeft geen aparte test- of scaling-campagnes te bouwen, "audiences don't matter." Op campagneniveau doe je één ding: **het budget bepalen**. De rest laat je aan Facebook.

Het grote inzicht: je gooit nieuwe ads meteen in het Colosseum, geen warmup, geen kleine testbudgetten. **Krijgt een ad spend, dan is het 9 van de 10 keer een winnende ad. Krijgt hij geen spend, dan is het een slechte ad.** Spencer heeft er zes maanden over gedaan om dit te accepteren: hij trok non-spenders eruit, forceerde $25 tot $400 in ABO, en ze presteerden consequent slecht (0.5x) terwijl de hoofdcampagne 3 tot 4x draaide. Over ~60 tot 70 geteste ads heeft hij nooit een non-spender in een aparte campagne zien outperformen; als het al lukt, houdt het 3 à 4 dagen stand en stort dan in. Deze structuur bespaart dus geld en optimaliseert vanzelf. Zie de bredere lifecycle-logica in [[01-ad-lifecycle-system]].

### De champions ad set

Naast de test-ad sets maak je één **champions ad set** in dezelfde campagne. Daar zet je alleen bewezen winnaars in, via **post-ID's** (Facebook post with comments methode), zodat de engagement behouden blijft. Doel:
- Consolidatie: als je 20 tot 30 test-ad sets hebt, raakt budget te verspreid. Pak de beste variant per bewezen concept en stop die in champions.
- Anti-uitzet-fout: een ad kan de ene week winnen en de andere week verliezen. In losse test-ad sets zou je hem uitzetten; in champions laat je alle bewezen winnaars staan en laat je Facebook kiezen. Je zet ads in champions nooit uit.
- **Benchmark / leaderboard**: champions krijgt meestal de meeste spend. Kan een nieuwe creative de champions niet outspenden op KPI, dan is het geen nieuwe winnaar. Kan het wel, dan is dat juist goed: je overall performance stijgt en je kunt verder schalen op dezelfde ROAS. Belangrijk: als een nieuwe winnaar champions outspendt, zet je de originele test-ad set **niet** uit. Champions is hit-or-miss (soms krijgt een gedropte winnaar toch geen spend), daarom laat je de originele test ook staan.

Zo werkt de hele cyclus: je test alleen nieuwe creatives, een winnaar pakt de meeste spend, ROAS stijgt, je verhoogt budget. Voorbeeld uit de video: één winnende creative liet ze van 20k naar 60k/dag op vergelijkbare ROAS gaan, alles binnen dezelfde campagne.

### De 3 testmethodes (Marksman, Sniper, Shotgun)

Wapenmetaforen om angles te testen (uit de avatar-training, zie [[03-avatar-desire-market-sophistication]]):

**Marksman** (drie-schots-burst, de middenweg). Je test **meerdere angles tegelijk** in een gecontroleerde omgeving: binnen één concept drie variaties die elk een ander angle raken. Het humidifier-voorbeeld: variatie 1 = "world's first stainless steel", variatie 2 = "world's easiest to clean", variatie 3 = "world's first doctor-designed". Doel is **direction** vinden: welk angle Meta oppikt (= spend krijgt), zodat je weet waar je dieper op moet. Voordeel: sneller, meer angles per test. Nadeel: je valideert geen enkel angle volledig.

**Sniper** (één kogel, herladen). Zodra je direction hebt, ga je **all-in op dat ene angle** en test je verschillende executies, formats, headlines, hooks. Voordeel: dieper, meer zekerheid, sneller leren wat werkt. Nadeel: trager, kan je in iteration-overload duwen. In het voorbeeld: stainless-steel angle, daarna een grotere sniper-swing (meer research, AI-voiceover, storytelling-format, ingezoomd op "parents") tilde een ad van $10k naar $80k spend per week op dezelfde ROAS.

**Shotgun** (lukraak spuiten). Een hoop random ads lanceren en hopen dat iets raakt. **Fout** voor je creative-strategieteam in 2025 (Meta straft de kleine iteratie-swings af). **Juist** voor content-strategie: TikTok Shop of Insense product-seeding, waar je veel creator-content binnenkrijgt die je niet stuk voor stuk kunt strategiseren. Blast het, en als iets raakt pas je Marksman of Sniper toe om te verfijnen. Zie [[06-creators-ugc-whitelisting]].

Volgorde bij Evolve: **Marksman eerst** (direction), **Sniper daarna** (winnaars uitdiepen), **Marksman opnieuw** als een angle plateaut. Kernregel eronder: single-variable testen is bijna onmogelijk sinds Meta's updates; te kleine swings ziet Meta niet als anders. Dus: maak gewoon de beste ad die je kunt, en wees je bewust van het avatar dat je raakt.

### De direction-loop (test, hypothese, sniper)

Het echte werk zit in learnings. Niet "dit is een video, daarom werkt het", maar: wie is de sub-avatar, welk angle, welk desire of welke productervaring drijft de aankoop. Proces: (1) test meerdere angles tot iets sales pakt, (2) maak een **hypothese** waarom de klant koopt (blijf "waarom" vragen tot je bij het core desire komt), (3) test die hypothese om te optimaliseren. "The faster you figure out why something is winning, the faster you can scale." Dit haakt direct in [[04-creative-execution-and-ad-learnings]] en de research-doctrine in [[10-research-system-and-product-research]].

### De 5 campagnetypes (de 2026-map)

Evolve draait exact vijf campagnes, niks daarbuiten (geen cost-cap/bid-cap trucs):
1. **3:2:2 acquisitiecampagne** (hoofdcampagne, gestrategiseerde custom creatives, test + scale).
2. **Raw content campagne** (ongeschminkte creator/seeding-content).
3. **Page-test campagne** (congruente ad naar congruente landing page, in het CRO-programma; zie [[08-cro-and-landing-pages]]).
4. **Promo campagne** (sale-periodes).
5. **ASC / Advantage+ Shopping** (optioneel; hun tests hielpen performance nooit, dus meestal niet).

Daarnaast in de 2026-update twee nieuwe: de **ABO testing/scaling campagne** en de **zombie/graveyard CBO cost-cap campagne** (hieronder). Aantal actieve ad sets: bij een paar honderd dollar/dag max **5 ad sets** (inclusief champions) zodat budget niet te dun wordt.

### ABO testing/scaling campagne (2026-update)

Bedoeld voor accounts die al schalen; het fixt geen slechte ads en wordt afgeraden onder $1k/dag of zonder media buyer. Je dupliceert winnaars uit de hoofd-CBO naar losse ABO-ad sets:
- **Breakthroughs** krijgen een eigen ad set om verder te schalen (hoger startbudget).
- **Spend winners** krijgen een eigen ad set om hun spend te throttlen.
- **KPI winners** krijgen een eigen ad set om te zien of ze meer spend aankunnen (lager startbudget).
- **Losers** verhuizen naar de zombie-campagne.
Startbudget per ABO-ad set: **5 tot 20% van je totale dagbudget** (je kunt altijd opschalen). **Geen champions ad set** in de ABO. Zet de gedupliceerde ads in de hoofd-CBO nooit uit.

Optioneel een pure **ABO testing-campagne** met drie attributie-experimenten op je topads: (1) **harde exclusions** onder 7-day click (website visitors, add-to-carts, page engagers 365d, past customers) om Meta naar net-new mensen te duwen, (2) **1-day click** met soepele exclusions (alleen purchasers), want 1DC is vanzelf conservatiever, (3) **incremental attribution** met sterke exclusions. De hoofd-CBO blijft ondertussen de basisomzet beschermen.

### Zombie / Graveyard campagne

Een **CBO cost-cap campagne voor "gefaalde" ads**. Low-maintenance manier om nog wat ROI uit elke creative-test te persen zonder budget te verbranden; prioriteert gefaalde ads die de beste CPA's kunnen halen. Sluit aan op de seizoensobservatie (hieronder): desires verschuiven, en Meta kan ads die eerder faalden later wél belonen. Credit: Shackelford (zombie) en jforjacob (graveyard).

### Raw content campagne

Bijna identiek aan de 3:2:2, maar voor ongeschminkte creator-/seeding-content (Insense) die je zonder edits lanceert. Doel: extra volume, spend forceren naar creator-ads, en high-intent ads gescheiden houden van raw ads zodat learnings zuiver blijven. Winnende creators huur je als brand ambassador. Bij weinig content: één ad set, één raw video geknipt op **drie startpunten** (drie hooks, geen tekst/muziek toegevoegd). Bij veel content: één ad set met drie verschillende video's. Meestal geen champions ad set hier. Ripped ads (van anderen) horen ook thuis in deze campagne.

### Promo campagne (sale-periodes)

De sale-structuur die alleen al 700k in een maand heeft gedraaid. **Eén CBO, drie ad sets**:
- **Broad**: alleen leeftijd, geslacht, land.
- **Warm 60** (middle-of-funnel): custom audiences van FB-page engagers, IG-engagers, video viewers 95%, laatste 60 dagen. Sluit bottom-of-funnel uit.
- **Hot 90** (bottom-of-funnel): website visitors, add-to-cart, initiate checkout, view content, laatste 90 dagen.
Retargeting doen ze normaal niet, maar in sale-periodes werkt het wel (je wilt dat mensen nú kopen). Creatives zijn simpel omdat het publiek most-aware is: een product-image met de aanbieding, of je beste bestaande video/beeld met een **sale-banner** erop. Video viewers-audience: selecteer alle video's met 1000+ views. Dit tilde klanten van 10k naar 70k/dag in 24 uur.

### Surf scaling (advanced)

Systematisch **meerdere keren per dag schalen** tijdens grote periodes (Black Friday), datagedreven in plaats van op gevoel. Frequentie hangt af van je huidige spend:
- Paar honderd $/dag: elke **6 uur**.
- Paar duizend $/dag of ~20k/dag (500k/maand): elke **4 uur**.
- ~1M/maand: elke **2 uur**. Dicht bij 100k/dag: elk **uur** kan.
Reden voor niet-te-vaak: het algoritme heeft conversies nodig om te optimaliseren. Schaal altijd op **account-tijdzone** (reset budgetten vóór middernacht account-tijd, anders blaas je alles op). Per periode track je Shopify-revenue, meta-revenue, spend, andere kanalen, en **blended ROAS** (Shopify-omzet gedeeld door ad spend, de meest accurate voor je P&L). Beslisregel per periode: boven KPI = agressief verdubbelen; onder KPI = budget gelijk houden of verlagen. Zo pak je pieken hard en bescherm je winst in slappe uren.

De reset-regel: als je van 10k naar 100k/dag hebt geschaald spendt hij nooit de volle 100k (bij een budgetwijziging krijgt hij niet de kans), meestal ~50k. Reset de volgende ochtend naar **de helft van wat je die dag echt spendde** (24k gespendeerd → start op 12k), dan schaal je opnieuw op. Anders spendt hij de volgende dag de volle 100k en blaas je het account op. De niet-promo-variant: check elke 4 uur, past 4 uur 50 tot 100% boven KPI = verdubbel, 20 tot 50% boven = +20%, op KPI = laten staan, onder = -20%. Alleen doen met third-party attributie (Triple Whale, Hyros, Northbeam) want Facebook-data is te traag, en evergreen surf scaling alleen als je al een paar duizend/dag op die ene campagne draait.

### Seasonal ads reactiveren

Een van de weinige knoppen die performance direct kan liften. Sommige oude top-ads presteren alleen in een bepaald seizoen. Een ad die in nov/dec 2023 en opnieuw nov/dec 2024 rippte (35k tot 45k spend op ~2.3x) stierf elk voorjaar volledig. Actie: **zet oude super-winners in hun bewezen periode weer aan** (in CBO of via een ABO-test) en geef ze een kans; het kan NCPA drukken en oude performance terughalen. Waarschuwing van Evolve zelf: geen excuus om te stoppen met nieuwe ads maken, en het is een gok. Los daarvan draaien ze een groot ABO-vs-CBO-experiment: **CBO blijft tot nu toe superieur.**

### KPIs en targets

- **Break-even ROAS** = totale prijs (product + shipping) gedeeld door je marge-logica. Zet in een marge-calculator de service fee, performance fee, ad spend en ROAS-multiplier op nul en lees de break-even ROAS af. Schrijf dat getal op.
- **Scaling ROAS = break-even + 1.0.** Break-even 1.54x → scaling target ~2.54x. Boven je scaling-ROAS blijven = budget pushen; eronder = budget zakken.
- Je hebt geen 3x nodig: bij 65% marge is 1.54x al break-even. Vaak is **meer spenden op lagere ROAS** winstgevender in absolute euro's (10k op 4x = 16k winst; 20k op 3.5x = 25k winst).
- **Drie KPI-niveaus**: (1) beginner = **blended ROAS** (Shopify-omzet minus ad spend), want Facebook heeft maar een 7-daags venster en de meeste journeys zijn langer; (2) midden = **MER** (blended plus wat Facebook rapporteert, voor attributiebegrip, vooral als je veel organisch hebt); (3) advanced = **NCPA vs LTV** (3/6/12-maands), waarvoor je Triple Whale wilt. Onder ~50k/maand: blijf bij blended + in-account ROAS. Details in [[07-ecommerce-finance-and-supply-chain]].

### Attributie en Triple Whale

Kernregel: **click-based = goed, view-through = no good.** Ze draaien nu voornamelijk **7-day click** (soms 7-day click / 1-day view, soms 7DC-only als test). Ads die weinig spend pakken kapen vaak alleen view-through of last-click, terwijl de spenders de echte performance driven. In Triple Whale (alleen voor kanaal-specifieke beslissingen, niet voor de hele brand): zet het **attributievenster op 14 dagen**. TI (Total Impact) = welk kanaal incrementeel is voor de business; TA (Triple Attribution) = click-through ROAS en combineert first + last click; TA+V = click + view; FC = first click; LC = last click.

### Bescherming tegen overspending + high-spend kill-framework

Meta laat je geen rule bouwen die automatisch CBO-ad sets kilt op performance ("performance related conditions are not available" bij turn-off van CBO-ad sets). Workaround: zet een **maximum dagbudget** per nieuwe creative (bijv. $500 daily max voor accounts die 15 tot 30k/dag draaien). Zuigt een nieuwe ad 's nachts spend op met slechte ROAS, dan cap je de schade; doet hij het goed, haal je de cap er de volgende dag af. Diagnose van een click-baity ad: vergelijk **link clicks vs landing page views**. Voorbeeld: 1649 clicks maar 1300 LPV = 78% (mensen klikten per ongeluk, 0.26x ROAS, $1500 verbrand), tegenover een champions-ad op ~100%.

Beslissingsframework voor een **bestaande high-spend ad** die je overweegt uit te zetten:
1. Wat is de **frequency**? 1.5 of lager = prospecting (waardevol, niet zomaar killen).
2. Als ik deze uitzet en die spend naar mijn top 2-3 ads forceer, zouden die dan beter presteren dan de top-spender? **Meestal nee** (een 2.49x op 12k houdt geen 2.49x als je hem 3x zou schalen). Alleen bij een oprechte "ja" uitzetten.
3. Een **nieuwe** ad die spend opzuigt met slechte KPI mag je in de eerste **24 tot 48 uur** killen. Spend je 20k/dag, heb dan rules klaar.
Onderhoud: elke ad set wil idealiter **3x CPA aan spend/dag** (target CPA $30 → $90/ad set/dag → bij $900/dag max ~10 ad sets). Wat je eerst uitzet: ad sets die na 7+ dagen **geen spend pakken én KPI missen**. Test-window: minimaal 3 dagen, standaard 7, maximaal 14.

### Refunds, verificatie, naming, partnership ads, must-have automations

- **Refund claimen** bij overspend/outage: dit is VA-werk, geen operator-werk. Bewijs verzamelen (meta-status screenshot van de outage, ads-reporting pivot met spend per uur die de piek toont, plus een normale dag ter vergelijking), dan via Business Help contact support, dan report-a-problem in Ads Manager (ad delivery overspent), dan de refund-form met de reference numbers uit Billing & Payments. Chat lukt niet altijd; blijf via de forms en spam support ("go to Facebook support five times a day for the next three days").
- **Business Manager verifiëren**: als de security-center-knop ontbreekt, maak een dummy Instant Game-app aan (Meta for Developers, privacy policy URL = google.com, 1024x1024 icon), sla op, en de "start verification"-knop verschijnt. Verwijder de app pas nadat de verificatie rond is.
- **Partnership ads**: Meta's officiële, minder deceptieve versie van whitelisting ("Merk x Creator" collab-label). Evolve draaide het maar voor één brand (168k spend, 440k sales) en gebruikt liever gewone whitelisting. Zie [[06-creators-ugc-whitelisting]].
- **Twee automations in elk account** (uit de live call): (1) als spend 5x stijgt in 24 uur, pauzeer alle ads die stegen; (2) als de URL niet gelijk is aan je website, zet de ad uit. Beschermt tegen hacks en tegen een media buyer die per ongeluk een nul te veel of de verkeerde link plakt. Verder: op schaal geen KPI-kill-automations gebruiken; huur een media buyer.

## Procedures / SOP

**3:2:2 acquisitiecampagne opzetten**
1. Create, Sales, Manual. CBO aan, budget minimaal $100/dag. Naming-template invullen.
2. Optimaliseer naar maximize conversions, website only, juiste pixel. Value uit, dynamic creative uit.
3. Ad set: naam invullen, ads inplannen vanaf middernacht account-tijd. Broad = leeftijd/geslacht/locatie. Voor 50+: switch to original audience options en selecteer de demo. Placements op Advantage+.
4. Ad: manual upload, single image or video (niet flexible). Alle AI/Disney-enhancements uit. 9x16 creative, safe-zone geëdit.
5. Vul 2 copies en 2 headlines in. Description = alleen je offer (bijv. free shipping). CTA = Shop Now. Website + UTM's invullen.
6. Dupliceer de ad 2x binnen dezelfde ad set, vervang alleen het beeld (hook 2, hook 3). Copies en headlines gelijk houden.
7. Nieuwe concepten testen: dupliceer de hele 3:2:2 campagne naar een nieuwe ad set (CT44, CT45...) en vervang de variabele.
8. Houd max 5 ad sets actief onder een paar honderd $/dag; meer budget = meer ad sets.

**Een winnaar promoveren naar champions**
1. Maak één champions ad set met exact dezelfde setup en targeting als de test-ad sets.
2. Filter naar ad-niveau, vind je beste ad (laatste 30 dagen of maximum). Breakdown by day / by element om beste creative + copy + headline te bepalen.
3. Pak de **post-ID** van de winnende combinatie (Facebook post with comments). In champions: use existing post, enter post ID, enhancements uit, UTM's invullen.
4. Zet de originele test-ad set niet uit. Krijgt de champions-versie geen spend, laat beide staan; outspendt hij de test-ad set, dan mag je de test uitzetten.

**Promo campagne draaien**
1. Eén CBO, drie ad sets: Broad, Warm 60, Hot 90. Bouw de custom audiences (FB/IG engagers + video viewers 95% voor warm; website/ATC/checkout/view content voor hot). Bottom-of-funnel uitsluiten in warm.
2. Creatives: product-image met offer + sale-banners op je beste bestaande ads.
3. Scale: +20% of verdubbel bij goede performance; op schaal surf scalen met een third-party attributietool.
4. Einddatum via een custom rule (current time is greater than [datum], action = turn off; checkt ~elke 20 tot 30 min).

## Templates, prompts, formules

**UTM-string (Evolve, plug-and-play, ook voor Triple Whale):**
```
utm_source=facebook&utm_medium=paid&utm_campaign={{campaign.name}}&utm_term={{adset.name}}&utm_content={{ad.name}}&fbadid={{ad.id}}&tw_source={{site_source_name}}&tw_adid={{ad.id}}
```

**Naming conventions (3 niveaus):**
```
Ad-file:  Client - Batch# - Concept - Format - Type(IDEA/ITER/IMIT) - Editor - Variation#
  bijv.   Carepod - Batch#122 - Stainless Steel - Video - IDEA - Dale - V2

Ad in account:  Batch#/Edit#/UGC# - Concept/Creator - URL(CP/PDP/HP/LP-Name) - Format Type - Editor - V# - Copy#,# - Headline#,#
  bijv.   Batch#16_Armpits_PDP_Video_IDEA_John_V2_C_14,20_H_3,78

Ad set:  Batch#/Champions // Concept of Post-IDs // Attribution // Audience // Country // Age // Gender // Custom Aud.
  test:   Batch#10//Mom-Angle//7DC-1DV//Broad//US//18+//Women//Purchasers-30d
  champ:  Champions//Post-IDs//7DC//Broad//US//25+//All//Purchasers-180d
```

**Max concepten per week:** `Totaal budget / target CPA = max ad sets`. $100/dag ÷ $20 CPA = 5.
**Spend per ad set:** streef **3x CPA/dag** per ad set. $30 CPA → $90/ad set → $900/dag = ~10 ad sets max.
**Scaling ROAS:** break-even ROAS + 1.0.
**Surf-scale reset:** volgende dag starten op de helft van wat je die dag echt spendde.
**Overspend-cap:** maximum daily budget per nieuwe creative (bijv. $500) i.p.v. de (onbouwbare) auto-kill rule.
**Auto-kill die Evolve probeerde (werkt niet op CBO, wel documenteren):** spend > $500-$1000 EN ROAS < 1.2x EN hours-since-creation < 24 → turn off ad set.
**Twee must-have account-automations:** spend +5x in 24u → pauzeer gestegen ads; URL ≠ website → ad uit.

## Quotables

> "If an ad gets spent in this structure, nine times out of ten you have found a new winning ad. If an ad does not get spent, it is a bad ad." (Spencer, Evolve philosophy)

> "We are not starting these ads on the playground. We're throwing them right in the Coliseum." (Evolve, over de broad CBO als arena)

> "You will be humbled by this method. A lot of your creatives aren't going to get spend, and that's okay. That just means they're not good enough." (Evolve, 3:2:2 troubleshooting)

> "Stop doing shit that your VA can do. Go to Facebook support five times a day for the next three days and get me my refund." (live call, over refunds als VA-taak)

> "The faster you figure out why something is winning, the faster you can scale." (Evolve, testing methods)

> "Blended is the most important thing. That's basically what you determine your P&L on." (Evolve, surf scaling / KPI)

## Zo pas je dit toe op Goatly + Passendonline

Voor [[business|Goatly]] is dit vrijwel 1-op-1 bruikbaar en het lost precies het "waar zet ik nu welke knop"-gat. Concreet:
- **Bouw de account rond één broad CBO 3:2:2** en stop met losse test/scale-campagnes. Voor de [[icp|50+ vrouwen]] is de "switch to original audience options"-workaround geen detail maar noodzaak: de video geeft zelf toe dat Meta richting mannen duwt en dat je soms spend naar vrouwen moet forceren. Hier ben ik het oneens met het pure "audiences don't matter"-dogma. Voor een bone-health-niche met een scherpe demo zou ik minstens gender forceren en de leeftijdsband bewaken, anders subsidieer je verkeerd verkeer. Test broad 18+ naast 50+ vrouwen en laat de data beslissen.
- **Champions als benchmark** past goed bij Goatly's beperkte set bewezen hoeken; het houdt je van 20 versnipperde ad sets af en geeft nieuwe creatives iets om te verslaan. De echte hefboom blijft creative-volume (zie [[04-creative-execution-and-ad-learnings]]), niet media-buying-trucs.
- **Blended ROAS / MER als stuur-KPI**, niet wat Facebook rapporteert, omdat Goatly backend/MRR draait en het 7-daagse venster de journey onderschat. Zet break-even en scaling ROAS (+1) letterlijk op papier. Uit de LTV-logica: bij een abonnementsmodel is meer spenden op lagere ROAS vaak meer winst; combineer met de intro-offer-les uit de call (liever een gratis product dan een korting, want korting trekt slechtere klanten en breekt de rebill-cadans).
- **Twee beschermingsautomations** (5x spend, URL-mismatch) en een **$500 daily cap op nieuwe creatives** zijn goedkope verzekeringen die ik meteen zou zetten.
- **Seasonal reactivatie** is gratis upside: Goatly heeft seizoenspatronen (winter/gewrichten), dus oude winter-winners terugzetten in het seizoen is het proberen waard.
- Punt van kritiek / dateren: dit is DTC/dropship-DNA. De harde "non-spender = slechte ad, nooit forceren"-regel werkt in high-volume accounts met veel conversies per dag; bij Goatly's volume kan een goede ad met te weinig dagelijkse events trager tot statistische significantie komen, dus geef tests eerder de volle 7 dagen dan snel te oordelen.

Voor [[passendonline|Passendonline]] is de winst vooral **proces en verkoopbaarheid**. De naming conventions (3 niveaus), de UTM-string, het 5-campagne-model, de KPI-ladder en de refund-SOP zijn precies wat je per klant standaardiseert, zodat een team of agent het account kan lezen en beslissen. Dit is materiaal voor de media-buying-laag van de agency-[[services|dienstverlening]] naast [[brand]]-werk. De page-test-campagne (congruente ad naar congruente landing page) sluit direct aan op je CRO-aanbod ([[08-cro-and-landing-pages]]). En de high-spend-kill- en 3x-CPA-per-ad-set-regels geven je verdedigbare beslisregels richting een klant. De competitor [[Rynse]] draait dezelfde broad-CBO-food-not-pills-machine op schaal; het contrast dat je wint zit niet in media-buying-mechaniek (die is commodity) maar in [[strategy|angle en creative]], dus verkoop de mechaniek als hygiëne en de creative-strategie als het echte werk.

## Skill-haakjes

Voedt vooral **unit-economics** (break-even/scaling ROAS, blended vs MER vs NCPA/LTV, 3x-CPA-per-ad-set, surf-scale-rekenregels) en **ad-factory** (3:2:2-setup, naming conventions, champions-flow, testmethode-keuze). De Marksman/Sniper/Shotgun-logica en de direction-loop haken in **contrast-check** en **voc-research** (angle-direction vinden en uitdiepen). Overweeg een kleine nieuwe skill of SOP-referentie `media-buying-runbook` voor Passendonline-klanten: campagne-setup, naming, KPI-targets, beschermingsregels en refund-stappen in één uitvoerbaar draaiboek.
