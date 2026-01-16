#!/bin/bash

# PinkVariable GitHub Repository Setup Script
# This script will help you push PinkVariable to your GitHub repository

set -e

echo "🚀 PinkVariable GitHub Repository Setup"
echo "========================================"
echo ""

# Get GitHub username
echo "Please enter your GitHub username (or press Enter to use 'Mbstudio101'):"
read -r GITHUB_USERNAME

if [ -z "$GITHUB_USERNAME" ]; then
    GITHUB_USERNAME="Mbstudio101"
fi

echo ""
echo "Using GitHub username: $GITHUB_USERNAME"
echo ""
echo "📋 Steps to complete:"
echo ""
echo "1️⃣  First, create the repository on GitHub:"
echo "   Go to: https://github.com/new"
echo "   Repository name: PinkVariable"
echo "   Description: PinkVariable - A fork of Void Editor with custom branding"
echo "   Visibility: Public (or Private if you prefer)"
echo "   DO NOT initialize with README, .gitignore, or license"
echo ""
echo "2️⃣  Press Enter once you've created the repository on GitHub..."
read -r

echo ""
echo "3️⃣  Updating git remote..."
git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/${GITHUB_USERNAME}/PinkVariable.git"

echo ""
echo "4️⃣  Pushing code to GitHub..."
git push -u origin main

echo ""
echo "5️⃣  Pushing release tag..."
git push origin v1.0.0

echo ""
echo "✅ Success! Your code is now on GitHub!"
echo ""
echo "6️⃣  Next: Create the GitHub Release"
echo "   Go to: https://github.com/${GITHUB_USERNAME}/PinkVariable/releases/new"
echo "   Tag: v1.0.0"
echo "   Title: PinkVariable v1.0.0 - First Release"
echo "   Description: Copy from RELEASE_NOTES.md"
echo ""
