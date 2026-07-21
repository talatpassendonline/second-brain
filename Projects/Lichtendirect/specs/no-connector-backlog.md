---
type: spec
date: 2026-07-21
project: Lichtendirect
status: active
tags: [cro, backlog, theme, no-connector]
---

Werk aan [[Lichtendirect]] dat puur via de theme-repo (GitHub → staging) kan, zonder dat Claude Shopify-admin-toegang heeft. Grens: alles wat theme-code is (Liquid, HTML, CSS, JS) kan nu; per-product data-invoer via metafields en admin-zaken (orders, klanten, mail-notificaties, navigatie-menu, prijzen, app-installs) wachten op de connector-goedkeuring van Murat.

## Grootste hefboom: productpagina (was het startpunt)

- Sticky "In winkelwagen" knop op mobiel. Grote CVR-winst, pure theme-code.
- USP/trust-strip onder de koopknop (bezorging, 2 jaar garantie, CE-getest, retour). Theme-breed, verschijnt op elke PDP zonder per-product data.
- Vertrouwensblok + FAQ-accordion op de PDP (zelfde stijl als de nieuwe contactpagina).
- Duidelijke levertijd/voorraad-tekst, betere aantal- en variant-selector.
- Trustpilot-sterren naast de producttitel.
- Zie ook [[pdp-cro-changelist]] en [[mobiel-pdp-cro-audit]].

## Self-filling PDP alvast klaarzetten

De weergavekant van de metafield-architectuur ([[productdata-metafield-architectuur]]) kan ik nu in de theme bouwen: het specs-blok en USP's-per-product renderen zodra de velden bestaan. Alleen het invullen van de data wacht op de connector. Zo staat alles klaar om in één keer te vullen.

## Homepage

- USP-balk + trust-row, review-sectie, sterkere hero-CTA. Layout is theme-code; alleen collectie-afbeeldingen kiezen is admin.

## Categoriepagina

- Trustpilot-sterren op de product-cards, "op voorraad"-badge, nettere card-hover. Banners zijn al weg, reviewgrid al consistent.

## Site-breed / vertrouwen

- Announcement bar met USP's (gratis verzending, voor 17:00 besteld = morgen in huis).
- Footer met betaalmethode-iconen, USP's en Trustpilot.
- Gratis-verzending-voortgangsbalk in de cart drawer ("nog EUR X tot gratis verzending").

## Techniek / SEO (onzichtbaar, telt wel)

- Structured data: Product-, Breadcrumb- en FAQ-schema (rich results in Google). FAQ-schema kan meteen op de nieuwe contactpagina.
- Snelheid: lazy-load, juiste image-formaten, preloads.
- Alt-teksten en meta-title/description-templates.

## Wacht op de connector

Per-product data vullen (metafields), orders/klanten, mail-notificatie-templates, navigatie-menu-inhoud, prijzen/kortingen, app-installaties.
