---
type: project
date: 2026-06-18
project: Lichtendirect
client: Lichtendirect
status: active
tags: [client, shopify, cro, passendonline]
priority: high
---

Clientproject van [[Passendonline]]: website-optimalisaties voor [[Lichtendirect]] (Shopify, Woodstock-theme). Aangestuurd vanuit adviezen van [[Anna Veerman]] ([[Dunion]] Online Marketing).

## Status
CRO-ronde header + productpagina. Code staat klaar, wacht op Shopify-connectortoegang van de store-eigenaar voordat er gepusht kan worden.

> [!note] Beslissing 2026-07-13
> PDP-audit + datamodel + ingevulde voorbeeld-CSV zijn af ([[mobiel-pdp-cro-audit]], [[productdata-metafield-architectuur]], `lichtsnoeren-metafields-matrixify.csv`). Handmatig invullen is te veel werk voor Talat, dus we wachten tot de Shopify-toegang er is en Claude het hele blok (metafields aanmaken, data trekken, importeren, snippets) in één keer doet. Enige resterende actie: **store-eigenaar porren om connector-toegang goed te keuren** (staat al open sinds 18 juni). Rebuild is van tafel: cijfers tonen gezonde, snelle, groeiende store (CVR 3,09% +15%, omzet +71%, Core Web Vitals geslaagd).

## Werk
- [[header-pdp-optimalisatie]]: werkorder + kant-en-klare code voor sticky menu, Trustpilot in de header en productpagina-verbeteringen.
- [[mobiel-pdp-cro-audit]]: live mobiele audit (2026-07-13) van de lichtsnoer-PDP. Legt bloot waarom mobiel "leeg" voelt en geeft de hoogste CVR-hefbomen (verstopte USP's, negatieve review vooraan, lege witruimtes).
- [[productdata-metafield-architectuur]]: datamodel waarmee elke PDP zichzelf vult. Metafields (specs) + metaobjects (content-blokken) + universele strip. Datalaag start onafhankelijk van de theme-connector.
- [[pdp-cro-changelist]]: levende checklist van alles wat we gaan aanpassen. Talat breidt deze uit.
- Klantversie verbeterplan (afvinkbaar): `website-verbeterplan-artifact.html`, gepubliceerd als Artifact op https://claude.ai/code/artifact/94da7c6a-6d7c-4848-a885-b4c9f989f477 (gedeeld met Murat via WhatsApp, 15 jul 2026).

## Next steps
1. Connector koppelen aan `lichtendirect.myshopify.com` (wacht op eigenaar).
2. Theme-bestanden lezen, reconnect-items afmaken, per wijziging pushen + live checken.
3. Terugkoppeling naar [[Anna Veerman]].

## Context
- Theme: Woodstock v1.6.1 · Reviews: Trustpilot (shop) + Judge.me (product) · Betaal: iDEAL/Klarna/Mastercard/Visa/PayPal/Bancontact.
