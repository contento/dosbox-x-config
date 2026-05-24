# CLAUDE Guidance for dosbox-x-config

This repository is a standalone DOSBox-X configuration project. The goal is to keep a stable preferences file and provide easy installation across supported platforms.

## Repo overview

- `DOSBox-X.Preferences`: current canonical preferences.
- `DOSBox-X.Preferences.initiator`: original snapshot for diffing and reference.
- `dosbox-x-global-defaults.md`: recommended default values.
- `install-config.sh`: installer for macOS and Linux.
- `install-config.ps1`: installer for Windows.

## Recommended approach

- Use the README as the authoritative source for install and sync instructions.
- When suggesting changes, keep them minimal and do not alter the file layout unless clearly requested.
- Document any new behavior or compatibility notes in `README.md`.

## Caller instructions

- If asked to improve install scripts, verify paths for macOS, Linux, and Windows.
- If asked to update documentation, keep it simple and platform-specific.
- If asked to create project notes, add them in `TODO.md` or the main README.
