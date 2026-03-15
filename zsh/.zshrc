# ~/.zshrc

# --- 1. Basic Options (Your Wizard Choices) ---
# Enable automatic cd (just type directory name) and advanced globbing
setopt autocd extendedglob nomatch
setopt NO_BEEP

# --- 2. History Configuration ---
HISTFILE=~/.zsh_history    # Changed to standard .zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY      # Append history instead of overwriting
setopt SHARE_HISTORY       # Share history between terminals
setopt HIST_IGNORE_DUPS    # Don't save duplicate commands
setopt HIST_IGNORE_SPACE   # Don't save commands starting with space

# --- 3. Completion System (Fast Init) ---
# Replaces the slow 'compinstall' block


fpath=(/usr/share/zsh/site-functions $fpath)

autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # Case insensitive

# Cache check for speed (saves ~0.1s startup time)
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# --- 4. Keybindings (Vi Mode + Fixes) ---
bindkey -v  # Your choice (Vi/Vim bindings)
# Map 'jk' to Esc in insert mode
bindkey -M viins 'jk' vi-cmd-mode

# Fix Up/Down Arrow History Search in Vi Mode
bindkey -M viins '^[[A' history-search-backward
bindkey -M viins '^[[B' history-search-forward
bindkey -M vicmd '^[[A' history-search-backward
bindkey -M vicmd '^[[B' history-search-forward

# --- 5. Environment & Paths ---
export EDITOR='nvim'
export VISUAL="nvim"
export TERMINAL="kitty"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/Games/not a game/WeiDU-Linux:$PATH"
export PATH="$HOME/go/bin:$PATH"
# --- 6. Manual "Git Plugin" (Fast Aliases) ---
alias g='git'
alias gst='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -v'
alias gcmsg='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gco='git checkout'
alias gb='git branch'
alias glg='git log --stat'

# --- 7. Your Custom Aliases ---
alias c="clear"
alias open="xdg-open"
alias c++23="clang++ -std=c++23"
alias le="eza"

# Pipe any command output directly to your clipboard
# Usage: cat file.cpp | cp2
alias cp2="wl-copy"

# Paste from clipboard to a file
# Usage: p2 > new_file.lua
alias p2="wl-paste"

# Advanced Package Manager Aliases
# alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% --layout=reverse | xargs -ro yay --sudoloop --noconfirm --needed -S"
# alias pacf="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' --preview-window=down:75% --layout=reverse | xargs -ro sudo pacman --noconfirm --needed -S"
# alias yayr="yay -Qq | fzf --multi --preview 'yay -Qi {1}' --preview-window=down:75% --layout=reverse | xargs -ro yay --sudoloop --noconfirm -Rns"
# alias pacr="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' --preview-window=down:75% --layout=reverse | xargs -ro sudo pacman --noconfirm -Rns"

[[ -f ~/.zsh_functions ]] && source ~/.zsh_functions


# --- 8. Functions ---
# Yazi Wrapper
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# --- 9. Load Tools & Plugins ---
# FZF (Arch Linux System Path)
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Zoxide & Starship
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
# alias cd='z'

# Visual Plugins (Must be last)
source ~/.local/share/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.local/share/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
