#!/usr/bin/env node
import { getPaletteScore, sortPalette, debugPalette } from 'walconvert/score.js';
import { getWalPalette } from 'walconvert/wal.js';
import { gnomeIconsPalette } from 'walconvert/gnome-icons.js';

const walPalette = await getWalPalette();
const paletteScore = getPaletteScore(walPalette, gnomeIconsPalette);
const sortedPalette = sortPalette(gnomeIconsPalette, paletteScore);

debugPalette(sortedPalette);
console.log(sortedPalette[0].index);
