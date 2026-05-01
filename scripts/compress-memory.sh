#!/usr/bin/env bash
# compress-memory.sh
# Counts experience log entries and warns when compression is needed.
# Does not auto-edit memory files — compression requires human review.
# Usage: bash scripts/compress-memory.sh [path/to/project]

set -euo pipefail

PROJECT="${1:-.}"
LOG="$PROJECT/ai-memory/project-experience-log.md"
PATTERNS="$PROJECT/ai-memory/patterns.md"
MISTAKES="$PROJECT/ai-memory/mistakes.md"

THRESHOLD=30

echo "=== Memory Compression Check ==="
echo "Project: $PROJECT"
echo ""

if [ ! -f "$LOG" ]; then
  echo "SKIP: $LOG not found"
  exit 0
fi

# Count entries (lines starting with "## " that are not the header)
ENTRY_COUNT=$(grep -c '^## [0-9]' "$LOG" 2>/dev/null || echo 0)
echo "Experience log entries: $ENTRY_COUNT (threshold: $THRESHOLD)"
echo ""

if [ "$ENTRY_COUNT" -lt "$THRESHOLD" ]; then
  echo "OK: Log is under threshold. No compression needed."
  exit 0
fi

echo "WARN: Log has $ENTRY_COUNT entries — compression recommended."
echo ""
echo "Compression steps (manual, human review required):"
echo "  1. Read $LOG"
echo "  2. Group entries by task type (feature, debug, refactor, etc.)"
echo "  3. Extract recurring patterns → append to $PATTERNS"
echo "  4. Extract recurring mistakes → append to $MISTAKES"
echo "  5. Keep the 10 most recent entries in the log"
echo "  6. Replace older entries with a summary header:"
echo "     ## Compressed YYYY-MM-DD"
echo "     - Entries compressed: <N>"
echo "     - Patterns extracted: <titles>"
echo "     - Mistakes extracted: <titles>"
echo "  7. Run: bash scripts/check-memory-hygiene.sh $PROJECT"
echo ""

# Show repeated task types to guide compression
echo "Task type frequency in log:"
grep '^## [0-9]' "$LOG" | sed 's/^## [0-9-]* | //' | sort | uniq -c | sort -rn | head -10

echo ""
echo "Run bash scripts/check-memory-hygiene.sh after compression."
