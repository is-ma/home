#!/usr/bin/env bash
# switch2go.sh — Modo "exprimir suscripción Go"
# Asigna modelos del proveedor Go (opencode-go/*) a todos los agentes,
# priorizando los modelos premium (Qwen, Kimi) donde más aportan.
# Ideal para aprovechar al máximo los tokens contratados del mes.
# Uso: bash switch2go.sh

set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STOW_DIR="$HOME/is-ma/home/targets/opencode"

_subst() {
  < "$1" \
    sed "s|OMO_AGENT__MULTIMODAL_LOOKER|opencode-go/mimo-v2.5-pro|g" |      # 6.45K/mes — único que necesita multimodal
    sed "s|OMO_AGENT__SISYPHUS_JUNIOR|opencode-go/deepseek-v4-flash|g" |    # 158K/mes — junior = Flash
    sed "s|OMO_AGENT__HEPHAESTUS|opencode-go/qwen3.6-plus|g" |              # 16K/mes — implementación técnica
    sed "s|OMO_AGENT__PROMETHEUS|opencode-go/kimi-k2.6|g" |                 # 5.75K/mes — arquitectura, merece el gasto
    sed "s|OMO_AGENT__LIBRARIAN|opencode-go/deepseek-v4-flash|g" |          # 158K/mes — indexación, puro Flash
    sed "s|OMO_AGENT__SISYPHUS|opencode-go/deepseek-v4-flash|g" |           # 158K/mes — trabajo de hormiga
    sed "s|OMO_AGENT__EXPLORE|opencode-go/deepseek-v4-flash|g" |            # 158K/mes — exploración de código
    sed "s|OMO_AGENT__ORACLE|opencode-go/deepseek-v4-flash|g" |             # 158K/mes — consultas repetitivas
    sed "s|OMO_AGENT__ATLAS|opencode-go/deepseek-v4-pro|g" |                # 17K/mes — orquestación/contexto largo
    sed "s|OMO_AGENT__METIS|opencode-go/qwen3.5-plus|g" |                   # 50K/mes — sabiduría práctica, buen balance
    sed "s|OMO_AGENT__MOMUS|opencode-go/deepseek-v4-flash|g" |              # 158K/mes — crítica mecánica, Flash sobra
    sed "s|OMO_CATEGORY__VISUAL_ENGINEERING|opencode-go/qwen3.5-plus|g" |   # 50K/mes — UI/frontend, buen lenguaje
    sed "s|OMO_CATEGORY__UNSPECIFIED_HIGH|opencode-go/qwen3.5-plus|g" |     # 50K/mes — algo más de creatividad
    sed "s|OMO_CATEGORY__UNSPECIFIED_LOW|opencode-go/deepseek-v4-flash|g" | # 158K/mes
    sed "s|OMO_CATEGORY__ULTRABRAIN|opencode-go/deepseek-v4-flash|g" |      # 158K/mes — para vibe coding con FastAPI, Flash basta
    sed "s|OMO_CATEGORY__ARTISTRY|opencode-go/qwen3.5-plus|g" |             # 50K/mes — lenguaje natural, creatividad
    sed "s|OMO_CATEGORY__WRITING|opencode-go/qwen3.5-plus|g" |              # 50K/mes — redacción fluida
    sed "s|OMO_CATEGORY__QUICK|opencode-go/deepseek-v4-flash|g" |           # 158K/mes — rápido y al punto
    sed "s|OMO_CATEGORY__DEEP|opencode-go/qwen3.6-plus|g" |                 # 16K/mes — análisis profundo cuando aplica
    sed "s|DEEP_TERMINAL|opencode-go/deepseek-v4-flash|g" |
    sed "s|DEEP_GENIUS|opencode-go/deepseek-v4-pro|g" |
    sed "s|DEEP_JUNIOR|opencode-go/deepseek-v4-flash|g" |
    sed "s|DEEP_BRO|opencode-go/deepseek-v4-flash|g"
}

mkdir -p "$STOW_DIR"
_subst "$DIR/opencode__base.jsonc"        > "$STOW_DIR/opencode.jsonc"
_subst "$DIR/oh-my-openagent__base.jsonc"  > "$STOW_DIR/oh-my-openagent.jsonc"

# --- Symlinks hacia ~/.config/opencode/ ---
mkdir -p "$HOME/.config/opencode"
ln -sf "$STOW_DIR/opencode.jsonc"            "$HOME/.config/opencode/opencode.jsonc"
ln -sf "$STOW_DIR/oh-my-openagent.jsonc"     "$HOME/.config/opencode/oh-my-openagent.jsonc"

echo "Configs regenerados desde templates __base (Go)"
