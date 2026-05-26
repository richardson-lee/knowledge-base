# CLAUDE.md — Personal LLM Knowledge Base

## Hard constraints
- `content/` must never enter this repo's git history. Never `git add` / commit / push anything under `content/` from the system root.
- `content/raw/` is immutable source. Read only.
- For commits in `content/`, suggest a message; let the owner run it.

## Paths
- Read-only source: `content/raw/`
- Wiki: `content/wiki/` — subfolders `sources/`, `concepts/`, `entities/`
- Read `content/wiki/index.md` first.
- Templates: `templates/{source,concept,entity}.md`
- Conventions (filenames, wikilink format, index/log structure): match what's already in `content/wiki/`. `log.md` documents its own format.

## Source-grounding
Outside a `## Synthesis` heading, page content must be source-grounded — every claim traceable via `[[wikilinks]]` to a `wiki/sources/` page. Inside a `## Synthesis` heading, original takes, connections, and framing beyond the sources are encouraged.

## Ingest new files in `content/raw/`
For each file:
1. Read fully.
2. Create a source page from `templates/source.md`.
3. Extract concepts and entities into pages from their templates. Extend existing pages; don't overwrite.
4. Wire bidirectional `[[wikilinks]]`.
5. Update `content/wiki/index.md`.
6. Append to `content/wiki/log.md`.

Done means: every new wikilink resolves, no orphans, every concept/entity traces to a source.

PDFs in `content/raw/` are read with the Read tool; the source page still lives at `wiki/sources/<kebab-title>.md` and references the original file by its full name.

## Maintenance (owner pastes `scripts/maintenance-prompt.md`)
Lint the wiki: broken links, orphans, asymmetric backlinks, contradictions, duplicates, merge opportunities. Surgical changes only. Flag contradictions in the summary — don't silently pick winners. Append to `log.md`. Summarise the diff.
