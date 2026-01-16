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

	const isDark = theme.type === ColorScheme.DARK || theme.type === ColorScheme.HIGH_CONTRAST_DARK;
	const isLight = theme.type === ColorScheme.LIGHT || theme.type === ColorScheme.HIGH_CONTRAST_LIGHT;

	// Use standard workbench background (no gradient)
	const workbenchBackground = WORKBENCH_BACKGROUND(theme);
	const backgroundColor = workbenchBackground.toString();

	collector.addRule(`
		.monaco-workbench {
			background: ${backgroundColor};
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
