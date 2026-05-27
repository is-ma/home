# [a]

# [b]
alias b="batcat"

# [c]
alias c="clear"
alias conn='sudo netstat -an | grep ESTABLISHED | wc -l'  # Conexiones activas
alias cpu='echo "CPU Usage:" && grep -E "^cpu " /proc/stat | awk "{total=\$2+\$3+\$4+\$5+\$6+\$7+\$8; used=total-\$5-\$6; printf(\"Total: %.1f%% (User: %.1f%%, System: %.1f%%, Idle: %.1f%%)\\\n\", (used/total)*100, (\$2/total)*100, (\$4/total)*100, (\$5/total)*100)}" && echo "" && ps aux --sort=-%cpu | head -n 10'
alias curlt='curl -D - -o /dev/null -s -w "\nTTFB: %{time_starttransfer}s | Total: %{time_total}s\n"' # https://rankeando.com/2000000-bicicletas-paulini
alias curlz='curl -H "Accept-Encoding: gzip" -D - -o /dev/null -s -w "\nTTFB: %{time_starttransfer}s | Total: %{time_total}s\n"'

# [d]
alias dfh='df -h | grep -E "^(Filesystem|/dev)"'  # Solo discos reales
alias dudir='du -sh .'                # Tamaño del directorio actual
alias duh='du -sh * | sort -h'  # Tamaño de directorios ordenado

# [e]
alias e="vim"
ee() {  # plocate && edit
  local file=$(plocate "$1" | fzf --height=40% --layout=reverse)
  if [[ -n "$file" ]]; then
    vim "$file"
  fi
}
ee0() {  # plocate && edit (global)
  local file=$(plocate "$1" | fzf --height=40% --layout=reverse)
  if [[ -n "$file" ]]; then
    sudo vim "$file"
  fi
}
alias etcm='sudo find /etc -type f -mtime -7 2>/dev/null | head -20'  # Archivos modificados en /etc

# [f]
alias findf='find . -type f -name'    # Buscar archivos por nombre: findf "*.log"
alias findbig='find . -type f -exec du -h {} + | sort -rh | head -20'  # Archivos más grandes

# [g]

# [h]
alias hf='history | fzf --height=40% --layout=reverse'  # Buscar en historial (sudo apt-get install fzf)
alias htop='history | awk '\''{print $2}'\'' | sort | uniq -c | sort -rn | head -10'  # Comandos más usados

# [i]
alias i="cd ~/is-ma/ && ls -F"
alias ipull='back=$(pwd); cd ~/is-ma/ && for repo in */; do cd $repo; echo -n "----- ----- ----- ----- $repo"; git for-each-ref --format="%(push:track)" refs/heads; git pull; gs; cd ..; done; cd $back'

# [j]

# [k]
alias k='pkill -f'      # Matar procesos por nombre: killing nombre_proceso

# [l]
alias l='ls -CF --color=auto'       # Columnas con indicadores (/ para dirs, * ejecutables)
alias la='ls -A --color=auto'       # Muestra también ocultos (excepto . y ..)
alias latest='ls -lt | head -20'      # Archivos más recientes
alias lk="ls -d $PWD/{*,.*} | grep -v '/\.$' | grep -v '/\.\.$'"
alias ll='ls -alhF --color=auto'     # Lista detallada (permisos, tamaño, fecha) + ocultos
alias ls="ls -F"

# [m]
alias md5='md5sum'                    # Calcular checksum MD5
alias md="rm /var/mail/deploy"
alias me="vim /var/mail/deploy"
alias mem='free -h && echo "" && ps aux --sort=-%mem | head -n 10'
mkcd() { mkdir -p "$1" && cd "$1"; }  # Crear directorio y entrar
alias myip='curl -s ifconfig.me'  # IP pública
alias myps='ps -u $USER -o pid,pcpu,pmem,comm'  # Procesos del usuario actual

# [n]

# [o]
alias o='opencode run --agent DeepTerminal'
alias od="unset VISUAL; bash ~/is-ma/home/opencode/switch2deepseek.sh >/dev/null 2>&1; opencode"
alias og='unset VISUAL; bash ~/is-ma/home/opencode/switch2go.sh >/dev/null 2>&1; opencode'

# [p]
alias pingt='ping -D'  # Ping con timestamp
alias ports='sudo netstat -tulpn | grep LISTEN'  # Puertos abiertos
alias portsd='sudo lsof -i -P -n | grep LISTEN'  # Puertos con detalles de proceso

# [q]
alias q="exit"

# [r]
alias r='RIPGREP_CONFIG_PATH=/home/rich/is-ma/dotfiles/rg/rg.conf rg'
alias r0='sudo RIPGREP_CONFIG_PATH=/home/rich/is-ma/dotfiles/rg/rg.conf rg'
replace () { find . \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i "s@$1@$2@g"; }

# [s]
alias s="source ~/.bashrc"
alias serve='python3 -m http.server 8000'  # Servidor web rápido en puerto 8000
alias su="echo ''; su"

# [t]
alias topc='top -o %CPU'      # Ordenar por CPU
alias topm='top -o %MEM'      # Ordenar por memoria

# [u]
alias uu="sudo updatedb"  # updates plocate db manually (instead of 1/day)

# [v]
alias vi="hx"

# [w]
alias w="batcat"
ww() {  # plocate && read
  local file=$(plocate "$1" | fzf --height=40% --layout=reverse)
  if [[ -n "$file" ]]; then
    batcat "$file"
  fi
}
ww0() {  # plocate && read (global)
  local file=$(plocate "$1" | fzf --height=40% --layout=reverse)
  if [[ -n "$file" ]]; then
    sudo batcat "$file"
  fi
}
wo () { whois $1 | egrep "^   (Admin|Creation|Updated)"; }

# [x]

# [y]

# [z]

# [a]
