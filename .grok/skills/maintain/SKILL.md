---
name: maintain
description: >
  Run a full maintenance and lint pass on the wiki. Use when the user asks
  for maintenance, wiki lint, end-of-day review, pastes the maintenance prompt,
  or runs /maintain.
---

# Wiki Maintenance

Perform a surgical lint pass on `content/wiki/`.

## Before starting

1. Read `AGENTS.md` for hard constraints.
2. Read `content/wiki/index.md` to understand the current structure.
3. Use today's date from the user message or system context.

## Tasks

1. Run a complete health check across all wiki pages.
2. Fix contradictions, stale content, broken `[[wikilinks]]`, and orphan pages.
3. Improve connections between related concepts.
4. Flag contradictions in the summary — do not silently pick winners.
5. Make only surgical, high-quality changes.
6. Append `## [YYYY-MM-DD] maintenance` to `content/wiki/log.md`.
7. Summarise what changed and why so the owner can review the diff.

## Constraints

- Never modify anything in `content/raw/`.
- Keep changes minimal and reviewable.

## After finishing

Suggest a content-repo commit message for the owner:
`git -C content add -A && git -C content commit -m "maintenance: YYYY-MM-DD"`