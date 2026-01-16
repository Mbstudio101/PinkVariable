# Quick Start - Running PinkVariable

## Prerequisites

- **Node.js** v20.x or higher
- **npm** (comes with Node.js)
- **Git**

## First Time Setup

1. **Install dependencies:**
   ```bash
   npm install
   ```
   This may take 10-15 minutes as it downloads all dependencies.

2. **Compile the application:**
   ```bash
   npm run compile
   ```
   This compiles TypeScript to JavaScript. Takes 30-60 minutes on first run.

3. **Download built-in extensions:**
   ```bash
   npm run download-builtin-extensions
   ```
   Downloads required extensions for the editor.

## Running the App

### Method 1: Using npm start (Recommended)
```bash
npm start
```

This automatically:
- Checks if dependencies are installed
- Downloads Electron if needed
- Compiles if needed
- Downloads extensions if needed
- Launches the app

### Method 2: Using npm run dev
```bash
npm run dev
```

Same as `npm start`, just an alias.

### Method 3: Direct script
```bash
./scripts/code.sh
```

### Method 4: Manual launch
```bash
# If already compiled:
node build/lib/preLaunch.js && electron .
```

## Troubleshooting

### "Cannot find module '/out/main.js'"
The app needs to be compiled first:
```bash
npm run compile
```

### "Out of memory" during compilation
The compile script already includes memory increase. If you still get errors:
```bash
NODE_OPTIONS=--max-old-space-size=16384 npm run compile
```

### App won't launch
1. Make sure you've run `npm install`
2. Make sure you've run `npm run compile`
3. Check that `out/main.js` exists:
   ```bash
   ls -la out/main.js
   ```

## Development Mode

For development with auto-reload:
```bash
npm run watch
```

This watches for file changes and recompiles automatically.

## Next Steps

- See [README.md](README.md) for more details
- See [BUILD_PACKAGES.md](BUILD_PACKAGES.md) for building installers
- See [HOW_TO_CONTRIBUTE.md](HOW_TO_CONTRIBUTE.md) for contributing

