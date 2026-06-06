#!/bin/bash
# One-time scaffolder for the (private) content vault.
# Creates content/{raw,wiki/...}, seeds index.md and log.md, and initialises a
# fresh git repo inside content/. Run from anywhere; resolves the repo root.

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

if [ -d content/.git ]; then
  echo "content/.git already exists — vault is already initialised. Aborting." >&2
  exit 1
fi

if [ -e content/wiki/index.md ] || [ -e content/wiki/log.md ]; then
  echo "content/wiki/{index,log}.md already exists — refusing to overwrite. Aborting." >&2
  echo "If you are restoring from a backup, re-init git inside content/ manually." >&2
  exit 1
fi

mkdir -p content/raw content/wiki/sources content/wiki/concepts content/wiki/entities

cat > content/.gitignore <<'EOF'
.DS_Store
EOF

touch content/raw/.gitkeep content/wiki/sources/.gitkeep content/wiki/concepts/.gitkeep content/wiki/entities/.gitkeep

cat > content/wiki/index.md <<'EOF'
# Knowledge Base Index

> Start here. This page is the map of the wiki.

## Sources

## Concepts

## Entities

## Recent Activity

See [[log]] for the ingestion and maintenance history.
EOF

cat > content/wiki/log.md <<'EOF'
# Activity Log

Format:
- `## [YYYY-MM-DD] ingest | <filename>.<ext>`
- `## [YYYY-MM-DD] maintenance`

---
EOF

git -C content init -q
git -C content add -A
git -C content commit -q -m "init: content vault (raw + wiki)"

echo "Done. Drop files into content/raw/, open Grok Build at the system root, and run /ingest."
