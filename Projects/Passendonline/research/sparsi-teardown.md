---
type: research
date: 2026-07-21
project: Passendonline
status: completed
tags: [competitor, sparsi, website-abonnement, cro, teardown]
---

> [!info] Wat dit is
> Deep-research teardown van [[project_passendonline|Sparsi]] (sparsi.nl), de NL website-startup die je op Meta zag. Bron: 17-agent workflow, 13 klantsites afgepeld, offer + funnel + fine print geverifieerd op de site zelf. Doel: wat kopiëren, wat vermijden, waar [[project_passendonline|Passendonline]] met CRO wint.

## Kort oordeel

Sparsi verkoopt een **website-als-abonnement**: geproductiseerd, één stack, één sjabloon, recurring. Hun go-to-market (prijsanker + €0 setup + snelheid) is scherper dan de meeste bureaus. Maar ze leveren sites die geoptimaliseerd zijn om het abonnement te verkopen, niet om de klant zijn bezoekers te laten converteren. Dat gat, plus hun SEO/snelheid/proof/transparantie-tekorten, is precies jouw terrein. **Kopieer hun verpakking, versla ze op de inhoud.**

## Aanbod en prijs

Sparsi B.V. (KvK 95569731), claimt >350 aangesloten bedrijven en 4,8 score (beide onbevestigd, behandel als claim).

| Pakket | Prijs | Wat |
|---|---|---|
| Website | €30/mnd | WordPress op maat, concept in 5 dagen, hosting/SSL/backups, onbeperkt tekst+beeld wijzigen, "SEO-basis", zakelijke mail, AVG-pakket |
| Webshop | €55/mnd | WordPress + WooCommerce, iDEAL/Klarna/Bancontact, koppelingen verzending+boekhouding. Transactiekosten NIET inbegrepen |
| Applicatie | €180/mnd | Maatwerk webapp, open scope ("scope samen bepaald"), recurring doorontwikkeling |

Kern-USP letterlijk: *"Geen hoge startkosten en geen losse facturen. Eén vast maandbedrag."* en *"Snel live, eerlijke prijzen. Geen kleine lettertjes."* Positionering = ontzorgen: *"Jij hoeft er zelf niets voor te doen."*

Wat ze expliciet NIET doen: alleen WordPress (geen Shopify, geen template-builder, "geen AI"), geen SEO-campagnes/content/linkbuilding, en **geen advertising/media-buying**. Ze bouwen een site en hopen op traffic.

## De scheuren tussen marketing en fine print

Dit zijn je sales-wapens. Twee harde discrepanties, beide verifieerbaar op hun eigen site:

1. **"Geen langlopend contract, jaarlijks opzegbaar"** (homepage) versus de FAQ: **vaste periode van 12 maanden, stilzwijgende verlenging met telkens 12 maanden, opzeggen minimaal 3 maanden vóór einde contractjaar.** Dus minimaal €360 gegarandeerd, en wie de opzegdatum mist zit nog een jaar vast. Juridisch bij B2B waarschijnlijk houdbaar (Wet van Dam geldt daar niet), maar de marketingclaim is misleidend.
2. **"Van intake tot live in ±1,5 week"** (homepage) versus de FAQ: **circa 3 weken** voor websites, **2 tot 3 maanden** voor apps.
3. Bonus lock-in: domein-verhuiscode pas na einde contract én na betaling, plus **€15 excl. btw verhuisvergoeding per domein** als exit-fee.
4. Ironie: hun eigen site draait niet op WordPress maar op **Lovable** (`visual-pro-platform.lovable.app`), terwijl ze "wij bouwen alleen in WordPress" prediken.

## Het bouw-recept

Over de sites met een consistente Sparsi-signatuur heen (Nexxivo, Van Steen Dakdekkers, GJJ Riooltechniek, StapSterk, Zorg in Holland, Sterk Business):

**Stack, vrijwel identiek:** WordPress + kaal **Hello Elementor**-thema + **Elementor Pro** (vaak versie 4.1.5, wijst op één bouw-cadans) + ElementsKit/Essential Addons + **Metform** voor formulieren + **Chaty** chat-widget. Hosting = nginx + proxy-cache op shared/managed WP, **nooit een CDN**. **Geen SEO-plugin** (geen Yoast/RankMath), daarom ontbreken meta-descriptions structureel, het is geen vergeten instelling maar zit niet in de build.

**Sectie-sjabloon homepage:** hero → stats-counters → 3-4 USP-cards → 4-9 dienstkaarten → "waarom ons" → 3-staps proces → FAQ-accordion → testimonials/CTA-band → nieuwsbrief-optin → footer.

**CTA-aanpak:** primaire CTA is een laagdrempelige lead ("Gratis consult", "Gratis meeting", "Offerte aanvragen"), geen self-serve checkout. Op de homepage vaak alleen een nieuwsbrief-optin; het echte leadformulier staat pas op `/contact`.

> [!warning] Het handtekening-defect
> De sterkste Sparsi-"vingerafdruk" is een fout: de stats-counter rendert structureel als **"0+"** live op Zorg Vooruit, Zorg in Holland, Nexxivo én GJJ. Een systemische QA-lek: het template heeft placeholder-tellers die niemand invult, en die gaan mee live. Dat ondermijnt direct de geloofwaardigheid van de klant.

## Portfolio-teardown

> [!important] Attributie-waarschuwing, verifieer vóór je dit in een pitch gebruikt
> De "portfolio" is deels hun logomuur plus door mij teruggezochte domeinen. Op **geen enkele** site staat een expliciete Sparsi-footercredit. Twee sites dragen juist een concurrent-credit: **Zorg Vooruit** en **Wim's Vastgoedbeheer** = "Gemaakt door Nofie.nl". Pijnlijk detail: Zorg Vooruit is een van Sparsi's eigen genoemde cases maar draagt een Nofie-credit. Dat is ofwel een verkeerd gematcht domein, ofwel Sparsi claimt een case die niet van hen is. Onzeker, maar het is precies het soort ding dat je (na verificatie) tegen ze kunt gebruiken.

| Site | Sector | Sparsi? | Grootste gap |
|---|---|---|---|
| Nexxivo | Uitzend/HR | Signatuur past | "0+"-tellers live, niet-klikbare telefoon, title = alleen "Nexxivo" |
| Van Steen Dakdekkers | Dakdekker | Signatuur past | Geen meta desc, geen LocalBusiness-schema, 18 PNG vs 4 webp |
| GJJ Riooltechniek | Riool/loodgieter | Signatuur past | Hero-CTA linkt naar "over ons" ipv lead, "0+"-tellers, geen schema |
| StapSterk | Jeugdzorg | Signatuur past | Formulier vraagt geen contactgegevens (leaklek), geen social proof |
| Zorg in Holland | Zorg | Signatuur past | "0"-stats, nul reviews/keurmerken, geen meta desc |
| Sterk Business | Administratie | Waarschijnlijk | Geen H1, geen meta desc, e-mail-typo `Info@sterbusiness.com` live |
| Bagels Village | Horeca | Onbevestigd | Hero-typo "HAPPINES IS THE SMEL", geen bestel/reserveer-CTA, geen Restaurant-schema |
| Zorg Vooruit | Zorgbemiddeling | **Nee, Nofie.nl** | "0+"-teller kapot, nul social proof |
| Wim's Vastgoedbeheer | Vastgoed | **Nee, Nofie.nl** | 3× H1, keyword-brij meta desc, geen proof |
| VitalFem | Vrouwengezondheid | Waarschijnlijk niet | ~4,6MB aan 3 PNG's, dubbele page-builder (Elementor + ZionBuilder), geen H1 |
| Inbalans | Administratie | Waarschijnlijk niet | Wél RankMath + review-slider + tarieven-calculator (afwijkende, betere build) |
| InfraSec | Beveiliging/installatie | Waarschijnlijk niet | Off-brand title (verwijst naar camerabewaking.nl), geen H1, geen webp/CDN |
| Het Zwembad | Zwembad/stichting | Nee, zelfbeheerd | Vrijwilligers-WordPress, plugin-bloat |

## Systematische gaps

- **CRO:** geoptimaliseerd om het abonnement te verkopen, niet de bezoeker te converteren. Kapotte tellers, nul echte social proof (geen Google-reviews/sterren/keurmerken), zwakke generieke hero-beloftes, nieuwsbrief-optin vermomd als leadcapture, niet-klikbare telefoon, inconsistente WhatsApp, geen sticky mobiele CTA.
- **SEO:** universeel ontbrekende meta-descriptions, merknaam-only titles zonder keyword/plaats, gebroken/ontbrekende H1's, geen JSON-LD/LocalBusiness-schema op fysieke local-service bedrijven. "SEO-basis" is nominaal.
- **Snelheid:** PNG ipv WebP overal, geen CDN, plugin-bloat. Core Web Vitals vrijwel zeker zwak.
- **Positionering:** ze verkopen een website als deliverable, geen uitkomst. Nul performance-accountability.

## Learnings voor Passendonline

### Kopiëren
- **Het geproductiseerde subscription-model met €0-setup-hook.** Verwijdert het grootste MKB-bezwaar (investering vooraf). Maar bouw het abonnement om **CRO-uitkomsten** heen, niet om hosting.
- **Pakket-ladder als expansion-revenue** (instap → shop → extra dienst).
- **"Eerste concept binnen 5 dagen" als belofte.** Snelheid verkoopt, en met de site-factory/site-craft infrastructuur maak je dit waar.
- **Herbruikbare sectie-/componentbibliotheek** voor lage bouwuren. Sparsi bewijst dat standaardisatie het model rendabel maakt.
- **Laagdrempelige lead-funnel** (gratis meeting + WhatsApp + offerte naast elkaar) bij een hoge-commitment aanbod.
- **Grondige bezwaar-wegname in de sales-copy** (te duur / verborgen kosten / ik zit vast / duurt lang).

### Vermijden
- **Marketing-vs-fine-print-contradicties.** Nooit "geen langlopend contract" als het 12 maanden met stilzwijgende verlenging is. Daar val je door de mand.
- **QA-lekken live:** kapotte "0+"-tellers, placeholder-content, typo's in de hero, e-mail-typo's. Houd de QA-gate in de site-factory-pipeline hard.
- **Ontbrekende SEO-basis:** meta desc, keyword-titles, H1, schema. Gratis, en Sparsi laat het overal liggen.
- **PNG zonder WebP, geen CDN, plugin-bloat.** Snelheid als afvinkpunt.
- **Exit-fees en domein-lock-in.** Schaadt referrals.

### Differentiëren (waar je met CRO wint)
- **Verkoop de uitkomst, niet het artefact.** Frame op leads/omzet/conversie. Sparsi levert een site en hoopt; jij levert conversie en meet.
- **Echte social proof standaard ingebouwd:** Google-reviews, named testimonials, cases. Bijna elke Sparsi-site mist dit volledig, een directe zichtbare kwaliteitskloof in je eigen demo.
- **CRO-first als default:** uitkomst-hero, two-step leadformulier, klikbare telefoon, WhatsApp, sticky mobiele CTA. Exact wat Sparsi structureel laat liggen.
- **Technische SEO ingebakken, niet "basis":** schema, meta, WebP, CDN, snelheid. Zet dit expliciet af tegen hun "SEO-basisoptimalisatie".
- **Meten en rapporteren.** Toon de klant zijn conversiedata terug. Dat maakt je recurring-fee inhoudelijk verdedigbaar boven €30.
- **Transparante contractvoorwaarden als USP.** Zet je eerlijke opzegtermijn naast hun stilzwijgende 12-maandslock.
- **Site + ads samen.** Sparsi doet expliciet geen advertising. Jij kunt met ad-factory de volledige funnel leveren (traffic → conversie → backend), waar Sparsi bij oplevering stopt.
- **Post-launch CRO-iteratie als de echte recurring value:** A/B-tests en optimalisatie-cycli in plaats van passieve tekst/beeld-wijzigingen.

## Open loop
Als je Zorg Vooruit / Nofie.nl-attributie hard wilt maken voor een pitch: check handmatig welke domeinen sparsi.nl op de case-knoppen linkt (hun site is een Lovable-SPA, dus curl helpt niet, browser wel). De Meta Ad Library-creatives zelf kreeg ik deze sessie niet ingezien (policy-block), dus de ad-hooks hierboven zijn afgeleid uit hun sitecopy, niet gelezen uit echte advertenties.
