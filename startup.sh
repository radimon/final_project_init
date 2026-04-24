#!/bin/bash

# Configuration
BRANCH="main"

echo "=========================================="
echo "          DEV STARTUP SCRIPT              "
echo "=========================================="

# 1. Pull code from github
echo "[1/3] Pulling latest code from GitHub..."
git pull origin $BRANCH
if [ $? -ne 0 ]; then
    echo "Warning: git pull failed. You might not have the upstream configured."
fi

# 2. Read the handover document
echo ""
echo "[2/3] Reading handover document..."
if [ -f "handover.md" ]; then
    echo "--- handover.md ---"
    cat handover.md
    echo "-------------------"
else
    echo "No handover.md found."
fi

# 3. Suggest the next actions
echo ""
echo "[3/3] Suggested next actions:"
if [ -f "C:/Users/bjhij/.gemini/antigravity/brain/aad2717c-56b5-4522-9086-6d15d2bad550/task.md" ]; then
    echo "Pending tasks from task.md:"
    grep -i "\[ \]" "C:/Users/bjhij/.gemini/antigravity/brain/aad2717c-56b5-4522-9086-6d15d2bad550/task.md"
else
    echo "- Check for incomplete tasks."
    echo "- Review the handover document above."
fi
echo "Environment is ready! Start coding."
