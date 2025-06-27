import fs from 'node:fs/promises';
import path from 'node:path';
import process from 'node:process';
import assert from 'node:assert';
import {parseSrgb, srgbToOkLch} from './color.js';

const lightThemeLightnessThreshold = Number(
	process.env.walconvert_wal_threshold || 0.6,
);

function getCacheDirectory() {
	if (process.env.XDG_CACHE_HOME) {
		return process.env.XDG_CACHE_HOME;
	}

	assert(process.env.HOME, 'Neither HOME nor XDG_CACHE_HOME are available');
	return path.join(process.env.HOME, '.cache');
}

/**
 * @param {string} hex
 */
export function isLight(hex) {
	return srgbToOkLch(parseSrgb(hex))[0] > lightThemeLightnessThreshold;
}

/**
 * @typedef {Awaited<ReturnType<typeof getWalPalette>>} Palette
 */
export async function getWalPalette() {
	const file = await fs.readFile(
		path.join(getCacheDirectory(), 'wal', 'colors.json'),
		'utf8',
	);

	/** @type {Record<string, string>} */
	const colors = JSON.parse(file).colors;

	return {colors, light: isLight(colors.color0), index: 'wal'};
}
