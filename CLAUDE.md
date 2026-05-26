# CLAUDE.md — Personal LLM Knowledge Base (NotebookLM Hybrid)

## Core Mission
I am the intelligent maintainer of this knowledge base. The owner feeds high-quality
Markdown from NotebookLM into `content/raw/`. I deeply integrate that information into a
clean, well-linked wiki in `content/wiki/`.

## Strict Operating Rules (Karpathy Principles)
1. Think Before Acting — Never assume. Surface tradeoffs. Ask if unclear.
2. Simplicity First — Keep structure minimal and elegant.
3. Surgical Changes — Only touch what needs changing. Match existing style.
4. Goal-Driven — Define success criteria and verify before finishing.

## Paths
- Source (read-only): `content/raw/`
- Wiki (maintained):   `content/wiki/`
- Index:               `content/wiki/index.md`
- Log:                 `content/wiki/log.md`
- Page templates:      `templates/`

## Ingestion Workflow
When new files appear in `content/raw/`:
- Read them thoroughly.
- Create/update a summary page in `content/wiki/sources/` (use `templates/source.md`).
- Extract and create/update concept pages (`templates/concept.md`) and entity pages
  (`templates/entity.md`).
- Add bidirectional `[[wikilinks]]`.
- Update `content/wiki/index.md`.
- Append to `content/wiki/log.md` using: `## [YYYY-MM-DD] ingest | <filename>.md`
- **Never modify anything inside `content/raw/`.**

## Manual Maintenance Workflow (owner-triggered, end of day)
When the owner pastes the maintenance prompt:
1. Read `content/wiki/index.md` to understand the structure.
2. Run a full wiki health check (lint):
   - Contradictions, stale information, orphan pages, broken `[[wikilinks]]`,
     missing connections, merge/improve opportunities.
3. Make only surgical, high-quality changes.
4. Append a maintenance entry to `content/wiki/log.md`.
5. End by summarising exactly what changed and why, so the owner can review the diff.

## Version Control & Rollback Discipline
- The content repo (`content/`) is the safety net for wiki edits.
- Before a maintenance or large ingestion pass, ensure the content repo is clean
  (committed) so there is a rollback point.
- After a pass, the owner reviews `git -C content diff` and commits if satisfied,
  or `git -C content restore .` to discard.
- Suggest a commit message; let the owner run the commit.

## GitHub & Privacy Rules (hard constraints)
- `content/` (raw + wiki) is versioned **only** in the local content repo.
- **Never** stage, add, or commit anything under `content/` into the system repo.
- **Never** push `content/` to the public GitHub remote.
- Only system files (`CLAUDE.md`, `scripts/`, `templates/`, `README.md`, `.gitignore`,
  `launchd/`, `.obsidian/` config) belong on GitHub.

## Query Workflow
- Always start by reading `content/wiki/index.md`.
- Give well-cited answers grounded in the wiki/sources.
- Offer to file high-value answers back into the wiki as new pages.
