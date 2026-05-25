# DOSBox-X Config

```text
  o  o
\______/
  |
     |    https://conten.to
--------
```

Stand-alone repository for a canonical DOSBox-X user preferences file and global defaults.

Suggested public GitHub repository name: `contento/dosbox-x-config`

## What is included

- `dosbox-x-global-defaults.md` — recommended global defaults for DOSBox-X sessions.
- `DOSBox-X.Preferences.initiator` — original preferences snapshot before the current config was applied.
- `DOSBox-X.Preferences` — current source-of-truth user preferences.
- `install-config.sh` — installer for macOS and Linux.
- `install-config.ps1` — installer for Windows.

## Highlights vs stock DOSBox-X

This config is a tuned preferences file — no engine modifications. The most notable changes over a fresh DOSBox-X install:

- **Memory** — `memsize=256` MB for headroom on late-DOS / early-Win9x titles.
- **CPU** — `core=dynamic_x86`, `cputype=pentium_iii`, `cycles=max 105%` for stronger emulation throughput.
- **Scaler** — `scaler=normal2x` for crisp integer pixel-doubling (no edge smoothing).
- **Output** — `output=openglpp` (OpenGL pixel-perfect): nearest-neighbor sampling with integer scaling, so each emulated pixel maps to an exact N×N block on screen. Sharpest result for retro content.

See [dosbox-x-global-defaults.md](dosbox-x-global-defaults.md) for the full section-by-section rationale.

## Supported platforms

- macOS
- Linux
- Windows

## Install

Run from the repo root.

### macOS

```bash
./install-config.sh
```

This copies `DOSBox-X.Preferences` into `~/Library/Preferences/DOSBox-X 2026.05.02 Preferences`.

### Linux

```bash
./install-config.sh
```

This copies the repo preferences into `~/.config/dosbox-x/dosbox-x.conf`.

### Windows

```powershell
.\install-config.ps1
```

By default, this installs to `$Env:LOCALAPPDATA\DOSBox-X\dosbox-x-2026.05.02.conf` — the versioned filename DOSBox-X reads on Windows.
Use `-Destination` to override the path if your installation stores preferences elsewhere.

## Sync

Run from the repo root. Push host → repo (after editing in DOSBox-X's UI):

```bash
cp ~/Library/Preferences/"DOSBox-X "*" Preferences" ./DOSBox-X.Preferences
```

Push repo → host:

```bash
cp ./DOSBox-X.Preferences ~/Library/Preferences/"DOSBox-X 2026.05.02 Preferences"
```

Adjust the version string to match whichever DOSBox-X build is installed.

## Diff against the initiator

```bash
diff -u DOSBox-X.Preferences.initiator DOSBox-X.Preferences
```

## Notes

This repository is designed to be published publicly as a standalone DOSBox-X config repo.
The file layout is intentionally stable so the preferences file can be synced across machines and platforms.
