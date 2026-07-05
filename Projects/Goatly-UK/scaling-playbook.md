---
type: reference
date: 2026-06-28
project: Goatly-UK
status: active
tags: [goatly, uk, scaling, cashflow, ads, meta]
---

## Scaling framework

Bron: [[Morra]] zijn schaalstrategie, aangepast aan [[business|Goatly]] UK cashflow.

### Regels

1. **Trigger:** 2 opeenvolgende dagen met gemiddeld 20%+ winstmarge
2. **Fase 1 (verdubbelen):** €100 → €200 → €400
3. **Fase 2 (+€200 stappen):** €400 → €600 → €800 → €1000
4. **Elke stap:** pas verhogen na 2 dagen 20%+ marge op het huidige niveau

### Cashflow constraints

- Stripe payout delay: 3 werkdagen (next day settlement niet gelukt per 2026-06-28)
- Elke verhoging kost 3x het verschil aan overbrugging
- Break-even ROAS UK: 1.51

| Stap | Spend/dag | Overbrugging (3d delay) | Bank nodig (incl. NL/BE €200/d) |
|---|---|---|---|
| €100 → €200 | +€100 | €300 | €2,000 |
| €200 → €400 | +€200 | €600 | €3,000 |
| €400 → €600 | +€200 | €600 | €4,000 |
| €600 → €800 | +€200 | €600 | €5,000 |
| €800 → €1000 | +€200 | €600 | €6,000 |

### Harde stop

- **Pauzeer bij €400/dag** als bank onder €4,000 zit
- Wacht tot buffer opbouwt door winst, schaal dan verder
- Als ROAS onder 1.51 zakt: terug naar vorige stap, 3 dagen data verzamelen

### Wat dit verandert met next day settlement

Met next day payouts daalt de overbrugging per stap van 3x naar 1x het verschil. Dan is het volledige framework uitvoerbaar zonder pauze. Blijf proberen bij Stripe.

### Startpositie (2026-06-28)

- Bank: €3,889
- Meta saldo: €1,628
- NL/BE spend: €200/dag (ROAS ~1.47, moet naar 1.75)
- UK spend: €100/dag (ROAS 0.75, dag 1 data)
- Stripe incoming: €2,453 (29 jun t/m 2 jul)
