#!/bin/bash
# Manual end-of-day maintenance helper.
# Generates today's maintenance prompt and copies it to the clipboard so it can be
# pasted into an interactive Grok Build session. Does NOT run Grok itself.

set -euo pipefail

# Resolve repo root regardless of where the script is called from.
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

TODAY="$(date +%Y-%m-%d)"
PROMPT_FILE="scripts/maintenance-prompt.md"

cat > "$PROMPT_FILE" <<EOF
# Daily Maintenance Task — $TODAY

Run the /maintain skill (or follow AGENTS.md maintenance rules).

Perform a full maintenance and lint pass on the wiki:

1. Read content/wiki/index.md to understand the current structure.
2. Run a complete health check across all wiki pages.
3. Fix contradictions, stale content, broken [[wikilinks]], and orphan pages.
4. Improve connections between related concepts.
5. Make only surgical, high-quality changes.
6. Append a maintenance entry to content/wiki/log.md.
7. Summarise what changed and why at the end so I can review the diff.

Constraints:
- Never modify anything in content/raw/.
- Keep changes minimal and reviewable.

Current date: $TODAY
EOF

echo "Maintenance prompt written to $PROMPT_FILE"
if command -v pbcopy >/dev/null 2>&1; then
  pbcopy < "$PROMPT_FILE"
  echo "Copied to clipboard — paste into Grok Build here, or run /maintain."
else
  echo "Open Grok Build in this folder and run /maintain, or paste the contents of $PROMPT_FILE."
fi
