#!/usr/bin/env bash
# switch2deepseek.sh - Exporta variables de modelo DeepSeek
# Uso: source switch2deepseek.sh   (para activar en la shell actual)
#       bash switch2deepseek.sh    (para ejecutar y generar configs)

# --- Modelos opencode.jsonc ---
export DEEP_BRO="deepseek/deepseek-v4-flash"
export DEEP_JUNIOR="deepseek/deepseek-v4-flash"
export DEEP_GENIUS="deepseek/deepseek-v4-pro"

# --- Modelos oh-my-openagent ---
export OMO_SISYPHUS="deepseek/deepseek-v4-flash"

# Agentes
export OMO_AGENT__SISYPHUS="deepseek/deepseek-v4-flash"
export OMO_AGENT__ATLAS="deepseek/deepseek-v4-flash"
export OMO_AGENT__PROMETHEUS="deepseek/deepseek-v4-pro"
export OMO_AGENT__METIS="deepseek/deepseek-v4-flash"
export OMO_AGENT__MOMUS="deepseek/deepseek-v4-flash"
export OMO_AGENT__MULTIMODAL_LOOKER="deepseek/deepseek-v4-flash"
export OMO_AGENT__ORACLE="deepseek/deepseek-v4-flash"
export OMO_AGENT__HEPHAESTUS="deepseek/deepseek-v4-flash"
export OMO_AGENT__EXPLORE="deepseek/deepseek-v4-flash"
export OMO_AGENT__LIBRARIAN="deepseek/deepseek-v4-flash"
export OMO_AGENT__SISYPHUS_JUNIOR="deepseek/deepseek-v4-flash"

# Categorías
export OMO_CATEGORY__VISUAL_ENGINEERING="deepseek/deepseek-v4-flash"
export OMO_CATEGORY__ULTRABRAIN="deepseek/deepseek-v4-flash"
export OMO_CATEGORY__DEEP="deepseek/deepseek-v4-flash"
export OMO_CATEGORY__ARTISTRY="deepseek/deepseek-v4-flash"
export OMO_CATEGORY__QUICK="deepseek/deepseek-v4-flash"
export OMO_CATEGORY__UNSPECIFIED_LOW="deepseek/deepseek-v4-flash"
export OMO_CATEGORY__UNSPECIFIED_HIGH="deepseek/deepseek-v4-flash"
export OMO_CATEGORY__WRITING="deepseek/deepseek-v4-flash"

# Variables a sustituir (lista explícita para evitar que envsubst toque $schema)
_VARS='$DEEP_BRO $DEEP_JUNIOR $DEEP_GENIUS'
_VARS="$_VARS \$OMO_SISYPHUS"
_VARS="$_VARS \$OMO_AGENT__SISYPHUS \$OMO_AGENT__ATLAS \$OMO_AGENT__PROMETHEUS"
_VARS="$_VARS \$OMO_AGENT__METIS \$OMO_AGENT__MOMUS \$OMO_AGENT__MULTIMODAL_LOOKER"
_VARS="$_VARS \$OMO_AGENT__ORACLE \$OMO_AGENT__HEPHAESTUS \$OMO_AGENT__EXPLORE"
_VARS="$_VARS \$OMO_AGENT__LIBRARIAN \$OMO_AGENT__SISYPHUS_JUNIOR"
_VARS="$_VARS \$OMO_CATEGORY__VISUAL_ENGINEERING \$OMO_CATEGORY__ULTRABRAIN"
_VARS="$_VARS \$OMO_CATEGORY__DEEP \$OMO_CATEGORY__ARTISTRY"
_VARS="$_VARS \$OMO_CATEGORY__QUICK \$OMO_CATEGORY__UNSPECIFIED_LOW"
_VARS="$_VARS \$OMO_CATEGORY__UNSPECIFIED_HIGH \$OMO_CATEGORY__WRITING"

# Si se ejecuta (no sourced), regenera ambos configs desde los templates
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

  envsubst "$_VARS" < "$DIR/opencode__base.jsonc"        > "$DIR/opencode.jsonc"
  envsubst "$_VARS" < "$DIR/oh-my-openagent__base.jsonc"  > "$DIR/oh-my-openagent.jsonc"

  echo "✔ Variables DeepSeek exportadas y configs regenerados desde templates"
fi
