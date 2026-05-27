# AGENTS.md

## Project Overview

**Primary Goal**: Single source of truth to reproduce a full Debian/i3wm environment on any new machine — packages, dotfiles, system configs, scripts, fonts, everything. A fresh install should take hours, not weeks.

**Secondary Goal**: `cheatsheets/` are portable skill-training gyms, not just quick reference docs.

### Two-Phase Setup
1. **System packages**: run `setup_debian.sh` after a fresh Debian install.
2. **Dotfiles linking**: run `setup_targets.sh` to symlink config files into `$HOME`.

### Non-Home System Changes
System-level changes (outside `$HOME`) are documented as markdown notes in `sys_configs/`.

---

## Directory Map

```
.
├── setup_debian.sh          # apt packages, system-level setup
├── setup_targets.sh         # symlinks dotfiles from targets/ into $HOME
├── targets/                 # actual dotfile configs
│   ├── alacritty/
│   ├── bash/
│   ├── custom_scripts/
│   ├── dunst/
│   ├── espanso/
│   ├── fonts/
│   ├── git/
│   ├── helix_conf/
│   ├── helix_themes/
│   ├── i3/
│   ├── i3blocks/           # bar scripts with Gruvbox Material Dark palette
│   ├── i3status/           # legacy, superseded by i3blocks
│   ├── opencode/
│   ├── rg/
│   ├── rofi/
│   └── wallapers/
├── sys_configs/            # system-level notes (hibernate, deep sleep, etc.)
├── cheatsheets/            # quick reference docs
└── generators/             # code generators / templates
```

---

## Agent Rules

### When Installing New Tools

- **`apt install` (simple)**: add to `setup_debian.sh` with a comment.
- **`apt install` (complex)**: add to `setup_debian.sh` + reference a `sys_configs/` note if needed.
- **Non-apt installs** (build from source, pip, go install, etc.): write a note in `sys_configs/` with exact steps.
- **After adding a tool**: document how to verify it's working.

### When Modifying Configs in `$HOME`

1. **Never edit in place** inside `$HOME/.config/...` directly.
2. Instead: edit the source in `targets/`, then run `setup_targets.sh` to refresh symlinks.
3. If the config file doesn't exist in `targets/`, create it there first, then symlink.
4. If it's a custom script/binary that goes into `~/.local/bin/`, add it to `targets/custom_scripts/` and symlink from there.

### When Modifying System Files (outside `$HOME`)

- Do NOT modify `/etc` or system paths without first checking if a `sys_configs/` note exists.
- If you modify a system file, create or update the corresponding `sys_configs/*.md` note.
- Prefer drop-in configs (e.g., `/etc/systemd/logind.conf.d/`) over editing system defaults.

---

## Tech Stack

| Layer | Tool |
|-------|------|
| OS | Debian |
| WM | i3wm |
| Status bar | i3blocks (Gruvbox Material Dark palette) |
| Terminal | Alacritty |
| Editor | Helix |
| Shell | Bash |
| App launcher | Rofi |
| Notifications | Dunst |
| Text expander | Espanso |
| Fonts | MesloLGS Nerd Font Mono |

---

## Palette

Current i3blocks bar uses **Gruvbox Material Dark** (sunburnt, muted, no neon):

| Block | Hex | Role |
|-------|-----|------|
| WiFi | `#458588` | blue |
| BAT | `#98971a` | green moss |
| VOL | `#d65d0e` | burnt orange |
| CPU | `#d79921` | sun yellow |
| MEM | `#b16286` | purple |
| TIME | `#cc241d` | brick red |
| CAPS on | `#ffffff` | white |
| CAPS off | `#504945` | dark gray |

---

## Verification (QA)

- **i3 changes**: run `i3-msg reload` and visually confirm.
- **i3blocks changes**: run `timeout 3 i3blocks -c ~/.config/i3blocks/config` to inspect output.
- **Dotfiles**: run `setup_targets.sh` and verify symlinks with `ls -la ~/.config/...`
- **New tools**: test the command manually before considering done.

---

## Notes for Agents

- The user prefers **minimal, manual, visual QA** — no heavy test frameworks.
- This repo is personal but migration-ready; keep configs portable.
- Do NOT add features "just because"; ask before scope creep.
- When in doubt: document in `sys_configs/`, don't assume system state.
- **tmux** is on the roadmap (future addition).
