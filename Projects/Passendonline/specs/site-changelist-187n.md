---
type: spec
date: 2026-07-21
project: Passendonline
status: proposed
tags: [website, cro, positioning]
---

Changelist voor passendonline.nl, afgeleid uit de teardown van 187n.ai (de site van Leon uit [[leon-187n-brand-building-course-extract]]). Zijn pagina is een necessary-beliefs-funnel in sectievorm; dat is het stelen waard. Zijn proof is grotendeels verzonnen (klantlogo's als GitHub en een "Duolingo-case", live tellers, onverifieerbare testimonials); dat is het niet.

## Wat passendonline.nl al beter doet

- Echte cijfers met bron (GA4 + Shopify attributie) waar 187N nep-tellers draait. Zelfde vondst als bij [[sparsi-teardown]]: concurrenten faken proof, wij hebben echte. Dit is de troef, uitbouwen.
- De €0-garantie (drie lekken of geen rekening) is een hardere risico-omkering dan alles op 187N.
- WhatsApp als CTA is lager in frictie dan "book a call" voor NL MKB.

## Aanpassingen, op volgorde van impact

1. **Kosten-anker: reken het lek voor.** 187N ankert alles tegen "$65.000 per jaar voor een hire". Passendonline ankert nu nergens tegen. Toevoegen: wat kost 1,3% conversie per maand bij [bezoekers] × [orderwaarde], als regel in de hero-buurt of als mini-calculator (past bij de data-positionering). De audit wordt dan gratis tegenover een becijferd maandverlies.
2. **Werkvormen-sectie (pricing-frame zonder prijzen).** Er is nu geen enkel prijs-frame, dus elk gesprek start bij nul. Drie vormen: Audit (gratis, €0-garantie) → Fix-sprint (de drie lekken dichten) → Partnership (maandelijkse iteratie, zoals [[Lichtendirect]] feitelijk al loopt). Per vorm "scope in het gesprek", geankerd aan het maandverlies uit punt 1.
3. **FAQ-sectie, 8-10 vragen.** Ontbreekt volledig. Wat kost het, hoe snel, wat als ik al een bureau heb, wat is een funnel-audit precies, waarom één persoon en geen team, voor welke branches, wat gebeurt er na de audit, wat als er geen drie lekken zijn. Objection-handling plus SEO-voer.
4. **Vijand-sectie met gesourcede cijfers.** 187N gebruikt MIT/Gartner om "waarom de meeste AI-automatisering faalt" te onderbouwen. NL-versie: waarom de meeste MKB-sites niet converteren (gemiddelde e-com conversie met bron, de bureau-keten, template-abonnementen à la Sparsi die een site verkopen in plaats van conversie). Bronnen erbij, [[me|Talat]] beoordeelt de claims.
5. **Vergelijkingstabel: bureau-keten vs één bouwer.** 187N's ownership-vs-rent-tabel vertaald: doorlooptijd, wie je spreekt, wat je betaalt, wat er van jou blijft. Drie rijen, voor/na-kolommen.
6. **Klantquote per case.** De cases hebben cijfers maar geen stem. Eén echte quote met naam per case ophalen (Lichtendirect, Beltechniek). Echte quotes verslaan verzonnen testimonials.
7. **Anti-positioneringsregels als merklijm.** "Eén persoon. Hele stack." bestaat al; aanvullen met één scherpe tweede regel (richting "Wij verkopen geen site. Wij dichten lekken.") en het paar herhalen in hero én footer, zoals 187N met "Operators first. Consultants never." doet.
8. **Mechanisme een naam geven.** De drie-lekken-audit consequent als eigen naam voeren (nav, CTA's, FAQ), zodat het claimbaar wordt in plaats van een generieke "gratis audit".
9. **Eind-CTA-blok herframen.** 187N's beste regel, vertaald en bij ons nog waar ook: "Geen salespitch. Je spreekt direct de bouwer, en die rekent je cijfers door." Eventueel met foto.
10. **Voor/na-tabel per case + mini-case-pagina's.** Conversie, laadtijd, omzet als tabel per case; aparte case-pagina's als SEO-laag.

## Status (21 jul, nacht)

Gebouwd en op preview: punten 1 t/m 5 en 7 t/m 9 (rekensom, werkwijze/werkvormen, FAQ, vergelijkingstabel, naamgeving, CTA-reframe, footer-paar), plus diensten-first hero, case-spotlight in plaats van de nep-live-ticker, mobiel menu en AI & maatwerk. Live-gang wacht op akkoord van [[me|Talat]].

Afgerond in ronde 2 (zelfde nacht): hero.mp4 4,1MB → 612KB + poster (via imageio-ffmpeg, brew zit vast op een tap-trust-prompt voor libsql/sqld die Talat zelf moet beantwoorden), og.png in brand-stijl + twitter-card meta, Vercel Web Analytics-script (toggle in het Vercel-dashboard aanzetten als er geen data komt), e-mail-optie in modal + CTA + hero-iconen (dode Instagram-link vervangen), health-brand-case hernoemd naar supplementenmerk €100K+/maand op aanwijzing van Talat, hero-ticker vervangen door roterende case-spotlight, mobiel hamburger-menu.

Nog open:
- Punt 6: echte klantquote per case ophalen (Lichtendirect, Beltechniek).
- Punt 10: case-pagina's als SEO-laag + sitemap/robots.
- Web Analytics-toggle checken in het Vercel-dashboard na livegang.

## Niet overnemen

- Nep-logo's, nep-tellers, onverifieerbare testimonials. De hele positionering leunt op echte data; één verzonnen cijfer sloopt dat.
- De diepe nav-structuur (Product/Solutions/Resources): overkill voor deze fase, de one-pager-flow werkt.
