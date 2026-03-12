# homebrew-cli-toolbelt: recommended shell aliases
# source this file from ~/.zshrc:
#   source ~/path/to/homebrew-cli-toolbelt/shell/aliases.zsh

# ============================================================
# MODERN CLI REPLACEMENTS
# ============================================================

# ls > eza (with git status, icons, and clean formatting)
alias ls="eza --color=always --long --git --icons=auto --no-permissions --no-user"
alias ll="eza --color=always --long --git --icons=auto --all"
alias la="eza --all --icons=auto"
alias tree="eza --tree --icons=auto --level=3"
alias lt="eza --tree --icons=auto --level=2"

# cat > bat (syntax highlighting, no paging for alias use)
alias cat="bat --paging=never"
alias less="bat"

# grep > ripgrep
alias grep="rg"

# find > fd
alias find="fd"

# du > dust
alias du="dust"

# df > duf
alias df="duf"

# top > btop
alias top="btop"

# man > tldr (for quick reference)
alias help="tldr"

# diff > delta
alias diff="delta"

# ============================================================
# QUICK LAUNCHERS
# ============================================================

alias lg="lazygit"
alias zj="zellij"
alias zja="zellij a"
alias g="git"
alias j="just"
alias hx="helix"

# ============================================================
# FZF POWER ALIASES
# ============================================================

# fuzzy open file in micro
alias fe='micro $(fzf --preview "bat --color=always {}")'

# fuzzy open file in helix
alias fh='hx $(fzf --preview "bat --color=always {}")'

# fuzzy git checkout branch
alias gcb='git checkout $(git branch --all | fzf | tr -d " " | sed "s|remotes/origin/||")'

# fuzzy kill process
alias fkill='kill -9 $(ps aux | fzf | awk "{print \$2}")'

# pretty-print JSON from clipboard
alias jqp="pbpaste | jq '.'"

# ============================================================
# YAZI (cd on exit)
# ============================================================

function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# ============================================================
# SHELL INTEGRATIONS
# uncomment the ones you've installed
# ============================================================

# fzf (Ctrl+R history, Ctrl+T file finder, Alt+C directory jump)
# eval "$(fzf --zsh)"

# zoxide (smarter cd)
# eval "$(zoxide init zsh)"

# starship prompt
# eval "$(starship init zsh)"

# atuin (better shell history)
# eval "$(atuin init zsh)"

# direnv (per-directory env vars)
# eval "$(direnv hook zsh)"

# mise (version manager)
# eval "$(mise activate zsh)"

# thefuck (auto-correct commands)
# eval "$(thefuck --alias)"

# ============================================================
# EDITOR DEFAULTS
# ============================================================

# set micro as default editor (change to hx or nvim when ready)
export EDITOR="micro"
export VISUAL="micro"

# syntax-highlighted man pages via bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# ============================================================
# FZF CONFIGURATION
# ============================================================

# use fd for file finding (respects .gitignore, faster)
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git"

# preview with bat (files) and eza (directories)
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :200 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --level=2 --icons {}'"

# catppuccin mocha theme for fzf
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --height=40% \
  --layout=reverse \
  --border \
  --info=inline"
