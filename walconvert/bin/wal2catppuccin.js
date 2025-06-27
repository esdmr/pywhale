#!/usr/bin/env node
import {getCatppuccinPalette} from 'walconvert/catppuccin.js';
import {getPaletteScore, sortPalette, debugPalette} from 'walconvert/score.js';
import {getWalPalette} from 'walconvert/wal.js';

const walPalette = await getWalPalette();
const catppuccinPalette = await getCatppuccinPalette(walPalette);
const paletteScore = getPaletteScore(walPalette, catppuccinPalette);
const sortedPalette = sortPalette(catppuccinPalette, paletteScore);

debugPalette(sortedPalette);

console.log(
	`catppuccin-${catppuccinPalette.index}-${sortedPalette[0].index}-compact+default`,
);
