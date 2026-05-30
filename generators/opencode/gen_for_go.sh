#!/usr/bin/env bash
# switch2go.sh — Modo "exprimir suscripción Go" (v2, MiMo-optimized)
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STOW_DIR="$HOME/is-ma/home/targets/opencode"

_subst() {
  < "$1" \
    sed "s|OMO_AGENT__MULTIMODAL_LOOKER|opencode-go/mimo-v2.5-pro|g" |      # 16K/mes — multimodal nativo
    sed "s|OMO_AGENT__PROMETHEUS|opencode-go/mimo-v2.5-pro|g" |             # 16K/mes — Agentic #7, 3x más calls que Kimi
    sed "s|OMO_AGENT__ATLAS|opencode-go/mimo-v2.5-pro|g" |                  # 16K/mes — Agentic #7, supera a DS Pro
    sed "s|OMO_AGENT__HEPHAESTUS|opencode-go/mimo-v2.5-pro|g" |             # 16K/mes — Coding #18, benchmark probado
    sed "s|OMO_AGENT__METIS|opencode-go/mimo-v2.5|g" |                      # 150K/mes — Agentic #14, como Flash pero más listo
    sed "s|OMO_AGENT__SISYPHUS_JUNIOR|opencode-go/mimo-v2.5|g" |            # 150K/mes — junior = casi-Flash
    sed "s|OMO_AGENT__SISYPHUS|opencode-go/mimo-v2.5|g" |                   # 150K/mes — hormiga más inteligente
    sed "s|OMO_AGENT__MOMUS|opencode-go/mimo-v2.5|g" |                      # 150K/mes — crítica mecánica
    sed "s|OMO_AGENT__ORACLE|opencode-go/mimo-v2.5|g" |                     # 150K/mes — consultas
    sed "s|OMO_AGENT__EXPLORE|opencode-go/mimo-v2.5|g" |                    # 150K/mes — exploración
    sed "s|OMO_AGENT__LIBRARIAN|opencode-go/mimo-v2.5|g" |                  # 150K/mes — indexación
    sed "s|OMO_CATEGORY__VISUAL_ENGINEERING|opencode-go/mimo-v2.5|g" |      # 150K/mes — UI/frontend
    sed "s|OMO_CATEGORY__UNSPECIFIED_HIGH|opencode-go/mimo-v2.5|g" |        # 150K/mes
    sed "s|OMO_CATEGORY__UNSPECIFIED_LOW|opencode-go/mimo-v2.5|g" |         # 150K/mes
    sed "s|OMO_CATEGORY__ULTRABRAIN|opencode-go/mimo-v2.5|g" |              # 150K/mes — FastAPI no necesita más
    sed "s|OMO_CATEGORY__ARTISTRY|opencode-go/mimo-v2.5|g" |                # 150K/mes
    sed "s|OMO_CATEGORY__WRITING|opencode-go/mimo-v2.5|g" |                 # 150K/mes
    sed "s|OMO_CATEGORY__QUICK|opencode-go/mimo-v2.5|g" |                   # 150K/mes
    sed "s|OMO_CATEGORY__DEEP|opencode-go/mimo-v2.5-pro|g" |                # 16K/mes — análisis profundo
    sed "s|DEEP_TERMINAL|opencode-go/mimo-v2.5|g" |
    sed "s|DEEP_GENIUS|opencode-go/mimo-v2.5-pro|g" |
    sed "s|DEEP_JUNIOR|opencode-go/mimo-v2.5|g" |
    sed "s|DEEP_BRO|opencode-go/mimo-v2.5|g" |
    sed "s|GROK_BRO|openrouter/x-ai/grok-4.20|g" |
    sed "s|GEMINI_BRO|openrouter/google/gemini-3.1-flash-lite|g"
}

mkdir -p "$STOW_DIR"
_subst "$DIR/opencode__base.jsonc"        > "$STOW_DIR/opencode.jsonc"
_subst "$DIR/oh-my-openagent__base.jsonc"  > "$STOW_DIR/oh-my-openagent.jsonc"

mkdir -p "$HOME/.config/opencode"
ln -sf "$STOW_DIR/opencode.jsonc"            "$HOME/.config/opencode/opencode.jsonc"
ln -sf "$STOW_DIR/oh-my-openagent.jsonc"     "$HOME/.config/opencode/oh-my-openagent.jsonc"

echo "Configs regenerados desde templates __base (Go v2 - MiMo-optimized)"
 