# PyWhale

<div align="center"><img src="icon.svg" alt="" width="256px"></div>

Pywal functions for fish shell.

This is my attempt to integrate various components supported by Pywal.

It is tailored to my preferences and is rather opinionated, but I am open to pull requests for additional components.

## Requirements

Most of these are not strictly necessary. I will remove them once I fixed the scripts.

- Linux
- GNOME
- fish shell
- Pywal
- Firefox, with Pywalfox and Dark Reader
- bat
- gedit
- ptpython (optional)
- Musescore
- crudini
- Discord, along with pywal-discord
- Dash to Dock GNOME extension
- Catpuccin theme for GTK (yes, the deprecated one)
- Node.js
- pnpm, probably though corepack

## Setup

1. `git clone https://github.com/esdmr/pywhale.git`
2. `cd pywhale`
3. `cd wal2catppuccin`
4. `pnpm i -P`
5. `pnpm link -g`
6. `cd ..`
7. `set -U pywhale_image # Path to image, required`
8. `set -U pywhale_options # Options to pass to pywal, optional`
9. `set -U pywhale_force # Either dark or light, optional`
10. `fisher install .`
11. `pywhale_update`
