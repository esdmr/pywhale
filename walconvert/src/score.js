import process from 'node:process';
import {parseSrgb, srgbToOkLch} from './color.js';
import {isLight} from './wal.js';

const paletteLimit = Number(process.env.walconvert_wal_limit || 4);

/**
 * @param {import('./wal.js').Palette} walPalette
 * @param {import('./wal.js').Palette} otherPalette
 */
export function getPaletteScore(walPalette, otherPalette) {
	const scores = Object.fromEntries(
		Object.entries(otherPalette.colors).map(([k]) => [k, 0]),
	);

	for (let i = 1; i <= paletteLimit; i++) {
		const paletteColor = srgbToOkLch(
			parseSrgb(walPalette.colors[`color${i}`]),
		);

		for (const [index, hex] of Object.entries(otherPalette.colors)) {
			const accentColor = srgbToOkLch(parseSrgb(hex));
			const difference = Math.abs(accentColor[2] - paletteColor[2]);

			scores[index] += 180 - Math.min(difference, 360 - difference);
		}
	}

	return scores;
}

/**
 * @typedef {ReturnType<typeof sortPalette>} SortedPalette
 * @param {import('./wal.js').Palette} palette
 * @param {Record<string, number>} scores
 */
export function sortPalette(palette, scores) {
	return Object.entries(scores)
		.map(([index, score]) => ({
			hex: palette.colors[index],
			srgb: parseSrgb(palette.colors[index]),
			index,
			score,
		}))
		.sort((a, b) => b.score - a.score);
}

/**
 * @param {SortedPalette} sortedPalette
 */
export function debugPalette(sortedPalette) {
	if (!process.stdout.isTTY) return;

	const log = '\u001B[1;32m';
	const reset = '\u001B[m';

	console.debug(`${log}[D]${reset}`, 'Accent scores (higher is better):');

	const foreground = `\u001B[38`;
	const background = `\u001B[48`;

	for (const accent of sortedPalette) {
		const color = `;2;${accent.srgb[0] * 255};${accent.srgb[1] * 255};${accent.srgb[2] * 255}m`;
		const monoCh = isLight(accent.hex) ? 255 : 0;
		const inverseCh = 255 - monoCh;
		const inverse = `;2;${inverseCh};${inverseCh};${inverseCh}m`;

		console.debug(
			`${log}[D]${reset}`,
			accent.score.toFixed(2).padStart(7),
			`${foreground}${color}${foreground}${inverse}${background}${color}`,
			accent.hex,
			`${reset}${foreground}${color}${reset}`,
			accent.index.padEnd(10),
		);
	}
}
