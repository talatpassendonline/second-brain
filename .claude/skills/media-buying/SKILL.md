---
name: media-buying
description: De operationele Meta-media-buying runbook. Eén broad CBO-campagne als arena, 3:2:2 opzetten, Marksman-dan-Sniper testen, schalen met break-even plus 1, attributie via Triple Whale, en overspend-bescherming. Gebruik bij het opzetten of schalen van Meta-ads voor Goatly of een Passendonline-klant. Bron: Evolve (Spencer Pawliw) + EAM 2025 (Nick Theriot).
---

# Media Buying

Doctrine uit [[05-media-buying-and-testing]]: draai één broad Acquisition CBO als arena, geen aparte test-, scale-, prospecting- of retargeting-campagnes en geen audiences. Krijgt een ad spend, dan heb je negen van de tien keer een winner. Krijgt hij geen spend, dan is het een slechte ad. De structuur bespaart geld door je geen spend te laten verspillen aan losers. Dit is de operationele laag onder [[01-ad-lifecycle-system]].

## Wanneer

- Een Meta-account opzetten of herstructureren voor [[business|Goatly]] of een [[passendonline|Passendonline]]-klant.
- Een scale-beslissing, een overspend-alarm of een attributie-vraag.

## Regels

1. **3:2:2** per ad set: 3 creatives, 2 body copies, 2 headlines, handmatige ads (geen dynamic creative). Boven 2.000 per dag mag 3:2:2:2 (twee landingspagina's per set); daaronder niet, want zes ads per set verdunt de spend te veel voor Meta.
2. **Marksman eerst, dan Sniper.** Marksman: meerdere angles naast elkaar om richting te vinden. Sniper: één winnende angle, drie variations diep. Shotgun (spray-and-pray) alleen voor content-seeding met creators.
3. **Scaling.** Scale 20% flat wanneer ROAS consistent circa 50% boven target zit (consistent, niet één dag). Bij grote budgetten 15, 10 of 5%. Scaling-target = break-even ROAS + 1 als marge-buffer.
4. **Attributie.** Click-based is goed, view-through slecht. 7-day click als default, Triple Whale voor blended en MER. Ad-account-data is post-iOS14 vertekend, Shopify is de waarheid (zie [[unit-economics]]).
5. **Overspend-bescherming.** Zet een max daily budget (de CBO auto-kill-regel is door Meta geblokkeerd). Kill een ad die 3x de ad-set-CPA raakt, en een nieuwe ad na 24 tot 48 uur zonder resultaat. Twee must-have automations: 5x-spend-alert en URL-mismatch.
6. **Naming.** Gebruik de 3-level naming templates plus batch-nummers op ad-set- en ad-niveau, anders is je data straks onbruikbaar.

## Procedure

1. Verifieer Business Manager. Bouw de kolommen-preset plus de custom metrics (AOV, CVR, video hook, video hold).
2. Bereken de break-even ROAS (formules in [[07-ecommerce-finance-and-supply-chain]]); zet scaling-target = break-even + 1.
3. Lanceer 3:2:2 in de broad CBO naast bestaande campagnes; purge oude campagnes niet, laat ze uitdoven. Label met batch-nummer, status "learning".
4. Wacht circa 7 dagen. Wie spend trekt is een winner; geen spend is een loser richting de zombie/graveyard-campagne.
5. Scale winners 20% flat; duplicate breakthroughs naar de ABO scaling-campagne.
6. Verwerk elke batch via [[ad-learnings]] voordat je een concept op "done" zet.

## Seizoen en promo

Voor promo- en Q4-structuur (broad plus warm-60 plus hot-90, surge scaling, BFCM-curve) zie [[13-calls-q4-email-and-mindset]]. Kill/keep en scale-beslissingen zijn [[me|Talat]]'s call; deze skill levert de structuur en de latten.
