source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- this block must come before eval "$(starship init zsh)"

bindkey -v
export KEYTIMEOUT=1

# thin beam in insert mode, thick block in normal mode
function zle-keymap-select {
  case $KEYMAP in
    vicmd)      printf '\e[2 q' ;;
    viins|main) printf '\e[6 q' ;;
  esac
}
zle -N zle-keymap-select

# start every new prompt in insert mode
function zle-line-init {
  printf '\e[6 q'
}
zle -N zle-line-init

# go back to block while command runs
autoload -Uz add-zsh-hook
function _cursor_block { printf '\e[2 q' }
add-zsh-hook preexec _cursor_block

# ---

eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export B="$HOME/scm/basedbv2/"
export BW="$HOME/scm/basedbv2/src/main/webapp/app/"
export X="/mnt/x/IU/"

autoload -Uz add-zsh-hook
add-zsh-hook precmd _wezterm_osc7
export GRADLE_HOME=$HOME/tools/gradle-8.10.1
export PATH=$GRADLE_HOME/bin:$PATH


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

xmount() {
  mountpoint -q /mnt/x && sudo umount /mnt/x
  sudo mount /mnt/x
}

xumount() { sudo umount /mnt/x; }

zmount() {
  mountpoint -q /mnt/z && sudo umount /mnt/z
  sudo mount /mnt/z
}

zumount() { sudo umount /mnt/z; }
