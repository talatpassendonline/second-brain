---
type: task-list
owner: Vault-Operator
status: active
tags: [operator, tasks, backlog]
date: 2026-06-17
---

# Vault Operator Tasks

Rolling backlog for the [[Goatly]] Vault Operator. Open loops surfaced from prior dailies, strategy priorities without a `Projects/` home, and housekeeping items that exceed a single run's fix budget land here. One run = one delta; this file persists what didn't fit.

Last run: 2026-06-16T23:26:21Z

> [!info] Scope
> Sources: `Daily/*.md`, `Context/strategy.md`, and the whole vault for housekeeping. Protected files (any `CLAUDE.md`, `Context/brand.md`, `Context/business.md`, `Context/strategy.md`) cannot be auto-fixed. [[Talat]] handles those by hand when ready.

## Open Loops

None. Only `Daily/2026-06-17.md` exists in `Daily/` and its 4 checkboxes are dated today (still fresh, under the 48h surface threshold).

## Strategy Gaps

`Context/strategy.md` lists 4 active priorities for Q2/Q3 2026. None have a matching `Projects/` folder yet. Per the strategy doc, this is intentional: [[Talat]] wants to discuss folder scaffolding before structuring. Surfaced here so they do not vanish.

- Priority "VSL learning + production": no `Projects/VSL-Launch/` folder. Parked pending scaffolding decision.
- Priority "AOV optimization (€67,22 → higher)": no `Projects/AOV-Optimization/` folder. Parked pending scaffolding decision.
- Priority "Second brain setup (this vault)": running in-place; no `Projects/` folder needed by design.
- Priority "Post-purchase review flow": no `Projects/Email-Review-Flow/` folder. Parked pending scaffolding decision.

## Housekeeping Queue

Em-dash sweep is the highest-volume long-tail item. Budget cap is 5 fixes per run; the rest queue here. Oldest unhandled at top so they bubble up next run.

Auto-fixable (in priority order):
- `Context/infrastructure.md`: 19 em-dashes. Strip per CLAUDE.md rule 14.
- `Context/icp.md`: 8 em-dashes. Strip per rule 14.
- `Context/pain-points.md`: 7 em-dashes. Some live inside quoted avatar voice from [[Talat]]; review case by case rather than blind-strip.
- `Context/team.md`: 4 em-dashes. Strip per rule 14.
- `Skills/newsletter-writer/strategy.md`: 1 em-dash. Strip.
- `Skills/newsletter-writer/references/example-edition.md`: 1 em-dash. Strip.
- `Skills/linkedin-writer/notes.md`: 1 em-dash. Strip.

Cannot auto-fix (protected files, flagged for [[Talat]]):
- `Context/strategy.md`: 22 em-dashes. Protected.
- `Context/business.md`: 13 em-dashes. Protected.
- `Context/brand.md`: 11 em-dashes. Protected.
- `CLAUDE.md` (root): 2 em-dashes. Protected.

Other lint debt to rotate through future runs:
- Cross-link sections across `Context/*.md` use bulleted lists of `[[link]]: description`. CLAUDE.md anti-pattern says weave wikilinks into sentences, not as bullet lists. Vault-wide convention currently; defer until [[Talat]] decides whether to keep the convention or restructure.
- `Context/me.md` has 0 callouts; CLAUDE.md rule 5 wants 1 to 3 per substantial doc. Flag without auto-fix (callout placement requires judgement).
- All `Daily/*.md` files: confirm `status:` and 2+ `tags:` per CLAUDE.md frontmatter rule once more dailies exist.

## Completed

- [x] ✅ 2026-06-17: Stripped 5 em-dashes from `Context/me.md` (1 parenthetical + 4 cross-link bullets).
- [x] ✅ 2026-06-17: Bootstrapped this file. First operator run.

<span style="background-color:#2d5238; color:#f5efe3; padding:2px 8px; border-radius:3px; font-size:0.85em;">🤖 Goatly Vault Operator . last edited: 2026-06-16T23:26:21Z</span>
