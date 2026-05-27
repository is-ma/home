#!/usr/bin/env bash
set -euo pipefail

TARGETS=/home/rich/is-ma/home/targets

# alacritty
THIS_FILE="$HOME/.config/alacritty/alacritty.toml"
POINTS_TO="$TARGETS/alacritty/alacritty.toml"
mkdir -p "$(dirname "$THIS_FILE")"
ln -sf "$POINTS_TO" "$THIS_FILE"

# custom scripts
THIS_FILE="$HOME/.local/bin/center_title.py"
POINTS_TO="$TARGETS/custom_scripts/center_title.py"
mkdir -p "$(dirname "$THIS_FILE")"
ln -sf "$POINTS_TO" "$THIS_FILE"

# dunst
THIS_FILE="$HOME/.config/dunst/dunstrc"
POINTS_TO="$TARGETS/dunst/dunstrc"
mkdir -p "$(dirname "$THIS_FILE")"
ln -sf "$POINTS_TO" "$THIS_FILE"

THIS_FILE="$HOME/.config/dunst/icq-uh-oh-padded.wav"
POINTS_TO="$TARGETS/dunst/icq-uh-oh-padded.wav"
ln -sf "$POINTS_TO" "$THIS_FILE"

THIS_FILE="$HOME/.config/dunst/scripts/opencode-sound.sh"
POINTS_TO="$TARGETS/dunst/scripts/opencode-sound.sh"
mkdir -p "$(dirname "$THIS_FILE")"
ln -sf "$POINTS_TO" "$THIS_FILE"

# espanso
THIS_FILE="$HOME/.config/espanso/match/base.yml"
POINTS_TO="$TARGETS/espanso/base.yml"
mkdir -p "$(dirname "$THIS_FILE")"
ln -sf "$POINTS_TO" "$THIS_FILE"

THIS_FILE="$HOME/.config/espanso/match/emojis.yml"
POINTS_TO="$TARGETS/espanso/emojis.yml"
ln -sf "$POINTS_TO" "$THIS_FILE"

## fonts
THIS_FILE="$HOME/.local/share/fonts/MesloLGMDZNerdFontMono-BoldItalic.ttf"
POINTS_TO="$TARGETS/fonts/MesloLGMDZNerdFontMono-BoldItalic.ttf"
mkdir -p "$(dirname "$THIS_FILE")"
ln -sf "$POINTS_TO" "$THIS_FILE"

THIS_FILE="$HOME/.local/share/fonts/MesloLGMDZNerdFontMono-Bold.ttf"
POINTS_TO="$TARGETS/fonts/MesloLGMDZNerdFontMono-Bold.ttf"
mkdir -p "$(dirname "$THIS_FILE")"
ln -sf "$POINTS_TO" "$THIS_FILE"

THIS_FILE="$HOME/.local/share/fonts/MesloLGMDZNerdFontMono-Italic.ttf"
POINTS_TO="$TARGETS/fonts/MesloLGMDZNerdFontMono-Italic.ttf"
mkdir -p "$(dirname "$THIS_FILE")"
ln -sf "$POINTS_TO" "$THIS_FILE"

THIS_FILE="$HOME/.local/share/fonts/MesloLGMDZNerdFontMono-Regular.ttf"
POINTS_TO="$TARGETS/fonts/MesloLGMDZNerdFontMono-Regular.ttf"
mkdir -p "$(dirname "$THIS_FILE")"
ln -sf "$POINTS_TO" "$THIS_FILE"

# git
THIS_FILE="$HOME/.gitconfig"
POINTS_TO="$TARGETS/git/dot-gitconfig"
mkdir -p "$(dirname "$THIS_FILE")"
ln -sf "$POINTS_TO" "$THIS_FILE"

# helix
THIS_FILE="$HOME/.config/helix/config.toml"
POINTS_TO="$TARGETS/helix_conf/config.toml"
mkdir -p "$(dirname "$THIS_FILE")"
ln -sf "$POINTS_TO" "$THIS_FILE"

THIS_FILE="$HOME/.config/helix/runtime/themes/gruvbox_rich.toml"
POINTS_TO="$TARGETS/helix_themes/gruvbox_rich.toml"
mkdir -p "$(dirname "$THIS_FILE")"
ln -sf "$POINTS_TO" "$THIS_FILE"

# i3
THIS_FILE="$HOME/.config/i3/config"
POINTS_TO="$TARGETS/i3/config"
mkdir -p "$(dirname "$THIS_FILE")"
ln -sf "$POINTS_TO" "$THIS_FILE"

# i3status
THIS_FILE="$HOME/.config/i3status/config"
POINTS_TO="$TARGETS/i3status/config"
mkdir -p "$(dirname "$THIS_FILE")"
ln -sf "$POINTS_TO" "$THIS_FILE"

# opencode
THIS_FILE="$HOME/.config/opencode/opencode.jsonc"
POINTS_TO="$TARGETS/opencode/opencode.jsonc"
mkdir -p "$(dirname "$THIS_FILE")"
ln -sf "$POINTS_TO" "$THIS_FILE"

THIS_FILE="$HOME/.config/opencode/ocx.jsonc"
POINTS_TO="$TARGETS/opencode/ocx.jsonc"
ln -sf "$POINTS_TO" "$THIS_FILE"

THIS_FILE="$HOME/.config/opencode/kdco-notify.json"
POINTS_TO="$TARGETS/opencode/kdco-notify.json"
ln -sf "$POINTS_TO" "$THIS_FILE"

THIS_FILE="$HOME/.config/opencode/oh-my-openagent.jsonc"
POINTS_TO="$TARGETS/opencode/oh-my-openagent.jsonc"
ln -sf "$POINTS_TO" "$THIS_FILE"

# rofi
THIS_FILE="$HOME/.config/rofi/config.rasi"
POINTS_TO="$TARGETS/rofi/config.rasi"
mkdir -p "$(dirname "$THIS_FILE")"
ln -sf "$POINTS_TO" "$THIS_FILE"

