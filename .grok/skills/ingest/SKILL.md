---
name: ingest
description: >
  Ingest new source files from content/raw/ into the wiki. Use when the user
  asks to ingest, process new files, or runs /ingest. Triggers when files
  are dropped into content/raw/ or the user mentions ingestion.
---

# Ingest Sources

Turn new files in `content/raw/` into linked wiki pages.

## Before starting

1. Read `AGENTS.md` for hard constraints and conventions.
2. Read `content/wiki/index.md` to understand the current wiki structure.
3. List `content/raw/` and identify files not yet ingested (check `content/wiki/log.md` and existing source pages).

## For each new file

1. Read the file fully (PDFs supported via the Read tool).
2. Create a source page at `content/wiki/sources/<kebab-title>.md` from `templates/source.md`.
3. Extract concepts into `content/wiki/concepts/` and entities into `content/wiki/entities/` from their templates. Extend existing pages; do not overwrite.
4. Wire bidirectional `[[wikilinks]]` between source, concepts, and entities.
5. Update `content/wiki/index.md`.
6. Append `## [YYYY-MM-DD] ingest | <filename>.<ext>` to `content/wiki/log.md`.

## Done criteria

- Every new wikilink resolves.
- No orphan pages.
- Every concept/entity traces to a source.
- Nothing in `content/raw/` was modified.

## After finishing

Suggest a content-repo commit message for the owner:
`git -C content add -A && git -C content commit -m "ingest: <filename>"`