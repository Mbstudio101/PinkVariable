# How to Track VS Code Changes

## The Problem

You're on VS Code 1.99.3, but VS Code is now at 1.108.0. How do you know what changed so you can upgrade safely?

## Solution: Multiple Ways to Track Changes

### Method 1: VS Code Release Notes (Easiest) 📖

**VS Code publishes detailed release notes for every version:**

1. **Visit the Release Notes:**
   - https://code.visualstudio.com/updates
   - Or: https://github.com/microsoft/vscode/releases

2. **Read each version's notes:**
   - Start from 1.100.0 and read through 1.108.0
   - Each includes:
     - ✨ New features
     - 🐛 Bug fixes
     - ⚠️ Breaking changes
     - 🔧 API changes

3. **Look for breaking changes:**
   - Extension API changes
   - Configuration changes
   - File structure changes
   - Deprecated features

**Example:**
- Visit: https://code.visualstudio.com/updates/v1_100
- Then: https://code.visualstudio.com/updates/v1_101
- Continue through 1.108

---

### Method 2: Use Git to Compare Versions 🔍

**If you have VS Code as a git remote:**

```bash
# One-time setup: Add VS Code as upstream
git remote add upstream https://github.com/microsoft/vscode.git
git fetch upstream

# Compare two versions (see what files changed)
git diff upstream/release/1.99.3..upstream/release/1.108.0 --stat

# See what changed in specific files you care about
git diff upstream/release/1.99.3..upstream/release/1.108.0 -- \
  src/vs/workbench/browser/style.ts \
  src/vs/code/electron-sandbox/workbench/workbench.ts \
  product.json \
  package.json

# See all changed files
git diff upstream/release/1.99.3..upstream/release/1.108.0 --name-only > changed-files.txt
```

---

### Method 3: GitHub Compare View 🌐

**Use GitHub's web interface:**

1. Go to: https://github.com/microsoft/vscode
2. Click "Compare" or use this URL:
   ```
   https://github.com/microsoft/vscode/compare/release/1.99.3...release/1.108.0
   ```
3. This shows:
   - All commits between versions
   - Files changed
   - Pull requests merged
   - Can filter by file type

---

### Method 4: Check Specific Areas You've Modified 🎯

**Focus on files you've customized:**

```bash
# Check changes to files you've modified
git diff upstream/release/1.99.3..upstream/release/1.108.0 -- \
  src/vs/workbench/browser/style.ts \
  src/vs/code/electron-sandbox/workbench/workbench.ts \
  src/vs/workbench/contrib/void/ \
  product.json \
  package.json
```

---

### Method 5: Use VS Code's Changelog Files 📝

**VS Code maintains changelog files:**

1. Clone VS Code repo (temporarily):
   ```bash
   git clone https://github.com/microsoft/vscode.git /tmp/vscode
   cd /tmp/vscode
   ```

2. Check changelog:
   ```bash
   # See what changed between tags
   git log release/1.99.3..release/1.108.0 --oneline
   
   # See detailed changes
   git log release/1.99.3..release/1.108.0 --pretty=format:"%h - %s" > changes.txt
   ```

---

## What to Look For

When tracking changes, pay attention to:

### ⚠️ Breaking Changes
- APIs that changed or were removed
- Configuration options that changed
- File paths that moved
- Dependencies that changed

### ✨ New Features
- Features you might want to adopt
- Performance improvements
- New extension APIs

### 🔒 Security Fixes
- Critical security updates
- Vulnerability patches

### 📦 Dependency Updates
- Node.js version changes
- npm package updates
- Electron version changes

---

## Practical Workflow

### Step 1: Read Release Notes
```bash
# Open in browser
open https://code.visualstudio.com/updates
```

### Step 2: Set Up Git Remote
```bash
cd /Users/marvens/Desktop/PinkVariable
git remote add upstream https://github.com/microsoft/vscode.git
git fetch upstream
```

### Step 3: Compare Versions
```bash
# See summary
git diff upstream/release/1.99.3..upstream/release/1.108.0 --stat

# See changes to your custom files
git diff upstream/release/1.99.3..upstream/release/1.108.0 -- \
  src/vs/workbench/browser/style.ts \
  src/vs/code/electron-sandbox/workbench/workbench.ts
```

### Step 4: Document Findings
Create a file `UPGRADE_NOTES.md` with:
- Breaking changes found
- Files that need attention
- New features you want
- Risks identified

---

## Quick Reference

**Release Notes:**
- https://code.visualstudio.com/updates

**GitHub Releases:**
- https://github.com/microsoft/vscode/releases

**GitHub Compare:**
- https://github.com/microsoft/vscode/compare/release/1.99.3...release/1.108.0

**API Documentation:**
- Check for deprecated APIs in release notes
- Look for "Breaking Changes" sections

---

## Example: Tracking Changes

```bash
# 1. Add upstream
git remote add upstream https://github.com/microsoft/vscode.git
git fetch upstream

# 2. See what changed
git diff upstream/release/1.99.3..upstream/release/1.108.0 --stat | head -20

# 3. Check your custom files
git diff upstream/release/1.99.3..upstream/release/1.108.0 -- \
  src/vs/workbench/browser/style.ts

# 4. Save list of changed files
git diff upstream/release/1.99.3..upstream/release/1.108.0 --name-only > changed-files.txt
```

---

## Tips

1. **Start with release notes** - They're the easiest to read
2. **Use git diff for specific files** - More precise
3. **Focus on breaking changes** - These are what will break your code
4. **Document as you go** - Write down what you find
5. **Test incrementally** - If upgrading, do it version by version

---

*This guide helps you understand what changed so you can make informed decisions about upgrading.*
