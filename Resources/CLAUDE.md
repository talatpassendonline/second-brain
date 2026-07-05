This folder is the library for reusable content: frameworks, templates, prompts, reference material, and tools documentation.

## Structure

| Subfolder | What goes here |
|---|---|
| `prompts/` | Saved prompts for recurring tasks (dtc-operator-persona, native-ad-copy-session-starter) |
| `ad-copy/` | Ad-copy frameworks en leesregels (depth-not-area) |
| `playbooks/` | Operationele playbooks (meta-ban-resilience) |
| `research/` | Ebook + podcast drop zones met extracts en INDEXen (zie folder CLAUDE.md) |
| `voices/` | Brand voice persona pages (Nadine Hermans, Goatly Nederland, Gezond Ouder Worden) |
| `Finance/` | Financiele spreadsheets (xlsx) |
| `Operator/` | Vault Operator agent state: `operator-prompt.md` (the spec), `Tasks.md` (rolling backlog), `Daily/{date}-daily.md` (per-run reports). Wired to the `goatly-vault-operator-daily` scheduled task. |

Nieuwe categorieen (frameworks/, templates/, swipe/, archive/) alleen aanmaken bij eerste echte drop.

## Rules

- When the user shares reusable content (prompts, frameworks, templates), save it here with a descriptive filename.
- Organize with light nesting. Use the existing subfolders above; create new ones only when there's clear category warrant.
- Use `[[wikilinks]]` to reference resources from project notes or daily notes.
- Don't duplicate content that already lives in a project folder. Link to it instead.
