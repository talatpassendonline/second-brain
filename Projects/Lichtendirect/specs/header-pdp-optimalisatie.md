---
type: spec
date: 2026-06-18
project: Lichtendirect
client: Lichtendirect
status: in-progress
tags: [shopify, woodstock, cro, frontend, header, productpagina]
priority: high
---

Werkorder voor de website-optimalisaties die [[Anna Veerman]] van [[Dunion]] aanleverde voor [[Lichtendirect]], uit te voeren door [[Passendonline]]. Twee blokken: header/menu en productpagina.

> [!info] Technische basis (live geverifieerd op 2026-06-18)
> - Platform: **Shopify**, myshopify-domein `lichtendirect.myshopify.com`
> - Theme: **Woodstock** v1.6.1 (premium, geen Dawn → eigen class-namen en sections)
> - Reviews shopbreed: **Trustpilot** (officiële app) + los maatwerk `#ld-trustpilot-widget` (statisch blok, hardcoded 4.8, lager op homepage)
> - Reviews productniveau: **Judge.me**
> - Betaalmethodes in checkout: iDEAL, Klarna, Mastercard, Visa, PayPal, Bancontact
> - Onderhoudspatroon van de store: **Custom Liquid secties + gerichte CSS**, niet chirurgie in Woodstock-kernbestanden. Die lijn houden we aan.

> [!warning] Blocker
> Pushen kan pas als de Shopify-connector aan `lichtendirect.myshopify.com` gekoppeld is. Talat wacht op toegang van de store-eigenaar. Tot die tijd: code staat klaar, niets is live.

## Geverifieerde selectors

**Header (Woodstock):**
- `.header-wrapper` (container, o.a. `header-wrapper--border-bottom toggle-nav`)
- `.header.header--top-left` (flex-rij)
- `.header__heading` → logo · `.header__search` → zoekbalk · `.header__icons` → account/cart
- Reviewsbalk onder menu = Custom Liquid sectie in `header-group`, wrapper-id bevat `custom_liquid_DqqcT8`

**Productpagina (Woodstock):**
- Volgorde: `.product__title` (h1) → `.instock-pulse` → `.price__container` → `.product__tax` → meerdere `.product__accordion.accordion`
- "Op werkdagen voor 17:00 uur besteld, morgen in huis" staat nu als **accordion-titel** (`h2.accordion__title`), niet als badge
- Judge.me: `.jdgm-widget.jdgm-preview-badge` (productreviews)

---

## Blok 1: Header / menu

| # | Wens van Anna | Aanpak | Status |
|---|---|---|---|
| 1 | Trustpilot-score tussen logo en zoekbalk | Eigen review-blok in de header | ✅ code klaar (1) |
| 2 | Sterren + aantal gestapeld, kort blok | CSS in hetzelfde blok | ✅ code klaar (1) |
| 3 | Onderste reviewsbalk weghalen | Oude `custom_liquid_DqqcT8` sectie verbergen/verwijderen | ✅ code klaar (1) |
| 4 | Menu sticky bij scrollen (desktop) | Woodstock native sticky-toggle, anders CSS | 🔌 reconnect |
| 5 | Mobiel: menu sticky, reviews NIET sticky | CSS media-query | ✅ code klaar (1) |

### (1) Eén Custom Liquid sectie: lost wens 1, 2, 3 en 5 op

Toe te voegen via **Customizer → header-group → Add section → Custom Liquid** (of als snippet die in `sections/header.liquid` wordt gerenderd op reconnect voor een flash-vrije versie). Self-contained, raakt geen kernbestanden:

```liquid
{%- comment -%} LD Header Reviews — Trustpilot tussen logo en zoekbalk {%- endcomment -%}
<div id="ld-header-reviews" class="ld-header-reviews" hidden>
  <a href="https://nl.trustpilot.com/review/lichtendirect.nl"
     target="_blank" rel="noopener" class="ld-hr-link" aria-label="4,8 van 5 sterren, 400+ reviews op Trustpilot">
    <span class="ld-hr-stars" aria-hidden="true">
      {%- assign s = '★★★★★' -%}
      <span class="ld-hr-svgstars">
        {%- for i in (1..5) -%}
          <svg viewBox="0 0 20 20" width="15" height="15"><polygon fill="#00B67A"
            points="10,1 12.9,7.4 20,8.3 14.7,12.8 16.2,19.7 10,16.2 3.8,19.7 5.3,12.8 0,8.3 7.1,7.4"/></svg>
        {%- endfor -%}
      </span>
    </span>
    <span class="ld-hr-meta">
      <strong class="ld-hr-score">4,8/5</strong>
      <span class="ld-hr-count">400+ reviews</span>
    </span>
  </a>
</div>

<style>
  .ld-header-reviews{display:flex;align-items:center;line-height:1.05}
  .ld-hr-link{display:flex;align-items:center;gap:8px;text-decoration:none;color:inherit}
  .ld-hr-stars{display:flex}
  .ld-hr-svgstars{display:flex;gap:1px}
  .ld-hr-meta{display:flex;flex-direction:column;justify-content:center}
  .ld-hr-score{font-weight:700;font-size:14px;line-height:1.1}
  .ld-hr-count{font-size:11px;opacity:.7;line-height:1.1}
  /* mobiel: niet in de sticky header tonen, neemt te veel ruimte */
  @media (max-width:989px){ .ld-header-reviews{display:none} }
  /* oude reviewsbalk onder het menu verbergen */
  [id*="custom_liquid_DqqcT8"]{display:none !important}
</style>

<script>
  (function(){
    function place(){
      var block=document.getElementById('ld-header-reviews');
      if(!block) return;
      var search=document.querySelector('.header__search');
      var logo=document.querySelector('.header__heading');
      var target=search||logo;
      if(target&&target.parentNode){
        target.parentNode.insertBefore(block,search||logo.nextSibling);
        block.hidden=false;
      }
    }
    if(document.readyState!=='loading')place();
    else document.addEventListener('DOMContentLoaded',place);
  })();
</script>
```

> [!note] Flash-vrije variant op reconnect
> De JS verplaatst het blok na load (kleine flash mogelijk). Zodra ik de theme kan lezen, zet ik dit blok direct in `sections/header.liquid` tussen `.header__heading` en `.header__search` en verwijder ik de oude `custom_liquid_DqqcT8` sectie netjes uit `header-group.json`. Dan is JS overbodig.

### (4) Sticky menu: op reconnect
Woodstock heeft vrijwel zeker een native sticky-header-instelling (Customizer → Header). Eerste keuze: die aanzetten. Fallback-CSS (exacte header-section-id ophalen op reconnect):
```css
@media (min-width:990px){
  #shopify-section-sections--XXXXXXXX__header{position:sticky;top:0;z-index:60}
}
```

---

## Blok 2: Productpagina

| # | Wens van Anna | Aanpak | Status |
|---|---|---|---|
| 1 | Productreviews direct onder titel | Judge.me preview-badge onder `.product__title` | 🔌 reconnect |
| 2 | "Voor 17:00 besteld, morgen in huis" opvallender | USP uit accordion tillen → gekleurde badge | 🔌 reconnect |
| 3 | Betaalmethodes tonen | Custom Liquid blok met SVG-iconen in buy-box | ✅ code klaar (2) |
| 4 | Totaal-reviewscore Lichtendirect tonen | Trustpilot/Judge.me shop-rating bij titel | 🔌 reconnect |
| 5 | Omschrijving lager + uitklapbaar | Bestaande `product__accordion` benutten | 🔌 reconnect |
| 6 | Ruimte voor productvideo's | Video in Woodstock media-gallery (content) | 🔌 content-taak |

Referentie van Anna: vulpesgoods.com productpagina.

### (2) Betaalmethodes-blok: klaar
Self-contained Custom Liquid blok, te plaatsen onder de add-to-cart knop:

```liquid
{%- comment -%} LD betaalmethodes onder de koopknop {%- endcomment -%}
<div class="ld-pay" role="img" aria-label="Veilig betalen met iDEAL, Klarna, Mastercard, Visa, PayPal, Bancontact">
  <span class="ld-pay-label">Veilig betalen met</span>
  <span class="ld-pay-icons">
    {%- assign methods = 'ideal,klarna,mastercard,visa,paypal,bancontact' | split: ',' -%}
    {%- for m in methods -%}
      <img src="https://cdn.shopify.com/shopifycloud/checkout-web/assets/{{ m }}.svg"
           alt="{{ m }}" width="38" height="24" loading="lazy"
           onerror="this.style.display='none'">
    {%- endfor -%}
  </span>
</div>
<style>
  .ld-pay{display:flex;flex-direction:column;gap:6px;margin:14px 0}
  .ld-pay-label{font-size:12px;opacity:.7}
  .ld-pay-icons{display:flex;flex-wrap:wrap;gap:6px;align-items:center}
  .ld-pay-icons img{height:24px;width:auto;border-radius:4px}
</style>
```
> [!note] Op reconnect verifieer ik de exacte icon-CDN-paden; als die niet bestaan val ik terug op lokaal geüploade SVG-assets of de Shopify payment-icons snippet.

### Reconnect-items (blok 2): kort
- **Reviews onder titel:** Judge.me preview-badge snippet direct na `.product__title` plaatsen (of via Judge.me badge-placement instelling).
- **Bezorg-USP opvallender:** de regel "voor 17:00 besteld, morgen in huis" uit de accordion halen en als gekleurde badge (merkkleur/groen) boven de koopknop zetten.
- **Totaal-reviewscore:** kleine Trustpilot/Judge.me shop-rating bij de titel.
- **Uitklapbare omschrijving:** Woodstock heeft al `product__accordion`; omschrijving daarin onderbrengen i.p.v. volledig uitgeklapt.
- **Productvideo:** ruimte zit al in de media-gallery; dit is vooral een content-taak (video's uploaden per product).

---

## Volgende stap
Zodra de connector aan Lichtendirect hangt: store bevestigen → `sections/header.liquid`, `header-group.json` en het product-template lezen → reconnect-items afmaken → alles per wijziging pushen en live checken. Daarna terugkoppeling richting [[Anna Veerman]].
