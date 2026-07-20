---
name: avatar-sim
description: Simuleer een klant-avatar op basis van bestaande research en voer er gesprekken mee voor angle-tests, objection-mining en copy-feedback. Gebruik als echte klantgesprekken niet beschikbaar zijn of als aanvulling daarop. Bron: Mark (Build Brands), de AI-multiplier.
---

# Avatar Sim

Doctrine uit [[mark-buildbrands-8-years-marketing-advice-transcript]]: als je klanten niet kunt bellen, bouw ze. Voed een AI met al je research en praat ermee als klant. Per koop-angle een aparte avatar, want iemand die om reden A kocht is een ander gesprek dan iemand die om reden B kocht.

## Grens

Synthetisch vervangt nooit echt. Output van deze skill is hypothese-generatie, geen bewijs. Alles wat de avatar "zegt" moet herleidbaar zijn tot de gevoede research; als de avatar iets beweert dat nergens in de bronnen staat, markeer het als extrapolatie.

## Procedure

1. **Laad de research.** Voor [[Goatly]]: kennisbank `prompts/avatar_p4_de_versterker_research.md`, `claude.md` (canon, §3 voice), `brand/angle_bank.md`, plus recente VOC-extracten. Voor andere merken: de output van de `voc-research` skill.
2. **Bouw de avatar-kaart** vóór het gesprek: naam, leeftijd, awareness-stage, koop-angle (of niet-koop-reden), emotionele grondtoon, letterlijke taalvoorbeelden uit de research, en wat ze NIET weet (geen merkkennis die de echte klant ook niet heeft).
3. **Blijf in karakter.** De avatar praat in haar eigen register (klanttaal, geen marketingtaal), twijfelt, dwaalt af, en is niet behulpzaam. Ze wil niet overtuigd worden; ze wil haar probleem kwijt.
4. **Gesprekstypes:**
   - **Objection-mining**: leg een angle, hook of advertorial-sectie voor en laat haar reageren; noteer waar ze afhaakt en welk woord wantrouwen triggert.
   - **Dagboek-modus**: laat haar vertellen over een gewone dag met het probleem; oogst concrete scènes en formuleringen voor copy.
   - **Vergelijkings-modus**: leg ons aanbod naast een competitor ([[Rynse]]) en laat haar hardop kiezen.
5. **Meerdere avatars per vraag.** Minimaal de hoofd-avatar plus één skeptische niet-koper; wat beiden zeggen weegt zwaarder dan wat één zegt.

## Output

Gespreksinzichten gestructureerd terugschrijven: nieuwe objections, taalvondsten en angle-signalen naar de kennisbank (Goatly) of `Resources/research/` (overig), met de markering synthetisch erbij. Hook-waardige zinnen doorzetten naar de `hook-punch`-bank.
