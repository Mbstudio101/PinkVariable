/*--------------------------------------------------------------------------------------
 *  Copyright 2025 PinkVariable All rights reserved.
 *  Licensed under the MIT License. See LICENSE.txt for more information.
 *--------------------------------------------------------------------------------------*/

import { mountFnGenerator } from '../util/mountFnGenerator.js'
import { VoidCommandBarMain } from './VoidCommandBar.js'
import { VoidSelectionHelperMain } from './VoidSelectionHelper.js'

export const mountVoidCommandBar = mountFnGenerator(VoidCommandBarMain)

export const mountVoidSelectionHelper = mountFnGenerator(VoidSelectionHelperMain)

