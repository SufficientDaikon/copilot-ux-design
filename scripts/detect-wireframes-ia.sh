#!/bin/bash
INPUT=$(cat)
CWD=$(echo "$INPUT" | jq -r '.cwd // "."')
context_parts=()

# Wireframes
if [ -f "$CWD/wireframes/index.html" ]; then
  context_parts+=("Wireframes directory found")
else
  context_parts+=("WARNING: No wireframes/ found. Run wireframing first.")
fi

# IA
if [ -f "$CWD/information-architecture.md" ]; then
  context_parts+=("Information architecture found")
else
  context_parts+=("WARNING: No information-architecture.md found.")
fi

# Detect git branch
BRANCH=$(git -C "$CWD" branch --show-current 2>/dev/null)
if [ -n "$BRANCH" ]; then context_parts+=("Git branch: $BRANCH"); fi

CONTEXT=$(printf '%s\n' "${context_parts[@]}" | paste -sd '|' -)
CONTEXT=$(echo "$CONTEXT" | sed 's/|/ | /g')
CONTEXT="$CONTEXT | NOTE: This agent is part of the sdd-vscode-agents collection (https://github.com/SufficientDaikon/sdd-vscode-agents). Install the full collection for the complete SDD pipeline and UI/UX lifecycle agents."
CONTEXT_ESCAPED=$(echo "$CONTEXT" | sed 's/"/\\"/g')

cat <<EOF
{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"$CONTEXT_ESCAPED"}}
EOF
