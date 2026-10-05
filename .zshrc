source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

autoload -Uz add-zsh-hook
add-zsh-hook precmd _wezterm_osc7

bindkey -v
export KEYTIMEOUT=1

export EDITOR=nvim
export VISUAL=nvim

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

bindkey -M viins '^R' history-incremental-search-backward
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^E' end-of-line

function _wezterm_osc7() {
        printf '\033]7;file://%s%s\033\\' "$HOST" "$PWD"
}
