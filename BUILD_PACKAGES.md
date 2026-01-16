# Building PinkVariable Packages for Release

This guide explains how to build installable packages for macOS and Windows to include in GitHub releases.

## Prerequisites

### For macOS (DMG):
- macOS development machine
- Xcode Command Line Tools: `xcode-select --install`
- Node.js v20.x or higher
- All dependencies installed: `npm install`

### For Windows (EXE/MSI):
- Windows development machine (or macOS with cross-compilation)
- [Inno Setup](https://jrsoftware.org/isdl.php) installed (for EXE installer)
- Node.js v20.x or higher
- All dependencies installed: `npm install`

## Build Process

### Step 1: Compile the Application

```bash
# Install dependencies
npm install

# Compile TypeScript
npm run compile

# Download built-in extensions
npm run download-builtin-extensions
```

### Step 2: Build Electron Package

The build system uses gulp tasks to package the application:

```bash
# Build for current platform
npm run gulp -- vscode-darwin-x64-min
# or
npm run gulp -- vscode-win32-x64-min
```

### Step 3: Create Installers

#### macOS - Create DMG

After building, the packaged app will be in `VSCode-darwin-x64/` (or similar). To create a DMG:

```bash
# Create DMG using hdiutil (macOS built-in)
hdiutil create -volname "PinkVariable" -srcfolder VSCode-darwin-x64 -ov -format UDZO PinkVariable-macos-x64.dmg
```

Or use the build script:
```bash
npm run gulp -- vscode-darwin-x64
```

#### Windows - Create EXE Installer

The Windows build uses Inno Setup. After building:

```bash
# Build Windows installer
npm run gulp -- vscode-win32-x64
```

This will create an installer in `.build/win32-x64/` directory.

## Automated Build Script

We've created a script to help with the build process. However, building packages requires:

1. **Full compilation** (can take 30+ minutes)
2. **Platform-specific tools** (Xcode for Mac, Inno Setup for Windows)
3. **Signing certificates** (for distribution, optional for testing)

## Current Status

For v1.0.0, we released the source code. To include packages in future releases:

1. **Option A: Build on CI/CD** (Recommended)
   - Set up GitHub Actions to build on macOS and Windows runners
   - Automatically create packages on each release
   - Upload as release assets

2. **Option B: Manual Build**
   - Follow the steps above on each platform
   - Manually upload DMG/EXE to GitHub release

3. **Option C: Use void-builder**
   - The original Void project uses `void-builder` for automated builds
   - We could adapt this for PinkVariable

## Next Steps

To add packages to the next release:

1. Set up GitHub Actions workflow for automated builds
2. Or manually build packages and upload to release
3. Update release notes to include download links

## Notes

- Building requires significant time and resources
- Cross-platform builds (building Windows on Mac) are complex
- For production releases, consider using CI/CD pipelines
- Code signing requires certificates (optional for open source)
