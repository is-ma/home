#!/usr/bin/env bash
set -euo pipefail

TARGETS=/home/rich/is-ma/home/targets

# alacritty
ORIG="$HOME/.config/alacritty/alacritty.toml"
DEST="$TARGETS/alacritty/alacritty.toml"
mkdir -p "$(dirname "$ORIG")"
ln -sf "$DEST" "$ORIG"

# dunst
ORIG="$HOME/.config/dunst/dunstrc"
DEST="$TARGETS/dunst/dunstrc"
mkdir -p "$(dirname "$ORIG")"
ln -sf "$DEST" "$ORIG"

ORIG="$HOME/.config/dunst/icq-uh-oh-padded.wav"
DEST="$TARGETS/dunst/icq-uh-oh-padded.wav"
ln -sf "$DEST" "$ORIG"

ORIG="$HOME/.config/dunst/scripts/opencode-sound.sh"
DEST="$TARGETS/dunst/scripts/opencode-sound.sh"
mkdir -p "$(dirname "$ORIG")"
ln -sf "$DEST" "$ORIG"

# espanso
ORIG="$HOME/.config/espanso/match/base.yml"
DEST="$TARGETS/espanso/base.yml"
mkdir -p "$(dirname "$ORIG")"
ln -sf "$DEST" "$ORIG"

ORIG="$HOME/.config/espanso/match/emojis.yml"
DEST="$TARGETS/espanso/emojis.yml"
ln -sf "$DEST" "$ORIG"

# helix
ORIG="$HOME/.config/helix/config.toml"
DEST="$TARGETS/helix_conf/config.toml"
mkdir -p "$(dirname "$ORIG")"
ln -sf "$DEST" "$ORIG"

ORIG="$HOME/.config/helix/runtime/themes/gruvbox_rich.toml"
DEST="$TARGETS/helix_themes/gruvbox_rich.toml"
mkdir -p "$(dirname "$ORIG")"
ln -sf "$DEST" "$ORIG"

# i3
ORIG="$HOME/.config/i3/config"
DEST="$TARGETS/i3/config"
mkdir -p "$(dirname "$ORIG")"
ln -sf "$DEST" "$ORIG"

# i3status
ORIG="$HOME/.config/i3status/config"
DEST="$TARGETS/i3status/config"
mkdir -p "$(dirname "$ORIG")"
ln -sf "$DEST" "$ORIG"

# opencode
ORIG="$HOME/.config/opencode/opencode.jsonc"
DEST="$TARGETS/opencode/opencode.jsonc"
mkdir -p "$(dirname "$ORIG")"
ln -sf "$DEST" "$ORIG"

ORIG="$HOME/.config/opencode/ocx.jsonc"
DEST="$TARGETS/opencode/ocx.jsonc"
ln -sf "$DEST" "$ORIG"

ORIG="$HOME/.config/opencode/kdco-notify.json"
DEST="$TARGETS/opencode/kdco-notify.json"
ln -sf "$DEST" "$ORIG"

ORIG="$HOME/.config/opencode/oh-my-openagent.jsonc"
DEST="$TARGETS/opencode/oh-my-openagent.jsonc"
ln -sf "$DEST" "$ORIG"

# rofi
ORIG="$HOME/.config/rofi/config.rasi"
DEST="$TARGETS/rofi/config.rasi"
mkdir -p "$(dirname "$ORIG")"
ln -sf "$DEST" "$ORIG"

# custom scripts
ORIG="$HOME/.local/bin/center_title.py"
DEST="$TARGETS/custom_scripts/center_title.py"
mkdir -p "$(dirname "$ORIG")"
ln -sf "$DEST" "$ORIG"
