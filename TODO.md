# TODO

Working task list for `dosbox-x-config`.

> **Sync note**: assistant guidance lives in [CLAUDE.md](CLAUDE.md) and [copilot-instructions.md](copilot-instructions.md). Keep those two in sync with each other. Keep this file current — check items off or remove them as they land, add new ones as they surface.

## Open

### Documentation drift — high priority

[dosbox-x-global-defaults.md](dosbox-x-global-defaults.md) describes recommended values that no longer match what's actually shipped in [DOSBox-X.Preferences](DOSBox-X.Preferences). Pick one direction (doc → matches file, or file → matches doc) and reconcile:

| Setting | Doc says | Actual file |
| --- | --- | --- |
| `[dosbox] memsize` | `32` | `256` ([DOSBox-X.Preferences:250](DOSBox-X.Preferences#L250)) |
| `[render] scaler` | `normal2x` | `advmame3x` ([DOSBox-X.Preferences:326](DOSBox-X.Preferences#L326)) |
| `[cpu] core` | _(not mentioned)_ | `dynamic_x86` ([DOSBox-X.Preferences:530](DOSBox-X.Preferences#L530)) |
| `[cpu] cputype` | `pentium_mmx` | `pentium_iii` ([DOSBox-X.Preferences:534](DOSBox-X.Preferences#L534)) |
| `[cpu] cycles` | `max` | `max 105%` ([DOSBox-X.Preferences:535](DOSBox-X.Preferences#L535)) |

### Repository hygiene

- [ ] Add a `LICENSE` file (siblings — [dotfiles](../dotfiles/LICENSE), [smarttar](../smarttar/LICENSE), [linux-dev](../linux-dev/LICENSE), [windows-scripts](../windows-scripts/LICENSE) — all use MIT). This repo currently has none, which blocks public publication.
- [ ] Add a `.gitignore` (at minimum: `.DS_Store`, editor swap files).

### Bugs

- [ ] [README.md](README.md) install instructions reference `~/Projects/contento/windows-scripts/dosbox-x-config`, but the actual repo path is `~/Projects/contento/dosbox-x-config`. Fix the `cd` lines and the sync snippets in the macOS, Linux, and Windows sections.

### Improvements

- [ ] DOSBox-X version `2026.05.02` is hardcoded in [README.md](README.md), [install-config.sh](install-config.sh), and [install-config.ps1](install-config.ps1). Extract to a single source (e.g. a `VERSION` file or a shell variable at the top of each script) so future bumps are one-line changes.
- [ ] Linux destination in [install-config.sh:19-20](install-config.sh#L19-L20) writes to `~/.config/dosbox-x/dosbox-x.conf`, but the file is named `DOSBox-X 2026.05.02 Preferences` on macOS/Windows. Confirm Linux DOSBox-X actually reads `dosbox-x.conf` (not a versioned filename) and document the asymmetry.
- [ ] Verify on a real Windows DOSBox-X install that `$Env:LOCALAPPDATA\DOSBox-X\DOSBox-X 2026.05.02 Preferences` (what [install-config.ps1](install-config.ps1) writes, matching [README.md:48](README.md#L48)) is actually where DOSBox-X loads the user config from.
- [ ] Consider adding `sync-from-host.sh` / `sync-to-host.sh` (or a single `sync.sh` with a direction flag) so the manual `cp` snippets in the README's Sync section become one command per direction. Mirror in PowerShell for Windows.
- [ ] Both install scripts overwrite the destination unconditionally (`cp -f` / `Copy-Item -Force`). Consider taking a one-time backup of the existing host file before overwriting (e.g. `*.bak.YYYY-MM-DD`), so first-time runs are non-destructive.

## Done

- [x] Add the standard `conten.to` ASCII header to [README.md](README.md), matching the style used in sibling repos (dotfiles, smarttar, linux-dev, windows-scripts).
