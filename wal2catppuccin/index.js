#!/usr/bin/env node
import {
	sRGB,
	OKLCH,
	convert,
	deserialize,
} from '@texel/color';
import {
	flavors,
} from '@catppuccin/palette'
import fs from 'node:fs/promises';
import path from 'node:path';
import process from 'node:process';
import assert from 'node:assert';

const lightThemeLightnessThreshold = Number(process.env.pywhale_wal2catppuccin_threshold || 0.6);
const lightThemeFlavor = process.env.pywhale_wal2catppuccin_light || 'latte';
const darkThemeFlavor = process.env.pywhale_wal2catppuccin_dark || 'mocha';
const paletteLimit = Number(process.env.pywhale_wal2catppuccin_limit || 4);

function parseSrgb(str) {
	const { id, coords } = deserialize(str);
	assert.equal(id, 'srgb', 'Non sRGB Wal color value');
	return coords;
}

function srgbToOkLch(rgb) {
	return convert(rgb, sRGB, OKLCH);
}

function getCacheDir() {
	if (process.env.XDG_CACHE_HOME) {
		return process.env.XDG_CACHE_HOME;
	}

	assert(process.env.HOME, 'Neither HOME nor XDG_CACHE_HOME are available');
	return path.join(process.env.HOME, '.cache');
}

const file = await fs.readFile(path.join(getCacheDir(), 'wal', 'colors.json'), 'utf-8');
const { colors } = JSON.parse(file);

const light = srgbToOkLch(parseSrgb(colors.color0))[0] >= lightThemeLightnessThreshold;

const flavorIndex = light ? lightThemeFlavor : darkThemeFlavor;
const flavor = flavors[flavorIndex];

assert.equal(flavor.dark, !light, 'Flavor lightness/darkness mismatch');

const scores = Object.fromEntries(
	flavor.colorEntries
		.filter(([, { accent }]) => accent)
		.map(([k]) => [k, 0])
);

for (let i = 1; i <= paletteLimit; i++) {
	const paletteColor = srgbToOkLch(parseSrgb(colors[`color${i}`]));

	for (const [index, { accent, hex }] of flavor.colorEntries) {
		if (!accent) continue;

		const accentColor = srgbToOkLch(parseSrgb(hex));
		const difference = Math.abs(accentColor[2] - paletteColor[2]);

		scores[index] += 180 - Math.min(difference, 360 - difference);
	}
}

const sortedAccents =
	/** @type {[import('@catppuccin/palette').AccentName, number][]} */ (
		Object.entries(scores)
	)
		.map(([index, score]) => ({
			...flavor.colors[index],
			index,
			score,
		}))
		.sort((a, b) => b.score - a.score);

if (process.stdout.isTTY) {
	const log = '\x1b[1;32m';
	const reset = '\x1b[m';

	console.debug(`${log}[D]${reset}`, 'Accent scores (higher is better):');

	const foreground = `\x1b[38`;
	const background = `\x1b[48`;

	for (const accent of sortedAccents) {
		const color = `;2;${accent.rgb.r};${accent.rgb.g};${accent.rgb.b}m`;

		const monoCh = srgbToOkLch(parseSrgb(accent.hex))[0] > lightThemeLightnessThreshold ? 255 : 0;
		const mono = `;2;${monoCh};${monoCh};${monoCh}m`;

		const inverseCh = 255 - monoCh;
		const inverse = `;2;${inverseCh};${inverseCh};${inverseCh}m`;

		console.debug(`${log}[D]${reset}`, accent.score.toFixed(2).padStart(7), `${foreground}${color}${foreground}${inverse}${background}${color}`, accent.hex, `${reset}${foreground}${color}${reset}`, accent.name.padEnd(10));
	}
}

console.log(`catppuccin-${flavorIndex}-${sortedAccents[0].index}-compact+default`);
