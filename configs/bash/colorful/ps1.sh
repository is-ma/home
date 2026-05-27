# Custom PS1 prompt with git integration and color support
# All color codes are defined in bash_colors.sh
# This prompt shows time, host, directory, and git status

# Optimized git status functions with caching
__git_cache_time=0
__git_cache_value=""

# Use git rev-parse for more robust git detection
function is_git() {
    git rev-parse --git-dir >/dev/null 2>&1 && return 0 || return 1
}

# Get git status information (clean/dirty and online status)
function get_git_status_info() {
    if is_git; then
        local status_output=$(git status --porcelain 2>/dev/null)
        local is_clean=$([ -z "$status_output" ] && echo "clean" || echo "dirty")
        # Check for both master and main branches
        local is_online=""
        if [ -z "$status_output" ]; then
            if git log --oneline --decorate -n1 2>/dev/null | grep -q "origin/master"; then
                is_online="online"
            elif git log --oneline --decorate -n1 2>/dev/null | grep -q "origin/main"; then
                is_online="online"
            fi
        fi
        echo "$is_clean:$is_online"
    else
        echo ""
    fi
}

# Cached version to avoid multiple git calls
function get_git_status_cached() {
    local now=$(date +%s)
    # Cache for 2 seconds to balance responsiveness and performance
    if (( now - __git_cache_time > 2 )); then
        __git_cache_value=$(get_git_status_info)
        __git_cache_time=$now
    fi
    echo "$__git_cache_value"
}

# Helper functions using cached data
function is_red() {
    local status_info=$(get_git_status_cached)
    [[ "$status_info" == dirty:* ]] && return 0 || return 1
}

function is_green() {
    local status_info=$(get_git_status_cached)
    [[ "$status_info" == clean:* ]] && return 0 || return 1
}

function is_green_and_online() {
    local status_info=$(get_git_status_cached)
    [[ "$status_info" == clean:online ]] && return 0 || return 1
}

# Build PS1 using an array for better readability
# Each element corresponds to a colored part of the prompt
prompt_parts=(
    "${txtred}\t"            # current time (red)
    "${txtpur}|"             # separator (purple)
    "${txtylw}\H"            # hostname (yellow)
    "${txtpur}|"             # separator (purple)
    "${txtgrn}\w"            # working directory (green)
)

# Join all parts without separators (IFS is empty)
prompt=$(IFS=; echo "${prompt_parts[*]}")

# Git section - optimized to use cached functions
prompt="$prompt\$(if is_git; then echo '${txtpur}|'; fi)"  # pipe (purple)
prompt="$prompt\$(if is_git; then echo -n '${txtblu}'; echo \$(__git_ps1 '%s'); fi)"  # branch (blue)

# Status indicators using cached functions
prompt="$prompt\$(if is_red; then echo -n '${txtred} ✗'; fi)"               # red mark
prompt="$prompt\$(if is_green; then echo -n '${txtgrn} ✓'; fi)"             # green mark
prompt="$prompt\$(if is_green_and_online; then echo -n '${txtgrn}✓'; fi)"   # green mark (double)

export PS1="$prompt${txtrst}\n"

