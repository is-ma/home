# configs
HISTSIZE=1000                # remember 5000 commands [RAM]
HISTFILESIZE=20000           # remember 10000 commands [HDD]
HISTCONTROL=ignoreboth:erasedups # Evita comandos duplicados en el historial
HISTTIMEFORMAT="%d/%m/%y %T "    # Formato de fecha/hora para cada comando
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND" # Sincroniza el historial
export HISTIGNORE="ls:cd:pwd:exit:clear:history" # Ignora comandos comunes
export EDITOR="/home/rich/.cargo/bin/hx"
export VISUAL="/home/rich/.cargo/bin/hx"
set -o emacs
bind 'set enable-bracketed-paste off'  # pega sin caracteres especiales

# oh-my-openagent (OpenCode)
OMO_SEND_ANONYMOUS_TELEMETRY=0

