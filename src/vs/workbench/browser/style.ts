/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/

import './media/style.css';
import { registerThemingParticipant } from '../../platform/theme/common/themeService.js';
import { WORKBENCH_BACKGROUND, TITLE_BAR_ACTIVE_BACKGROUND } from '../common/theme.js';
import { isWeb, isIOS } from '../../base/common/platform.js';
import { createMetaElement } from '../../base/browser/dom.js';
import { isSafari, isStandalone } from '../../base/browser/browser.js';
import { selectionBackground } from '../../platform/theme/common/colorRegistry.js';
import { mainWindow } from '../../base/browser/window.js';
import { ColorScheme } from '../../platform/theme/common/theme.js';

registerThemingParticipant((theme, collector) => {

	// Glassmorphism gradient background for PinkVariable
	const isDark = theme.type === ColorScheme.DARK || theme.type === ColorScheme.HIGH_CONTRAST_DARK;
	const isLight = theme.type === ColorScheme.LIGHT || theme.type === ColorScheme.HIGH_CONTRAST_LIGHT;

	let gradientBackground: string;
	if (isDark) {
		// Dark theme: Purple to pink gradient
		gradientBackground = 'linear-gradient(135deg, rgba(30, 20, 40, 0.95) 0%, rgba(70, 30, 80, 0.9) 50%, rgba(50, 20, 60, 0.95) 100%)';
	} else if (isLight) {
		// Light theme: Soft pink to lavender gradient
		gradientBackground = 'linear-gradient(135deg, rgba(255, 240, 250, 0.98) 0%, rgba(250, 235, 255, 0.95) 50%, rgba(245, 230, 250, 0.98) 100%)';
	} else {
		const workbenchBackground = WORKBENCH_BACKGROUND(theme);
		gradientBackground = workbenchBackground.toString();
	}

	collector.addRule(`
		.monaco-workbench {
			background: ${gradientBackground};
			backdrop-filter: blur(20px) saturate(180%);
			-webkit-backdrop-filter: blur(20px) saturate(180%);
		}

		/* Glassmorphism effect for panels and sidebars */
		.monaco-workbench .part,
		.monaco-workbench .part .content {
			background: ${isDark ? 'rgba(37, 37, 38, 0.7)' : 'rgba(255, 255, 255, 0.6)'};
			backdrop-filter: blur(10px) saturate(150%);
			-webkit-backdrop-filter: blur(10px) saturate(150%);
		}

		/* Enhanced glassmorphism for editor groups */
		.monaco-workbench .editor-group-container {
			background: ${isDark ? 'rgba(30, 30, 30, 0.75)' : 'rgba(255, 255, 255, 0.7)'};
			backdrop-filter: blur(15px);
			-webkit-backdrop-filter: blur(15px);
		}
	`);

	// Selection (do NOT remove - https://github.com/microsoft/vscode/issues/169662)
	const windowSelectionBackground = theme.getColor(selectionBackground);
	if (windowSelectionBackground) {
		collector.addRule(`.monaco-workbench ::selection { background-color: ${windowSelectionBackground}; }`);
	}

	// Update <meta name="theme-color" content=""> based on selected theme
	if (isWeb) {
		const titleBackground = theme.getColor(TITLE_BAR_ACTIVE_BACKGROUND);
		if (titleBackground) {
			const metaElementId = 'monaco-workbench-meta-theme-color';
			let metaElement = mainWindow.document.getElementById(metaElementId) as HTMLMetaElement | null;
			if (!metaElement) {
				metaElement = createMetaElement();
				metaElement.name = 'theme-color';
				metaElement.id = metaElementId;
			}

			metaElement.content = titleBackground.toString();
		}
	}

	// We disable user select on the root element, however on Safari this seems
	// to prevent any text selection in the monaco editor. As a workaround we
	// allow to select text in monaco editor instances.
	if (isSafari) {
		collector.addRule(`
			body.web {
				touch-action: none;
			}
			.monaco-workbench .monaco-editor .view-lines {
				user-select: text;
				-webkit-user-select: text;
			}
		`);
	}

	// Update body background color to ensure the home indicator area looks similar to the workbench
	if (isIOS && isStandalone()) {
		const workbenchBackground = WORKBENCH_BACKGROUND(theme);
		collector.addRule(`body { background-color: ${workbenchBackground}; }`);
	}
});
