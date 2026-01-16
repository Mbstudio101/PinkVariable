#!/bin/bash

# Script to selectively merge specific VS Code features into PinkVariable
# Usage: ./scripts/selective-merge-feature.sh [feature-name] [from-version] [to-version]
# Example: ./scripts/selective-merge-feature.sh "agent-skills" 1.99.3 1.108.0

set -e

FEATURE_NAME=${1:-"agent-skills"}
FROM_VERSION=${2:-"1.99.3"}
TO_VERSION=${3:-"1.108.0"}

echo "🔍 Selective Merge: $FEATURE_NAME"
echo "From: $FROM_VERSION → To: $TO_VERSION"
echo ""

# Check if upstream exists
if ! git remote | grep -q upstream; then
    echo "Adding VS Code as upstream..."
    git remote add upstream https://github.com/microsoft/vscode.git
    git fetch upstream tag $TO_VERSION
fi

# Find commits related to the feature
echo "📋 Finding commits for '$FEATURE_NAME'..."
COMMITS=$(git log $FROM_VERSION..$TO_VERSION --oneline --grep="$FEATURE_NAME" -i | head -10)

if [ -z "$COMMITS" ]; then
    echo "⚠️  No commits found for '$FEATURE_NAME'"
    echo "Trying broader search..."
    COMMITS=$(git log $FROM_VERSION..$TO_VERSION --oneline --all --grep="$FEATURE_NAME" -i | head -10)
fi

if [ -z "$COMMITS" ]; then
    echo "❌ No commits found. Try a different feature name."
    exit 1
fi

echo "Found commits:"
echo "$COMMITS"
echo ""

# Find files changed for this feature
echo "📄 Finding files changed for '$FEATURE_NAME'..."
FILES=$(git log $FROM_VERSION..$TO_VERSION --oneline --grep="$FEATURE_NAME" -i --name-only | grep -v "^[a-f0-9]" | sort -u)

if [ -z "$FILES" ]; then
    echo "⚠️  No files found. Trying broader search..."
    FILES=$(git log $FROM_VERSION..$TO_VERSION --oneline --all --grep="$FEATURE_NAME" -i --name-only | grep -v "^[a-f0-9]" | sort -u)
fi

if [ -z "$FILES" ]; then
    echo "❌ No files found."
    exit 1
fi

echo "Files to merge:"
echo "$FILES" | head -20
echo ""

# Ask for confirmation
read -p "Do you want to merge these files? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Cancelled."
    exit 0
fi

# Create merge branch
BRANCH_NAME="merge-${FEATURE_NAME}-${TO_VERSION}"
echo "Creating branch: $BRANCH_NAME"
git checkout -b "$BRANCH_NAME" 2>/dev/null || git checkout "$BRANCH_NAME"

# Merge specific files
echo ""
echo "Merging files..."
echo "$FILES" | while read -r file; do
    if [ -n "$file" ] && [ -f "$file" ] || git show $TO_VERSION:"$file" >/dev/null 2>&1; then
        echo "  → $file"
        git checkout $TO_VERSION -- "$file" 2>/dev/null || echo "    ⚠️  Could not merge $file"
    fi
done

echo ""
echo "✅ Merge complete!"
echo ""
echo "Next steps:"
echo "1. Review changes: git diff HEAD"
echo "2. Test: npm run compile && npm start"
echo "3. Commit if successful: git commit -m 'feat: Merge $FEATURE_NAME from VS Code $TO_VERSION'"
echo "4. Resolve any conflicts with your void/ code"
