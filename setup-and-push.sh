#!/bin/bash
# PinkVariable GitHub Push Script
set -e

GITHUB_USERNAME="Mbstudio101"
REPO_NAME="PinkVariable"

echo "🚀 Setting up PinkVariable for GitHub..."
echo "GitHub username: $GITHUB_USERNAME"
echo "Repository: $REPO_NAME"
echo ""

# Check if repository exists (we'll get an error if it doesn't, but that's ok)
echo "📋 IMPORTANT: Make sure you've created the repository on GitHub first!"
echo "   Go to: https://github.com/new"
echo "   Name: $REPO_NAME"
echo "   Description: PinkVariable - A fork of Void Editor with custom branding"
echo "   Do NOT initialize with README"
echo ""
read -p "Press Enter once you've created the repository..."

echo ""
echo "🔄 Updating git remote..."
git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/${GITHUB_USERNAME}/${REPO_NAME}.git"

echo ""
echo "📤 Pushing code to GitHub..."
git push -u origin main

echo ""
echo "🏷️  Pushing release tag..."
git push origin v1.0.0

echo ""
echo "✅ Success! Code pushed to GitHub!"
echo ""
echo "📝 Next: Create GitHub Release"
echo "   URL: https://github.com/${GITHUB_USERNAME}/${REPO_NAME}/releases/new"
echo "   Tag: v1.0.0"
echo "   Title: PinkVariable v1.0.0 - First Release"
echo "   Description: Copy from RELEASE_NOTES.md"
echo ""
