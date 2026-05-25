#!/usr/bin/env bash
# switch2deepseek.sh - Exporta variables de modelo DeepSeek
# Uso: source switch2deepseek.sh   (para activar en la shell actual)
#       bash switch2deepseek.sh    (para ejecutar y generar config)

export DEEP_BRO="deepseek/deepseek-v4-flash"
export DEEP_JUNIOR="deepseek/deepseek-v4-flash"
export DEEP_GENIUS="deepseek/deepseek-v4-pro"

# Si se ejecuta (no sourced), también regenera el config real desde el template
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  envsubst < "$DIR/opencode_base.jsonc" > "$DIR/opencode.jsonc"
  echo "✔ Variables DeepSeek exportadas y opencode.jsonc regenerado desde opencode_base.jsonc"
fi
