Projects are living, structured directories that grow as information accumulates. They are not flat README-only folders.

## Project Routing

When the user mentions something about a project, analyze it and route to the right place:

| Content type | Route to |
|---|---|
| Status update, overview, deadline | `Projects/{name}/README.md` |
| Research finding, competitor analysis | `Projects/{name}/research/{topic}.md` |
| Spec, requirement, brief | `Projects/{name}/specs/{name}.md` |
| Draft, script, written content | `Projects/{name}/drafts/{name}.md` |
| Idea, brainstorm | `Projects/{name}/ideas/{name}.md` |
| Working notes, scratchpad | `Projects/{name}/notes/{name}.md` |
| Feedback, review comments | `Projects/{name}/feedback/{name}.md` |

## Rules

- **Subdirs on the fly**: Don't pre-create empty directories. When content arrives that needs a subdir, create it and write the file. Update README.md to reference the new content.
- **README as index**: The README.md is the entry point with overview, status, next steps, and links to subdir content. Don't duplicate subdir content in it.
- **Lifecycle**: New project = just a README.md. Subdirs appear as content types emerge. Completed projects move to `Intelligence/archive/{name}/`.
- Include `project:` in frontmatter whenever a note relates to a specific project.

## Goal Cascade

Every action should trace back to a strategic priority:

```
Context/strategy.md priorities -> Projects -> Weekly Review -> Daily/Tasks.md
```

- Priorities live in `Context/strategy.md`; projects in `Projects/` link back to them.
- Open tasks and loops live in `Resources/Operator/Tasks.md` and today's `Daily/` note.
- During weekly reviews, check which priorities have no active project (they're drifting).

## Passendonline klantwerk

Voor klantprojecten van Passendonline (Lichtendirect, Gordijnfestijn, FIX-Group, en elke nieuwe klant):

- Elke klantfolder heeft `taken.md` (open taken + "## Mail" voor de Operator) en `uren.md` (regel per werksessie: datum, klus, uren of fee, gefactureerd ja/nee).
- **Het klantboard draait nu op een Neon-database** (live op https://passendonline-dashboard.vercel.app), niet meer op `clients.ts`. Talat bewerkt tarieven, uren, facturen en bedrijfsgegevens zelf op de app. `uren.md`/`taken.md` in de vault blijven de operator-notitie; de app is een aparte bron. Wil Claude data in de app zetten: via de database (server-actie of admin-route), niet via `clients.ts`. Details en schema in `Projects/Passendonline/README.md`.
- `uren.md` is de bron voor de maandelijkse factuur-concepten. Uren nooit schatten zonder het te markeren; Talat corrigeert.
