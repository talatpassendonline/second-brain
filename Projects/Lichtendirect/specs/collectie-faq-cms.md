---
type: spec
date: 2026-07-21
project: Lichtendirect
status: active
tags: [cro, faq, metafields, seo, theme]
---

Per-categorie FAQ voor [[Lichtendirect]], CMS-gestuurd en zelf-vullend, op de positie onderaan de collectiepagina (na producten + SEO-tekst). Aanleiding: Murat/Talat wil dat elke categorie een eigen FAQ toont die je in het CMS vult, i.p.v. de huidige rommel (hardcoded per template, inconsistente secties, en een default-template die de lichtsnoeren-FAQ op elke categorie toont). Zie ook [[no-connector-backlog]] en [[productdata-metafield-architectuur]].

## Wat er staat (theme, af)

Sectie `sections/lichtendirect-collection-faq.liquid` (PR #17):

- Leest de FAQ per categorie uit een collectie-metafield (standaard `custom.faq`, lijst van metaobjecten met velden `question` + `answer`).
- Valt terug op handmatige FAQ-blokken in de sectie zolang de CMS-data er nog niet is.
- Empty-safe: geen metafield en geen blokken, dan verschijnt de sectie niet.
- Genereert automatisch `FAQPage`-schema (rich results in Google), altijd in sync met de getoonde vragen. Vervangt losse hardcoded JSON-LD.
- Branded accordeon, mobiel geoptimaliseerd.

Voorbeeld live op staging: `collection.lichtsnoeren.json`, oude collapsible-content vervangen door de nieuwe sectie met dezelfde 5 vragen, zelfde plek.

## CMS-invulstappen (Shopify admin, eenmalig)

Kan pas zodra de connector is goedgekeurd, of Murat/Talat doet het handmatig. Geen app nodig.

1. Settings, Custom data, Metaobjects, definitie toevoegen: "FAQ item". Velden: `question` (single line text) en `answer` (rich text). Storefront-toegang aanzetten.
2. Content, Metaobjects, FAQ item: per vraag een entry aanmaken.
3. Settings, Custom data, Collections, definitie toevoegen: naam "FAQ", key `custom.faq`, type "List of metaobjects" naar FAQ item. Storefront-toegang aanzetten.
4. Per collectie, Metafields, FAQ: de juiste FAQ-items koppelen.
5. Sectie toont ze automatisch onderaan. Daarna kunnen de handmatige blokken weg.

Let op: de metafield-datapad is blind gebouwd (geen admin-toegang om te testen). Eén verificatie-pass zodra het veld bestaat en gevuld is.

## Openstaande follow-ups

- Uitrol naar alle categorieën: per collectie-template de bestaande FAQ naar de nieuwe sectie migreren, en de sectie in de default `collection.json` zetten.
- Default-template opschonen: `collection.json` toont nu de lichtsnoeren-FAQ + hardcoded JSON-LD op elke categorie die de default gebruikt. Dat is een bug.
