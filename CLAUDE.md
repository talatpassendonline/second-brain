---
os-mode: professional
---

# Personal OS

Personal AI assistant. Vault = Obsidian knowledge base AND operating system. All state lives in markdown files you read, write, and maintain.

## Session Startup

On first response:
1. Silently read the latest `Daily/` file for recent context.
2. Silently read `Context/me.md` for identity.

Never announce loading. Read, absorb, respond.

## Knowledge Routing

Every piece of info has a home. No catch-all.

| Type | Route to |
|------|----------|
| User preferences, style, habits | `Context/me.md` |
| Strategy and goals | `Context/strategy.md` |
| Business / company context | `Context/business.md` |
| Services, products, revenue lines | `Context/services.md` |
| ICP / customer profile | `Context/icp.md` |
| Customer pain points | `Context/pain-points.md` |
| Tool stack, integrations | `Context/infrastructure.md` |
| Brand, voice, tone | `Context/brand.md` |
| Team / collaborators | `Context/team.md` |
| Project info | `Projects/{name}/` (see `Projects/CLAUDE.md`) |
| Meetings, competitors, market, decisions | `Intelligence/` (see `Intelligence/CLAUDE.md`) |
| Reusable content (prompts, frameworks, templates) | `Resources/` (see `Resources/CLAUDE.md`) |
| Ebook PDFs + extracted research | `Resources/research/ebooks/` (drop PDFs, see folder `CLAUDE.md` for verwerk-recipe) |
| Podcast audio / transcripts + extracts | `Resources/research/podcasts/` (drop `.mp3`/`.txt`/`.srt`, see folder `CLAUDE.md`) |
| Articles, blog posts longreads | `Resources/research/articles/` (create on first drop) |
| Brand voice persona pages | `Resources/voices/{Name}.md` |
| Competitor profiles | `Intelligence/competitors/{name}.md` |
| Skill-specific references | `Skills/{skill-name}/` (see `Skills/CLAUDE.md`) |
| Daily journal | `Daily/YYYY-MM-DD.md` |
| Rules for assistant behavior | Root `CLAUDE.md` (Rules section) |

For specifics, read that folder's `CLAUDE.md`.

## External Knowledge Bases

This vault is the **operator layer**: identity, daily loops, strategy, projects, dagelijkse housekeeping. For **deep [[business|Goatly]] werk** (ad copy, VSL, brand voice canon, performance data, avatar research, advertorials, email flows) the canonical source is a sister vault on this same machine.

**Goatly kennisbank** at `/Users/talat/Desktop/Goatly_kennis/`. In de vault-root staat de symlink `Goatly-Knowledge/` die daarheen wijst: schrijf ernaartoe alsof het een lokale folder is (Obsidian indexeert hem mee; `find` volgt hem niet).

Read it when the task is:

| Task | Read from `/Goatly_kennis/` |
|---|---|
| Ad copy draft, hook, advertorial, BOF | `claude.md` (canon) + `prompts/AD_COPY_SOP.md` + `brand/angle_bank.md` |
| VSL script, structure, voice-over | `vsl/VSL_SOP.md` + `vsl/scripts/` + `playbooks/` (Fernando) |
| Avatar deep dive, voice-of-customer | `prompts/avatar_p4_de_versterker_research.md` |
| Brand voice, mechanism, positioning | `claude.md` §3 voice + `brand/` (design system, competitors) |
| Performance review, kill rules, winners | `performance_data.md` + `tracking/TRACKER_SOP.md` |
| Klaviyo / email flow draft | `email/flows/` (greenfield, being built) |
| Compliance hard rails (Meta, claims) | `claude.md` compliance + `brand/` |
| Production ad exports for reference | `Advertenties/` |
| Wiki synthesis across Goatly topics | `wiki/` (cross-linked second-brain layer) |

**Always start at `/Goatly_kennis/claude.md`** for the routing inside that canon. It is the single source of truth for marketing output.

Do NOT read from `/Goatly_kennis/` for:

- Daily journal entries or session logs (those stay here in `Daily/`).
- Vault housekeeping (em-dashes, frontmatter, wikilinks).
- Strategy-level questions (`Context/strategy.md` here is authoritative).
- Identity / working style (`Context/me.md` here is authoritative).
- General chat or "wat zou je doen?" type vragen.

**Write-back rule:** when you generate ad copy / VSL / email flow output, save the result into `/Goatly_kennis/` under the matching subfolder, not here. This vault catches operator loops; that vault catches production marketing assets.

## Commands

- `/dtc`, adopt de DTC-operator persona uit `Resources/prompts/dtc-operator-persona.md` voor de rest van het gesprek
- `/promote`, verwerk goedgekeurde blokken uit `Resources/Operator/Promotion-Queue.md` naar hun target files
- `/watch`, bekijk een video (URL of lokaal pad) via yt-dlp + frames + transcript

## Document Voice

Vault docs sound like a teammate, not AI. Specific names, specific context, specific consequences. Never generic.

- BAD: "The project is progressing well. Key milestones are being tracked."
- GOOD: "Eval framework 70% done. Next checkpoint: judge integration. Blocked on [[Claude]] API access. Picking back up tomorrow."

## Obsidian Syntax

Always use Obsidian-native syntax in vault notes:

- **Wikilinks** (not markdown links): `[[Note Name]]`, `[[Note|Display Text]]`. Weave into sentences naturally. Never as bullet lists or footnotes.
- **Embeds**: `![[Note Name]]`, `![[image.png|300]]`
- **Callouts**: `> [!type] Title` (types: note, tip, warning, important, question, todo, success, failure, info)
- **Highlights**: `==text==` (sparingly)
- **Comments**: `%%internal note%%`
- **Tags**: `#tag` inline or `tags: [tag1, tag2]` in frontmatter

Prefer Obsidian CLI (`obsidian read`, `obsidian search`) when available. Fall back to direct file access.

## Frontmatter

```yaml
---
type: meeting
date: 2026-01-21
project: Project-Alpha
status: completed
tags: [tag1, tag2]
---
```

Standard fields: `type`, `date`, `project`, `status`, `tags`, `priority`. Always include `status:` + 2+ specific `tags:`. Most missed: `project:`.

## Rules

1. Session startup: zie boven (latest `Daily/` + `Context/me.md`, silent).
2. When meaningful work happens (not casual chat) → write a session log to `Daily/YYYY-MM-DD.md`.
3. Use `[[wikilinks]]` for EVERY entity (people, companies, projects, notes) in vault files. Weave into sentences.
4. Every note: standalone & composable. Lego block.
5. Use callouts (`> [!type]`) for visual structure. Sparse (1-3 per doc).
6. Use `grep` or `obsidian search` to scan many files. Don't read whole files when scanning.
7. User corrections → save as permanent rule below. Don't ask.
8. Respect `.claudeignore`.
9. Never ask permission to save. Auto-save → right vault file. Report what was saved.
10. Before final response: persist meaningful info → vault. Skip casual chat.
11. Web content extraction: `defuddle parse <url> --md` over raw web fetch.
12. NEVER use em dashes. Use periods, commas, colons, or restructure.
13. Move completed projects to `Intelligence/archive/`.
14. Include `project:` in frontmatter when a note relates to a specific project.
15. NEVER create files/folders in vault root. Every file lives in an existing folder. No exceptions.
16. **Compliance is [[me|Talat]]'s call, niet Claude's.** Talat heeft bij Meta gewerkt en weet wat wel/niet mag op het platform en in marketing-claims. Claude flagt NIET automatisch dingen als "fearmongering", "Meta-risico" of "niet veilig in copy". Lever de feiten + bron, Talat oordeelt. Wel toegestaan: feitelijke claims linken naar hun bron zodat verificatie mogelijk is. NIET toegestaan: ongevraagd "compliance check"-tabellen, "veilig in copy?"-oordelen, of paternalistische waarschuwingen over wat de avatar wel/niet kan lezen.

## Anti-Patterns

Do NOT:
- Put a `# Title` heading that duplicates the filename
- Create orphan notes (always link from 1+ existing note)
- Update vault files on casual chat
- Cram all project info into `README.md` (route to subdirs)
- Write project names, people, or note references as plain text, always use `[[wikilinks]]`
- Use `[markdown](links)` for internal vault notes

<!-- USER CORRECTIONS: Add new rules below as the user teaches you -->
