import assert from 'node:assert';
import {sRGB, OKLCH, convert, deserialize} from '@texel/color';

/**
 * @param {string} hex
 */
export function parseSrgb(hex) {
	const {id, coords} = deserialize(hex);
	assert.equal(id, 'srgb', 'Non sRGB Wal color value');
	return /** @type {import('@texel/color').Vector} */ (coords);
}

/**
 * @param {import("@texel/color").Vector} srgb
 */
export function srgbToOkLch(srgb) {
	return convert(srgb, sRGB, OKLCH);
}
