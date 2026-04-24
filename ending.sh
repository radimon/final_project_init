#!/bin/bash

BRANCH="main"

echo "=========================================="
echo "           DEV ENDING SCRIPT              "
echo "=========================================="

# 1. Wrap up project such as update tasks.md
echo "[1/4] Wrapping up project (updating tasks)..."
# Replace all [-] or [/] or [ ] with [x] in a simplified manner or just prompt user
echo "Please ensure that your task.md (if local) is updated."
# You can add automation here if needed

# 2. Write handover document in markdown for next development
echo ""
echo "[2/4] Writing handover document (handover.md)..."
echo "What are the key changes you made during this session?"
read -p "> " CHANGES
echo "What are the remaining tasks or blockers for the next session?"
read -p "> " NEXT_STEPS

cat << EOF > handover.md
# Handover Document
**Date:** $(date)

## Changes Made
- $CHANGES

## Next Steps / Blockers
- $NEXT_STEPS
EOF
echo "handover.md has been generated."

# 3. Archive the change if everything is complete
echo ""
echo "[3/4] Archiving changes (staging to git)..."
git add .
git commit -m "Update from ending.sh: $CHANGES"

# 4. Push code to github
echo ""
echo "[4/4] Pushing code to GitHub..."
git push origin $BRANCH
if [ $? -eq 0 ]; then
    echo "Push successful! Development session ended safely."
else
    echo "Push failed. Please check your git connection."
fi
