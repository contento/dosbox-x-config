# CLAUDE.md

Guidance for Claude Code when working in this repository.

> **Sync note**: this file and [copilot-instructions.md](copilot-instructions.md) cover the same project guidance for different assistants. When you change one, update the other so both stay aligned. Project tasks live in [TODO.md](TODO.md) — keep it current as work lands or new items surface.

## What this repo is

Stand-alone repository for a canonical DOSBox-X user preferences file, global defaults documentation, and cross-platform install helpers. Designed to be published publicly and synced across machines.

## Files

- [dosbox-x-global-defaults.md](dosbox-x-global-defaults.md) — recommended global defaults, section-by-section explanation.
- [DOSBox-X.Preferences](DOSBox-X.Preferences) — current source-of-truth user preferences (INI file, despite the name).
- [DOSBox-X.Preferences.initiator](DOSBox-X.Preferences.initiator) — original snapshot before customization; kept for diffing.
- [install-config.sh](install-config.sh) — macOS / Linux installer.
- [install-config.ps1](install-config.ps1) — Windows installer.
- [README.md](README.md) — public-facing documentation.

## Working rules

- Edits should be relevant to the config files, install scripts, or documentation. No unrelated refactors.
- Keep changes consistent with DOSBox-X INI syntax and shell / PowerShell conventions.
- Solutions must remain compatible with macOS, Linux, and Windows.
- The DOSBox-X version string (currently `2026.05.02`) appears in [README.md](README.md), [install-config.sh](install-config.sh), and [install-config.ps1](install-config.ps1). Update all three together.
- `DOSBox-X.Preferences` is large (~116 KB INI). Prefer targeted edits to specific sections over rewrites. Do not reorder or strip comments — the file is meant to round-trip with DOSBox-X's own writer.
- Do not edit `DOSBox-X.Preferences.initiator`. It is the frozen baseline used for `diff` against the current preferences.

## README style

- Concise title, short description, supported platforms, install per platform.
- Match the structure used across the user's other repositories.

## Communication style

- Answer succinctly and directly.
- Highlight the exact files changed.
- Use markdown links (`[file](path)`) for any file reference, per the user's IDE rendering.

## Tasks

Track ongoing work in [TODO.md](TODO.md). When you complete an item, remove or check it off; when you discover a new one, add it.
