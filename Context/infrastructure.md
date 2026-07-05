---
type: context
status: active
tags: [infrastructure, stack, tools]
updated: 2026-06-17
---

# Infrastructure, stack & workflows

## Stack by function

| Function | Tool | Notes |
|---|---|---|
| Storefront | **Shopify** | Customized **Dawn theme 15.4.1**. |
| Bundles / offer logic | **Kaching Bundles** | Runs 1-zak / 2+1 / 3+2 + e-book unlocks on PDP. |
| Paid ads | **Meta (CBO)** | Only channel. No TikTok, Google, Pinterest. |
| Ad tracking | **WeTracked** | **Lags. Shopify always shows higher revenue.** Every reported ROAS is a floor. Never kill on reported ROAS, reconcile against Shopify first. |
| Email | **Klaviyo** | Not yet live with flows, greenfield. First flow to build = post-purchase / review (see [[strategy]] priority #4). |
| AI image | (general AI image tools, full list TBD) | For ad creative. |
| AI video | Sora / Higgsfield / Veo (used as fits) | Use anti-slop rules. |
| AI voiceover | **ElevenLabs** | VSL VO at 1.2x speed. |
| Customer support | **Claude** | Fully automated, no human in loop. |
| Advertorial / landing | Built natively on Shopify (no Replo / Shogun) | Live URL: https://trygoatly.nl/pages/adv2-nieuws-botten |

## Where each thing lives (source of truth)

| Workflow | Source of truth | Notes |
|---|---|---|
| Brand / mechanism / offer / compliance | `/Goatly_kennis/claude.md` | Single canon for ad-copy work. |
| Performance data | `/Goatly_kennis/performance_data.md` | Replace weekly when new Meta export lands. |
| Daily ops + loops + ideas | **This vault, `Daily/YYYY-MM-DD.md`** | New as of 2026-06-17. |
| Decisions + their reasoning | **This vault, `Intelligence/decisions/`** or `Projects/{name}/` | If a decision was made in chat (with Morra or with Claude), log it here. |
| Ad creatives (real exports) | `/Goatly_kennis/Advertenties/` | Production-shipped creatives. |
| Advertorials | `/Goatly_kennis/advertorials/` | Long-form pages. |
| VSL scripts | `/Goatly_kennis/vsl/scripts/` | New ground, being built. |
| Email flows | `/Goatly_kennis/email/flows/` | Greenfield, being built. |
| Ad tracking SOP + kill rules | `/Goatly_kennis/tracking/TRACKER_SOP.md` | Daily routine + decision logic. |
| Frameworks / playbooks | `/Goatly_kennis/playbooks/` | Distilled methods (Evolve, Fernando, anti-slop). |
| Prompt library | `/Goatly_kennis/prompts/` | Avatar → mechanism prompt chain + outputs. |
| Reference (raw) | `/Goatly_kennis/reference/` | Doesn't auto-update canon. |
| Wiki (synthesis) | `/Goatly_kennis/wiki/` | Cross-linked second-brain layer for Goatly-specific. |

> Note: The Goatly deep-knowledge vault lives at `/Users/talat/Desktop/Goatly_kennis/`. This Second Brain vault is the operator-level wrap (identity, daily loops, strategy, projects). For deep ad-copy work, the Goatly_kennis canon wins on content.

## The drain, workflows to automate

From [[me]]: the **#1 drain isn't a specific workflow, it's idea-vanishing**. System response:

| When this happens | I currently do | What I want |
|---|---|---|
| An idea pops up between shifts | Note it somewhere, sometimes discuss with Claude, sometimes start work | Idea lands in `Daily/YYYY-MM-DD.md` as a loop. Claude proactively reminds + suggests routing. |
| I have to leave mid-task | Task vanishes | Loop persists in the day note → weekly review forces a do / park / kill decision. |
| Decision sits unmade | It evaporates | Decision logged in `Intelligence/decisions/` with the trade-off. Reviewable. |
| Customer support reply | (already automated with Claude) | Stays automated. |

Specific workflows that are good automation candidates once the loop-system is steady:

- **Daily ad-tracking**, load Meta export → flag 3-day winners / 7-day kills.
- **Hook-test setup**, drafting batches of hooks against the BOF cluster.
- **Advertorial v3 native look**, open task.
- **Batch / inventory status check**, for honest scarcity timing.
- **Meta ↔ Shopify reconciliation**, calculate correction factor so reported ROAS isn't always under-read.

## Hardware / context

- macOS, Obsidian as the vault reader.
- Talat works a 5-shift factory rotation. Assume he won't always have laptop time. Mobile-friendly notes win.

## Open items

- AI image / video tool list, confirm exact rotation of Sora vs. Higgsfield vs. Veo + criteria.
- Klaviyo: existing list health, suppression, current automations (if any). Greenfield assumption holds until verified.
- Whether order bumps + subscription are technically supported in current Shopify + Kaching setup (relevant to [[strategy]] AOV priorities 2 + 3).

## Cross-links

- [[me]], the idea-vanishing drain.
- [[strategy]], priorities the stack should serve.
- [[team]], Claude as the automation teammate.
