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

## Supported platforms

- macOS
- Linux
- Windows

## Install

### macOS

```bash
cd ~/Projects/contento/windows-scripts/dosbox-x-config
./install-config.sh
```

This copies `DOSBox-X.Preferences` into `~/Library/Preferences/DOSBox-X 2026.05.02 Preferences`.

### Linux

```bash
cd ~/Projects/contento/windows-scripts/dosbox-x-config
./install-config.sh
```

This copies the repo preferences into `~/.config/dosbox-x/dosbox-x.conf`.

### Windows

```powershell
cd $HOME\Projects\contento\windows-scripts\dosbox-x-config
.\install-config.ps1
```

By default, this installs to `$Env:LOCALAPPDATA\DOSBox-X\DOSBox-X 2026.05.02 Preferences`.
Use `-Destination` to override the path if your installation stores preferences elsewhere.

## Sync

Push host → repo (after editing in DOSBox-X's UI):

```bash
cp ~/Library/Preferences/"DOSBox-X "*" Preferences" \
   ~/Projects/contento/windows-scripts/dosbox-x-config/DOSBox-X.Preferences
```

Push repo → host:

```bash
cp ~/Projects/contento/windows-scripts/dosbox-x-config/DOSBox-X.Preferences \
   ~/Library/Preferences/"DOSBox-X 2026.05.02 Preferences"
```

Adjust the version string to match whichever DOSBox-X build is installed.

## Diff against the initiator

```bash
diff -u dosbox-x-config/DOSBox-X.Preferences.initiator dosbox-x-config/DOSBox-X.Preferences
```

## Notes

This repository is designed to be published publicly as a standalone DOSBox-X config repo.
The file layout is intentionally stable so the preferences file can be synced across machines and platforms.
