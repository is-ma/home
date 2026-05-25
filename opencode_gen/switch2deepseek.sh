#!/usr/bin/env bash
# switch2deepseek.sh — Modo "compensación DeepSeek"
# Cambia todos los agentes al proveedor DeepSeek (deepseek/*) cuando
# la suscripción Go se agota antes de fin de mes. Usa Flash para el
# día a día y Pro solo para lo que realmente lo necesita, estirando
# el presupuesto hasta que se renueve Go.
# Uso: bash switch2deepseek.sh

set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STOW_DIR="$HOME/is-ma/home/stowing/opencode"

_subst() {
  < "$1" \
    sed "s|OMO_CATEGORY__VISUAL_ENGINEERING|deepseek/deepseek-v4-flash|g" |
    sed "s|OMO_CATEGORY__UNSPECIFIED_HIGH|deepseek/deepseek-v4-flash|g" |
    sed "s|OMO_CATEGORY__UNSPECIFIED_LOW|deepseek/deepseek-v4-flash|g" |
    sed "s|OMO_AGENT__MULTIMODAL_LOOKER|deepseek/deepseek-v4-flash|g" |
    sed "s|OMO_AGENT__SISYPHUS_JUNIOR|deepseek/deepseek-v4-flash|g" |
    sed "s|OMO_CATEGORY__ULTRABRAIN|deepseek/deepseek-v4-flash|g" |
    sed "s|OMO_CATEGORY__ARTISTRY|deepseek/deepseek-v4-flash|g" |
    sed "s|OMO_CATEGORY__WRITING|deepseek/deepseek-v4-flash|g" |
    sed "s|OMO_AGENT__SISYPHUS|deepseek/deepseek-v4-flash|g" |
    sed "s|OMO_AGENT__PROMETHEUS|deepseek/deepseek-v4-pro|g" |
    sed "s|OMO_AGENT__LIBRARIAN|deepseek/deepseek-v4-flash|g" |
    sed "s|OMO_CATEGORY__QUICK|deepseek/deepseek-v4-flash|g" |
    sed "s|OMO_AGENT__HEPHAESTUS|deepseek/deepseek-v4-flash|g" |
    sed "s|OMO_CATEGORY__DEEP|deepseek/deepseek-v4-flash|g" |
    sed "s|OMO_AGENT__EXPLORE|deepseek/deepseek-v4-flash|g" |
    sed "s|OMO_AGENT__ORACLE|deepseek/deepseek-v4-flash|g" |
    sed "s|OMO_AGENT__METIS|deepseek/deepseek-v4-flash|g" |
    sed "s|OMO_AGENT__ATLAS|deepseek/deepseek-v4-flash|g" |
    sed "s|OMO_AGENT__MOMUS|deepseek/deepseek-v4-flash|g" |
    sed "s|DEEP_TERMINAL|deepseek/deepseek-v4-flash|g" |
    sed "s|DEEP_GENIUS|deepseek/deepseek-v4-pro|g" |
    sed "s|DEEP_JUNIOR|deepseek/deepseek-v4-flash|g" |
    sed "s|DEEP_BRO|deepseek/deepseek-v4-flash|g"
}

mkdir -p "$STOW_DIR"
_subst "$DIR/opencode__base.jsonc"        > "$STOW_DIR/opencode.jsonc"
_subst "$DIR/oh-my-openagent__base.jsonc"  > "$STOW_DIR/oh-my-openagent.jsonc"

# --- Symlinks hacia ~/.config/opencode/ ---
mkdir -p "$HOME/.config/opencode"
ln -sf "$STOW_DIR/opencode.jsonc"            "$HOME/.config/opencode/opencode.jsonc"
ln -sf "$STOW_DIR/oh-my-openagent.jsonc"     "$HOME/.config/opencode/oh-my-openagent.jsonc"

echo "Configs regenerados desde templates __base (DeepSeek)"
