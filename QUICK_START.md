# Quick Start: Push PinkVariable to GitHub

## Option 1: Run the Automated Script (Easiest)

```bash
./push-to-github.sh
```

The script will guide you through the process step by step.

## Option 2: Manual Steps

### Step 1: Create Repository on GitHub

1. Go to https://github.com/new
2. Repository name: `PinkVariable`
3. Description: `PinkVariable - A fork of Void Editor with custom branding`
4. Choose Public or Private
5. **Important:** Do NOT check "Initialize with README"
6. Click "Create repository"

### Step 2: Update Remote and Push

Replace `YOUR_USERNAME` with your GitHub username:

```bash
# Remove old remote
git remote remove origin

# Add your repository
git remote add origin https://github.com/YOUR_USERNAME/PinkVariable.git

# Push code
git push -u origin main

# Push release tag
git push origin v1.0.0
```

### Step 3: Create GitHub Release

1. Go to: https://github.com/YOUR_USERNAME/PinkVariable/releases/new
2. **Tag:** Select `v1.0.0` (or create from existing tag)
3. **Release title:** `PinkVariable v1.0.0 - First Release`
4. **Description:** Copy the contents from `RELEASE_NOTES.md`
5. Click "Publish release"

## Release Notes Content

Copy this into the GitHub release description:

```markdown
# PinkVariable v1.0.0 - First Release

## 🎉 Initial Release

This is the first official release of PinkVariable, a fork of Void Editor with custom branding and enhancements.

## ✨ Features

- **Custom PinkVariable Branding**: Complete rebranding from Void to PinkVariable
  - Updated app icons for macOS, Windows, and Linux
  - Custom PinkVariable logo and welcome screen
  - Updated company name and copyright information

- **Build System Improvements**:
  - Updated compile script with increased memory allocation (8192MB) to handle large codebase
  - Improved pre-launch checks for better reliability
  - Added convenient `npm start` and `npm run dev` commands

- **Enhanced Development Experience**:
  - Fixed TypeScript compilation errors
  - Updated development documentation
  - Improved onboarding screen with PinkVariable branding

## 🛠️ Technical Changes

- Fixed ColorScheme enum usage in style.ts
- Updated build configuration for PinkVariable icons
- Replaced all Void icons with PinkVariable branding
- Updated welcome screen text and images

## 📦 Credits

This project is built on top of:
- **Void Editor** - The open-source Cursor alternative
- **[void-builder](https://github.com/voideditor/void-builder)** - Build pipeline and distribution system
- **VS Code** - Microsoft's open-source code editor

Special thanks to the [void-builder](https://github.com/voideditor/void-builder) project for making this distribution possible.

## 🚀 Getting Started

See the [README.md](README.md) for installation and development instructions.

## 📝 License

MIT License - See [LICENSE.txt](LICENSE.txt) for details.
```

## What's Already Done ✅

- ✅ All changes committed locally
- ✅ Release tag v1.0.0 created
- ✅ Release notes prepared
- ✅ Credit to void-builder added

You just need to push to GitHub and create the release!
