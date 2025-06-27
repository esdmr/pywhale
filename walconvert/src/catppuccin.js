import process from 'node:process';
import assert from 'node:assert';
import {flavors} from '@catppuccin/palette';

const catppuccinLightThemeFlavor =
	process.env.walconvert_catppuccin_light || 'latte';

const catppuccinDarkThemeFlavor =
	process.env.walconvert_catppuccin_dark || 'mocha';

/**
 * @param {import('./wal.js').Palette} walPalette
 * @returns {Promise<import('./wal.js').Palette>}
 */
export async function getCatppuccinPalette({light}) {
	const flavorIndex =
		/** @type {keyof import('@catppuccin/palette').CatppuccinFlavors} */ (
			light ? catppuccinLightThemeFlavor : catppuccinDarkThemeFlavor
		);

	const flavor = flavors[flavorIndex];

	assert.equal(flavor.dark, !light, 'Flavor lightness/darkness mismatch');

	return {
		colors: Object.fromEntries(
			flavor.colorEntries
				.filter(([, {accent}]) => accent)
				.map(([k, v]) => [k, v.hex]),
		),
		light: !flavor.dark,
		index: flavorIndex,
	};
}
