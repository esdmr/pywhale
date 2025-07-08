#!/usr/bin/env node
import { getPaletteScore, sortPalette, debugPalette } from 'walconvert/score.js';
import { getWalPalette } from 'walconvert/wal.js';
import { yaruPalette } from 'walconvert/yaru.js';

const walPalette = await getWalPalette();
const paletteScore = getPaletteScore(walPalette, yaruPalette);
const sortedPalette = sortPalette(yaruPalette, paletteScore);

debugPalette(sortedPalette);
console.log(sortedPalette[0].index);
