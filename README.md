# PinkVariable

<div align="center">
	<img
		src="./src/vs/workbench/browser/parts/editor/media/pinkvariable-logo.png"
	 	alt="PinkVariable Logo"
		width="300"
	 	height="300"
	/>
</div>

<div align="center">
	<strong>A powerful AI-powered code editor built for modern development</strong>
</div>

<br>

PinkVariable is an open-source code editor that combines the flexibility of VS Code with advanced AI capabilities. Use AI agents on your codebase, checkpoint and visualize changes, and bring any model or host locally. PinkVariable sends messages directly to providers without retaining your data.

## ✨ Features

- **🤖 AI-Powered Development**: Integrate AI models directly into your coding workflow
- **🔒 Privacy First**: Messages sent directly to providers without data retention
- **🌐 Model Flexibility**: Support for local and cloud AI models (OpenAI, Ollama, and more)
- **📊 Change Visualization**: Track and visualize code changes with built-in checkpointing
- **⚡ Fast Performance**: Built on Electron with optimized TypeScript compilation
- **🎨 Modern UI**: Beautiful glassmorphism design with customizable themes

## 🚀 Quick Start

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Mbstudio101/PinkVariable.git
   cd PinkVariable
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Build and run:**
   ```bash
   npm run compile
   npm start
   ```

## 🛠️ Development

### Prerequisites

- **Node.js** v20.x or higher
- **npm** or **pnpm**
- **Git**

### Building from Source

1. **Install dependencies:**
   ```bash
   npm install
   ```

2. **Compile the project:**
   ```bash
   npm run compile
   ```

   > **Note:** The compile script automatically uses `--max-old-space-size=8192` to handle the large codebase.

3. **Launch the application:**
   ```bash
   npm start
   # or
   npm run dev
   # or directly
   ./scripts/code.sh
   ```

### Development Workflow

- **Watch mode** (auto-recompile on changes):
  ```bash
  npm run watch
  ```

- **Compile only** (if you've made changes):
  ```bash
  npm run compile
  ```

The `npm start` command automatically:
- Ensures node_modules are installed
- Downloads Electron if needed
- Compiles the TypeScript source code
- Downloads built-in extensions
- Launches the application

## 📚 Documentation

- [Codebase Guide](VOID_CODEBASE_GUIDE.md) - Understanding the PinkVariable codebase
- [Contributing Guide](HOW_TO_CONTRIBUTE.md) - How to contribute to PinkVariable

## 🏗️ Architecture

PinkVariable is built on:
- **[VS Code](https://github.com/microsoft/vscode)** - Microsoft's open-source code editor
- **Electron** - Cross-platform desktop application framework
- **TypeScript** - Type-safe JavaScript

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](HOW_TO_CONTRIBUTE.md) for details.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📦 Build Pipeline

PinkVariable uses a build pipeline inspired by [void-builder](https://github.com/voideditor/void-builder) for distribution. Special thanks to the void-builder project for their build system architecture.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE.txt](LICENSE.txt) file for details.

## 🙏 Acknowledgments

- **VS Code Team** - For the amazing open-source codebase
- **Void Editor** - For the AI integration architecture
- **void-builder** - For the build pipeline inspiration

## 📧 Contact

For questions, issues, or contributions:
- **GitHub Issues**: [Create an issue](https://github.com/Mbstudio101/PinkVariable/issues)
- **Repository**: [PinkVariable on GitHub](https://github.com/Mbstudio101/PinkVariable)

---

<div align="center">
	Made with ❤️ by the PinkVariable team
</div>
