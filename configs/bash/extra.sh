# DEEPSEEK - Daily driver optimizado: 90% del tiempo
alias deepseek='aider --model deepseek/deepseek-chat \
                      --weak-model groq/llama-3.1-8b-instant \
                      --editor-model deepseek/deepseek-chat'
# CLAUDE - Bug complejo que DEEPSEEK no resolvió (ideas frescas)
alias claude='aider --model claude-sonnet-4-5-20250929 \
                    --weak-model groq/llama-3.1-8b-instant \
                    --editor-model deepseek/deepseek-chat'

# to config
 Secrets
[ -f "$HOME/.secrets/ai_keys/.env" ] && source "$HOME/.secrets/ai_keys/.env"

# to rk
# PostgreSQL [asdf]
alias pg-start="$HOME/.asdf/installs/postgres/11.7/bin/pg_ctl -D $HOME/.asdf/installs/postgres/11.7/data -l $HOME/.asdf/installs/postgres/11.7/server.log start"
alias pg-status="$HOME/.asdf/installs/postgres/11.7/bin/pg_ctl -D $HOME/.asdf/installs/postgres/11.7/data status"
alias pg-stop="$HOME/.asdf/installs/postgres/11.7/bin/pg_ctl -D $HOME/.asdf/installs/postgres/11.7/data stop"
alias pg-con='psql -h localhost -U postgres -d'  # Conexión rápida a BD: pgcon nombre_db
alias pg-dbs='psql -h localhost -U postgres -c "\l+"'  # Ver bases de datos y tamaños
### IS-MA: Serveret [Nginx] ###
alias n-status='sudo service nginx status'
alias n-start='sudo service nginx start'
alias n-stop='sudo service nginx stop'
alias n-restart='sudo service nginx restart'
alias n-reload='sudo service nginx reload'
# Nginx configuración y pruebas
n-go() { sudo nginx -t && sudo service nginx reload; }  # Probar y recargar si está bien
# Fail2ban aliases
alias f2="sudo /etc/init.d/fail2ban" # start | stop | restart | status
alias f2j="sudo /usr/bin/fail2ban-client status" # f2ban jails, ej. f2j | f2j sshd
alias f2l="sudo tail -f /var/log/fail2ban.log" # f2ban live
alias f2r="sudo /usr/bin/fail2ban-client reload" # f2ban reload
f2s() { # f2ban summary
  echo -e "\e[1;33m>>> Fail2Ban Stats <<<\e[0m"
  sudo /usr/bin/fail2ban-client status | grep "Jail list:" | sed 's/.*Jail list:\s*//' | tr ',' '\n' | while read -r jail; do
    jail=$(echo "$jail" | xargs)
    if [ -n "$jail" ]; then
      echo "$jail:"
      sudo /usr/bin/fail2ban-client status "$jail" | grep --color=auto -E "(Currently banned|Total banned)"
      sudo grep "$jail.*Ban" /var/log/fail2ban.log | awk '{gsub(/,.*/, "", $2); print $1, $2, $7, $NF}' | tail -n 5
      echo ""
      fi
  done
}
alias sshf='sudo grep "Failed password" /var/log/auth.log | wc -l'  # Intentos SSH fallidos
# Nginx Stats Tools
alias s='/home/deploy/.is-ma/nginx_my_stats/nginx_stats.sh'
# ej. statspair ip 17.22.245.138
# ej. date "13/Jan/2026:00:28:08 -0600"
# ej. timestamp:1768285688.391
# ej. ip 82.25.215.238
# ej. method GET
# ej. uri "/4096083-guarderia-colinas-de-san-gerardo"
# ej. status 200
# ej. bytes 6595
# ej. time 0.001
# ej. ua "Mozilla/5.0 (Windows NT 10.0; Win64; x64)..."
# ej. referer ""
# ej. host rankeando.com
minuto_anterior() {
    local minuto_anterior=$(date -d "1 minute ago" +"%d/%b/%Y:%H:%M")
    sudo tail -n 10000 /var/log/nginx/shield_access.log | grep "\"$minuto_anterior:" | jq '(.ip)' | cut -d'.' -f1-2 | sort | uniq -c | sort -n
}

# to dotfiles
alias pushover="$HOME/.is-ma/pushover/pushover.sh"

