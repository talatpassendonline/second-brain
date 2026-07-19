---
type: spec
date: 2026-07-13
project: Lichtendirect
client: Lichtendirect
status: in-progress
tags: [shopify, metafields, metaobjects, productdata, cro, architectuur]
priority: high
---

Datamodel waarmee elke [[Lichtendirect]]-PDP zichzelf vult: productinfo één keer vastleggen als gestructureerde velden, theme rendert automatisch. Vervangt het per-product plakken van HTML-spec-tabellen (Smart Tabs-app) en losse USP-tekst in de omschrijving. Theme-onafhankelijk: dit werk blijft geldig of we nu op Woodstock blijven of later migreren. Volgt op [[mobiel-pdp-cro-audit]].

> [!important] Belangrijkste inzicht
> De datalaag (metafields, metaobjects, CSV-import) bouw je in de **Shopify admin + Matrixify**, niet via de theme-code-connector die nu blokkeert ([[header-pdp-optimalisatie]]). Als Talat admin-toegang tot de store heeft, kan dit werk **nu al starten**, los van de theme-push.

## Model: 3 datalagen → 3 render-targets

| Laag | Wat | Opslag | Rendert als |
|---|---|---|---|
| A. Universeel | Zelfde voor hele catalogus | Hardcoded in template | Trust-strip (verzending, garantie, retour, betalen) |
| B. Specs | Waarden die per product verschillen | Flat metafields, namespace `specs` | USP-chips (5 gekozen) + volledige spec-tabel |
| C. Content | Herbruikbare uitleg-blokken | Metaobjects, gedeeld | Content-secties in de body (IP65-uitleg, koppelbaar, etc.) |

## Laag A: Universeel (0 data-entry)

Hardcoded in de USP-strip, geldt op elk product:
- Gratis verzending & retour NL
- Voor 17:00 besteld = morgen in huis
- 2 jaar garantie
- Veilig betalen (iDEAL/Klarna/Mastercard/Visa/PayPal/Bancontact)

## Laag B: Spec-metafields (de bron van waarheid)

Namespace `specs`. Product vult alleen de relevante velden; theme toont enkel niet-lege velden, dus een gemengde catalogus (lichtsnoeren, plafondlampen, LED) degradeert netjes.

| Metafield | Type | Voorbeeld | Ook als chip? |
|---|---|---|---|
| `specs.lengte` | single line text | 15 m | ja |
| `specs.aantal_led` | integer | 30 | |
| `specs.lichtkleur` | single line text | Warm wit | |
| `specs.kleurtemperatuur` | single line text | 2700K | ja |
| `specs.ip_classificatie` | single line text | IP65 | ja |
| `specs.dimbaar` | boolean | true | ja |
| `specs.koppelbaar_tot` | single line text | 150 m | ja |
| `specs.branduren` | single line text | 30.000 | |
| `specs.diameter_lamp` | single line text | 4 cm | |
| `specs.materiaal` | single line text | Kunststof | |
| `specs.fitting` | single line text | E12 | |

Chips voor de USP-strip = de 5 met "ja". De rest voedt de auto-gegenereerde spec-tabel.

## Laag C: Content-blokken als metaobjects (schrijf één keer, hergebruik overal)

Metaobject-definitie `feature_block`:
- `title` (single line)
- `body` (rich text)
- `image` (file reference)

Gedeelde instances (één keer schrijven):
- `ip65-uitleg` (IP65 vs IP44)
- `koppelbaar-systeem`
- `dimmer-afstandsbediening`
- `warm-wit-sfeer`
- `energiezuinig-branduren`

Product-metafield `custom.feature_blocks` = **list of metaobject references**. Alle IP65-producten wijzen naar dezelfde `ip65-uitleg`. Pas je die aan, dan verandert hij overal. Zo vult de body zich met rijke content, niet alleen chips.

## Populeren over "superveel producten"

1. **Matrixify** export van alle producten naar sheet (handelt metafield- en metaobject-referentiekolommen netjes af).
2. Sorteer op producttype/familie. Families delen bijna alle waarden.
3. Vul spec-kolommen per familie met copy-paste-down. Kolomnaam bv. `Metafield: specs.lengte [single_line_text_field]`.
4. Ken per familie de gedeelde `feature_blocks`-handles toe (ook copy-paste-down).
5. Re-import. Hele catalogus in uren, niet per product met de hand.
6. Tags houden we voor merchandising/collecties, niet voor specs (metafields zijn typed en schoner).

## Binden in het theme (theme-proof)

Eén set snippets, identieke data:
- `usp-strip.liquid`: universele chips + loop over de 5 gekozen `specs.*` die niet leeg zijn.
- `spec-table.liquid`: loop over volledige `specs.*` set → **vervangt de Smart Tabs-app** (app er later uit).
- sectie die over `product.metafields.custom.feature_blocks` loopt → rendert de metaobject-content.

Op een modern OS 2.0-theme kun je een deel hiervan via "dynamic sources" in de editor koppelen zonder code. Op Woodstock schrijf je de snippet. De **data is in beide gevallen hetzelfde en draagbaar**. Dat is waarom deze laag de theme-keuze de-riskt.

## Fasering

1. **Fase 1 (grootste pijn weg):** `specs`-metafields definiëren → CSV vullen → `usp-strip` + `spec-table` snippets. Kills lege PDP's catalogusbreed, Smart Tabs eruit.
2. **Fase 2 (rijke body):** `feature_block`-metaobjects + referenties → content-secties. Haalt de infographics/uitleg uit de gallery naar de body.
3. **Governance:** SOP "nieuw product = specs-metafields invullen" + Matrixify-template zodat de structuur blijft.

## Afhankelijkheden
- Fase 1-2 datalaag: admin-toegang + Matrixify. **Onafhankelijk van de theme-connector-blocker.**
- Theme-binding (snippets pushen): wacht op de connector uit [[header-pdp-optimalisatie]].

## Concrete metafield-definitielijst v1 (cross-category)

Aanmaken in **Settings → Custom data → Products**. Namespace `specs`. Product vult alleen relevante velden; theme toont enkel niet-lege. Dekt lichtsnoeren, LED-strips, tuin/solar, plafondlampen en ventilatoren.

**Gedeeld (meeste producten)**
| Metafield | Type | Voorbeeld |
|---|---|---|
| `specs.lichtkleur` | single line text | Warm wit / RGB / Koud wit |
| `specs.kleurtemperatuur` | single line text | 2700K |
| `specs.dimbaar` | boolean | true |
| `specs.afstandsbediening` | boolean | true |
| `specs.geschikt_voor` | single line text | Binnen & buiten |
| `specs.energiebron` | single line text | 230V / Solar / USB |
| `specs.branduren` | single line text | 30.000 |
| `specs.materiaal` | single line text | Kunststof |

**Buiten/outdoor**
| `specs.ip_classificatie` | single line text | IP65 |

**Lichtsnoer / LED-strip**
| `specs.lengte` | single line text | 15 m |
| `specs.aantal_led` | integer | 30 |
| `specs.koppelbaar_tot` | single line text | 150 m |
| `specs.diameter_lamp` | single line text | 4 cm |
| `specs.fitting` | single line text | E12 |

**Plafondlamp / ventilator**
| `specs.diameter` | single line text | 50 cm |
| `specs.fitting` | single line text | E27 |
| `specs.wattage` | single line text | 40W |
| `specs.smart_app` | boolean | true |
| `specs.aantal_standen` | integer | 6 |

**USP-chip selectie per categorie** (welke ~5 boven de vouw als icon-strip):
- Lichtsnoer/strip: `ip_classificatie`, `lengte`, `kleurtemperatuur`, `koppelbaar_tot`, `dimbaar`
- Plafondlamp/ventilator: `diameter`, `fitting`, `dimbaar`, `smart_app`, `afstandsbediening`
- Solar/tuin: `ip_classificatie`, `energiebron`, `branduren`, `afstandsbediening`, `geschikt_voor`

Universeel (hardcoded, geen metafield): gratis verzending & retour, morgen in huis, 2 jaar garantie, veilig betalen.

**Populeren:** Matrixify-export → kolommen `Metafield: specs.<veld> [<type>]` → per familie copy-paste-down → re-import. Begin met de lichtsnoer-familie (grootste omzet, waar Ads landen), rol daarna per categorie uit.
