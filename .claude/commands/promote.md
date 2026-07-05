Read `Resources/Operator/Promotion-Queue.md`. For every block where the **Approve** checkbox is ticked (`- [x] **Approve**`):

1. Extract the **Proposed promotion target** path and the **Proposed addition** code block.
2. Read the target file. Append or merge the proposed addition at the most contextually correct location (existing section if it fits, new section if needed).
3. After successful merge, re-Read the target file and confirm the addition is present.
4. Move the processed block (verbatim) to `Intelligence/archive/promotions/{YYYY-MM-DD}-promotions.md` (create file if needed, append if exists).
5. Remove the processed block from `Promotion-Queue.md`.

For every block where **Reject** is ticked: move verbatim to the same archive file with a `[REJECTED]` tag, then remove from the queue. Don't touch any target file.

For blocks where neither is ticked: leave in queue, do nothing.

After processing, write a brief summary to chat:

- Number of approvals processed and target files touched
- Number of rejections archived
- Number left pending in queue
- Any errors (target file unreadable, ambiguous merge location, content already exists)

Hard rules:
- Never edit `CLAUDE.md` files via this command.
- If a target file is one of the protected ones (`Context/brand.md`, `Context/business.md`, `Context/strategy.md`), confirm one final time with Talat before merging: show the diff first.
- Em-dash check after every merge. No em-dashes allowed in canonical files (rule 14).
- Operator signature unchanged on the target file: don't add a new one, the canonical files don't carry one.
- All file paths are relative to vault root `/Users/talat/Second Brain/`. The `Goatly-Knowledge/` path is the symlink to `/Users/talat/Desktop/Goatly_kennis/`, write to it as if it were a local folder.

Stop after summary. Don't propose follow-ups.
