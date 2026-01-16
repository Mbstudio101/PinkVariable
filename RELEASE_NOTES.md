# PinkVariable v1.0.0 - First Release

## 🎉 Initial Release

This is the first official release of PinkVariable, a fork of Void Editor with complete custom branding and enhancements.

## ✨ Major Features & Changes

### 🎨 Complete Rebranding
- **Full PinkVariable Branding**: Complete rebranding from Void to PinkVariable
  - Updated all app icons for macOS, Windows, and Linux with PinkVariable branding
  - Created custom PinkVariable logo (`pinkvariable-logo.png`)
  - Updated welcome screen from "Welcome to Void" to "Welcome to PinkVariable"
  - Replaced all void icon references with PinkVariable icons
  - Updated company name from "Microsoft Corporation" to "PinkVariable"
  - Updated copyright notices throughout the codebase

### 🛠️ Build System Improvements
- **Enhanced Compilation**:
  - Updated compile script with increased memory allocation (8192MB) to handle large codebase
  - Fixed TypeScript compilation errors (ColorScheme enum usage in style.ts)
  - Improved pre-launch checks to verify `out/main.js` exists
  - Added convenient `npm start` and `npm run dev` commands for easier development

### 📝 Documentation & Branding
- **New PinkVariable README**:
  - Completely rewritten README with PinkVariable branding
  - Removed all Void website references (voideditor.com, voideditor.dev)
  - Updated all GitHub URLs to PinkVariable repository
  - Added comprehensive development documentation
  - Created PinkVariable branding assets directory

### 🧹 Codebase Cleanup
- **Removed Old Contributors**:
  - Updated package.json author from "Microsoft Corporation" to "PinkVariable"
  - Replaced all "Glass Devtools, Inc." copyright notices with "PinkVariable"
  - Updated 81 files with PinkVariable copyright
  - Cleaned up all old contributor attributions

### 🎯 Technical Changes
- Fixed ColorScheme enum usage in `src/vs/workbench/browser/style.ts`
- Updated build configuration for PinkVariable icons (`darwinIcon`, `winIcon`)
- Replaced all Void icons with PinkVariable branding:
  - macOS: `pinkvariable.icns`
  - Windows: `pinkvariable.ico` and tile icons
  - Linux: `pinkvariable.png`
- Updated welcome screen component (`VoidOnboarding.tsx`)
- Updated CSS references to use PinkVariable logo
- Updated product.json with PinkVariable repository URLs

### 📦 Repository Setup
- Created GitHub repository: https://github.com/Mbstudio101/PinkVariable
- Set up release tag v1.0.0
- Added release notes and documentation
- Created helper scripts for future releases

## 🛠️ Technical Details

### Files Changed
- **74 files** in initial release commit
- **81 files** updated for copyright/contributor cleanup
- **11 files** added for branding assets

### Build Configuration
- Updated `build/lib/electron.ts` with PinkVariable branding
- Updated `build/lib/preLaunch.ts` for better compilation checks
- Updated `package.json` with PinkVariable author and improved scripts

### Icon Updates
- Created `pinkvariable.icns` for macOS (1.1MB)
- Created `pinkvariable.ico` for Windows (200KB)
- Created `pinkvariable.png` for Linux (851KB)
- Created Windows tile icons (70x70, 150x150)
- Added PinkVariable logo to media folder

## 📦 Credits & Acknowledgments

This project is built on top of:
- **VS Code** - Microsoft's open-source code editor
- **Void Editor** - The open-source Cursor alternative (AI integration architecture)
- **[void-builder](https://github.com/voideditor/void-builder)** - Build pipeline and distribution system

Special thanks to:
- The **void-builder** project for making this distribution possible
- The VS Code team for the amazing open-source codebase
- The Void Editor team for the AI integration architecture

## 🚀 Getting Started

See the [README.md](README.md) for installation and development instructions.

### Quick Start
```bash
# Clone the repository
git clone https://github.com/Mbstudio101/PinkVariable.git
cd PinkVariable

# Install dependencies
npm install

# Compile
npm run compile

# Launch
npm start
```

## 📝 License

MIT License - See [LICENSE.txt](LICENSE.txt) for details.

## 🔗 Links

- **Repository**: https://github.com/Mbstudio101/PinkVariable
- **Issues**: https://github.com/Mbstudio101/PinkVariable/issues
- **Releases**: https://github.com/Mbstudio101/PinkVariable/releases

---

**Release Date**: January 15, 2025
**Version**: 1.0.0
**Tag**: v1.0.0
