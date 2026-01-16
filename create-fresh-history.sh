#!/bin/bash
# Script to create fresh git history with only PinkVariable commits
# This removes all old contributor history from Void/VS Code

set -e

echo "⚠️  WARNING: This will rewrite git history!"
echo "This will:"
echo "  - Remove all 2,778+ commits from Void/VS Code history"
echo "  - Create a fresh history with only PinkVariable work"
echo "  - Remove all old contributors from GitHub"
echo "  - This is IRREVERSIBLE"
echo ""
read -p "Are you sure you want to proceed? (type 'yes' to continue): " confirm

if [ "$confirm" != "yes" ]; then
    echo "Aborted."
    exit 1
fi

echo ""
echo "🔄 Creating fresh git history..."

# Backup current branch
git branch backup-main-$(date +%Y%m%d-%H%M%S) 2>/dev/null || true

# Create new orphan branch (no history)
git checkout --orphan fresh-main

# Add all files
git add -A

# Create initial commit
git commit -m "Initial commit: PinkVariable v1.0.0

Complete PinkVariable codebase with:
- Full PinkVariable branding and icons
- Custom PinkVariable logo and welcome screen
- Updated build system and configuration
- Comprehensive documentation
- All Void references removed
- PinkVariable copyright throughout

Built on VS Code and Void Editor architecture.
Special thanks to void-builder for build pipeline inspiration."

# Delete old main branch
git branch -D main

# Rename current branch to main
git branch -m main

echo ""
echo "✅ Fresh history created!"
echo ""
echo "📋 Next steps:"
echo "   1. Review the commit: git log"
echo "   2. If satisfied, force push: git push -f origin main"
echo "   3. This will replace all history on GitHub"
echo ""
echo "⚠️  Remember: This is irreversible. Make sure you have a backup!"
