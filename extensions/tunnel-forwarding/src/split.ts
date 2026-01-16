/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/

import { Transform } from 'stream';

export const splitNewLines = () => new StreamSplitter('\n'.charCodeAt(0));

/**
 * Copied and simplified from src\vs\base\node\nodeStreams.ts
 *
 * Exception: does not include the split character in the output.
 */
export class StreamSplitter extends Transform {
	private buffer: Uint8Array | undefined;

	constructor(private readonly splitter: number) {
		super();
	}

	override _transform(chunk: Buffer, _encoding: string, callback: (error?: Error | null, data?: any) => void): void {
		const view = new Uint8Array(chunk.buffer, chunk.byteOffset, chunk.byteLength);

		if (!this.buffer) {
			this.buffer = view;
		} else {
			const combined = new Uint8Array(this.buffer.length + view.length);
			combined.set(this.buffer, 0);
			combined.set(view, this.buffer.length);
			this.buffer = combined;
		}

		const current = this.buffer;
		if (!current) {
			callback();
			return;
		}

		let offset = 0;
		while (offset < current.length) {
			const index = current.indexOf(this.splitter, offset);
			if (index === -1) {
				break;
			}

			this.push(current.subarray(offset, index));
			offset = index + 1;
		}

		this.buffer = offset === current.length ? undefined : current.subarray(offset);
		callback();
	}

	override _flush(callback: (error?: Error | null, data?: any) => void): void {
		if (this.buffer) {
			this.push(this.buffer);
		}

		callback();
	}
}
