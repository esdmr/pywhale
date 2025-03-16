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
- Catppuccin theme for GTK (yes, the deprecated one)
- Node.js
- pnpm, probably through corepack

## Setup

1. `git clone https://github.com/esdmr/pywhale.git`
2. `cd pywhale/wal2catppuccin`
3. `pnpm i -P`
4. `pnpm link -g`
5. `cd ..`
6. `fisher install .`
7.  `pywhale update --set-image <path>`, Dark Reader settings should open.
8.  In dev console, run the copied script.
9.  Close Dark Reader tab.

## Usage

- Change the wallpaper image: `pywhale update --set-image <path>`.
  1. This will open the Dark Reader settings.
  2. In dev console, run the copied script.
  3. Close Dark Reader tab.
- Force dark or light theme: `pywhale update --force <light|dark>`.
- Change pywal options: `pywhale update -- <options...>`.
- Update the theme according to preset schedule: `pywhale update`. (Between 05:30 and 17:30, it will use a light theme.)

## Update

1. `cd pywhale/wal2catppuccin`
2. `git pull`
3. `pnpm i -P`
4. `cd ..`
5. `fisher install .`
6.  `pywhale update`

## Uninstall

1. `cd pywhale`
2. `fisher remove .`
3. `cd wal2catppuccin`
4. `pnpm unlink -g`
5. `cd ../..`
6. `rm pywhale`
