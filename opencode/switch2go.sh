#!/usr/bin/env bash
# switch2go.sh - Sustituye placeholders en templates __base
#               y genera opencode.jsonc / oh-my-openagent.jsonc
# Uso: bash switch2go.sh

set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

_subst() {
  < "$1" \
    sed "s|OMO_CATEGORY__VISUAL_ENGINEERING|opencode-go/qwen3.5-plus|g" |
    sed "s|OMO_CATEGORY__UNSPECIFIED_HIGH|opencode-go/qwen3.5-plus|g" |
    sed "s|OMO_CATEGORY__UNSPECIFIED_LOW|opencode-go/deepseek-v4-flash|g" |
    sed "s|OMO_AGENT__MULTIMODAL_LOOKER|opencode-go/mimo-v2.5-pro|g" |
    sed "s|OMO_AGENT__SISYPHUS_JUNIOR|opencode-go/deepseek-v4-flash|g" |
    sed "s|OMO_CATEGORY__ULTRABRAIN|opencode-go/deepseek-v4-flash|g" |
    sed "s|OMO_CATEGORY__ARTISTRY|opencode-go/qwen3.5-plus|g" |
    sed "s|OMO_CATEGORY__WRITING|opencode-go/qwen3.5-plus|g" |
    sed "s|OMO_AGENT__SISYPHUS|opencode-go/deepseek-v4-flash|g" |
    sed "s|OMO_AGENT__PROMETHEUS|opencode-go/kimi-k2.6|g" |
    sed "s|OMO_AGENT__HEPHAESTUS|opencode-go/qwen3.6-plus|g" |
    sed "s|OMO_AGENT__LIBRARIAN|opencode-go/deepseek-v4-flash|g" |
    sed "s|OMO_AGENT__EXPLORE|opencode-go/deepseek-v4-flash|g" |
    sed "s|OMO_AGENT__ORACLE|opencode-go/deepseek-v4-flash|g" |
    sed "s|OMO_AGENT__METIS|opencode-go/qwen3.5-plus|g" |
    sed "s|OMO_AGENT__MOMUS|opencode-go/deepseek-v4-flash|g" |
    sed "s|OMO_AGENT__ATLAS|opencode-go/deepseek-v4-pro|g" |
    sed "s|OMO_CATEGORY__DEEP|opencode-go/qwen3.6-plus|g" |
    sed "s|OMO_CATEGORY__QUICK|opencode-go/deepseek-v4-flash|g" |
    sed "s|DEEP_TERMINAL|opencode-go/deepseek-v4-flash|g" |
    sed "s|DEEP_GENIUS|opencode-go/deepseek-v4-pro|g" |
    sed "s|DEEP_JUNIOR|opencode-go/deepseek-v4-flash|g" |
    sed "s|DEEP_BRO|opencode-go/deepseek-v4-flash|g"
}

_subst "$DIR/opencode__base.jsonc"        > "$DIR/opencode.jsonc"
_subst "$DIR/oh-my-openagent__base.jsonc"  > "$DIR/oh-my-openagent.jsonc"

# --- Symlinks hacia ~/.config/opencode/ ---
mkdir -p "$HOME/.config/opencode"
ln -sf "$DIR/opencode.jsonc"            "$HOME/.config/opencode/opencode.jsonc"
ln -sf "$DIR/oh-my-openagent.jsonc"     "$HOME/.config/opencode/oh-my-openagent.jsonc"

echo "Configs regenerados desde templates __base (Go)"
