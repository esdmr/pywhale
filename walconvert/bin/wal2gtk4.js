#!/usr/bin/env node
import process from 'node:process';
import { getPaletteScore, sortPalette, debugPalette } from 'walconvert/score.js';
import { getWalPalette } from 'walconvert/wal.js';
import { gtkPalette } from 'walconvert/gtk4.js';
import { getCatppuccinPalette } from 'walconvert/catppuccin.js';

const walPalette = await getWalPalette();
const paletteScore = getPaletteScore(walPalette, gtkPalette);
const sortedPalette = sortPalette(gtkPalette, paletteScore);

const catppuccinPalette = await getCatppuccinPalette(walPalette);
const catppuccinPaletteScore = getPaletteScore(walPalette, catppuccinPalette);
const catppuccinSortedPalette = sortPalette(
    catppuccinPalette,
    catppuccinPaletteScore,
);

const gtkFallbackComparisonIndex = Number(
    process.env.walconvert_gtk_fallback || 4,
);

if (
    sortedPalette[0].score >=
    catppuccinSortedPalette[gtkFallbackComparisonIndex].score
) {
    debugPalette(sortedPalette);
    console.log(`@${sortedPalette[0].index}_4`);
} else {
    debugPalette(catppuccinSortedPalette);
    console.log(catppuccinSortedPalette[0].hex);
}
