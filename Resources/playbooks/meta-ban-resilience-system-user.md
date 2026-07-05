---
type: playbook
date: 2026-07-03
project: Goatly
status: active
tags: [meta, business-manager, ban-resilience, infrastructure]
priority: high
---

Setup van een admin system user in de [[business|Goatly]] Business Manager, zodat een ban op het persoonlijke profiel van [[me|Talat]] of [[team|Morra]] nooit meer volledige lockout betekent. Bron: tweet van @adv_ceo (X, jul 2026), n.a.v. adverteerders die met $1M/mnd spend hun profiel kwijtraakten.

> [!important] Wat dit wel en niet dekt
> Een system user overleeft een ban op een persoonlijk profiel (meest voorkomende lockout). Wordt de Business Manager zelf restricted, dan gaat de system user mee. Dit is scenario-1-verzekering, geen onkwetsbaarheid.

## Stappen

1. **Developer account**: developers.facebook.com, inloggen met het FB-profiel dat admin is van de Goatly BM. "Get Started", voorwaarden accepteren.
2. **App aanmaken**: developers.facebook.com/apps, Create App, use case "Other", type "Business", naam "Goatly Ops", koppelen aan de Goatly Business Manager.
3. **System user**: business.facebook.com, Business settings, Users, System users, Add. Naam "goatly-system", rol **Admin**. Vereist mogelijk business verification (KvK-uittreksel, sowieso doen).
4. **Assets toewijzen**: system user, Assign assets, **full control** op alle ad accounts (NL + UK), beide pagina's, pixels/datasets.
5. **Token genereren**: Generate new token, app uit stap 2 kiezen, expiration **Never**, permissions: `ads_management`, `ads_read`, `business_management`, `pages_manage_ads`, `pages_read_engagement`.
   - Gotcha (jul 2026): "No permissions available" in de token-wizard betekent dat de system user geen rol op de app zelf heeft. Fix: Assign assets, categorie Apps, de app selecteren, toggle op Manage app. Daarna opnieuw genereren.
6. **Token opslaan** in password manager. Eenmalig zichtbaar. Wie de token heeft, heeft admin op de hele BM.

## Recovery-gebruik

Bij een profiel-ban: via de Graph API met de token nieuwe mensen aan de BM toevoegen (`POST /{business-id}/business_users`), ads pauzeren/aanpassen, data uitlezen. Claude kan de calls uitvoeren zodra de token aangeleverd wordt.

## Aanvullend (buiten de tweet)

- Minimaal twee menselijke admins in de BM ([[me|Talat]] + [[team|Morra]]), beide met 2FA.
- Business verification afronden: grootste factor in hoe Meta de BM behandelt bij reviews.
