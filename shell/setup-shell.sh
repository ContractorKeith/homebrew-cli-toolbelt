#!/bin/bash
set -euo pipefail

# homebrew-cli-toolbelt: shell setup script
# Appends aliases + integrations to ~/.zshrc for users who ran brew bundle directly.
# Safe to run multiple times — uses guard markers to prevent duplicates.

# ---------- color helpers ----------
if [ -t 1 ]; then
  GREEN="\033[0;32m"
  YELLOW="\033[0;33m"
  CYAN="\033[0;36m"
  RED="\033[0;31m"
  RESET="\033[0m"
else
  GREEN="" YELLOW="" CYAN="" RED="" RESET=""
fi

info()    { echo -e "${CYAN}▸${RESET} $*"; }
success() { echo -e "${GREEN}✔${RESET} $*"; }
warn()    { echo -e "${YELLOW}⚠${RESET} $*"; }
error()   { echo -e "${RED}✖${RESET} $*"; }

# ---------- guard markers ----------
ALIAS_MARKER="# >>> homebrew-cli-toolbelt aliases >>>"
ALIAS_MARKER_END="# <<< homebrew-cli-toolbelt aliases <<<"
INTEGRATION_MARKER="# >>> homebrew-cli-toolbelt integrations >>>"
INTEGRATION_MARKER_END="# <<< homebrew-cli-toolbelt integrations <<<"

ZSHRC="$HOME/.zshrc"

# ---------- back up .zshrc ----------
if [[ -f "$ZSHRC" ]]; then
  BACKUP="$ZSHRC.backup.$(date +%Y%m%d%H%M%S)"
  cp "$ZSHRC" "$BACKUP"
  success "Backed up ~/.zshrc to $BACKUP"
else
  info "No existing ~/.zshrc found — creating one"
  touch "$ZSHRC"
fi

# ---------- add aliases ----------
if grep -qF "$ALIAS_MARKER" "$ZSHRC"; then
  success "Aliases already present — skipping"
else
  cat >> "$ZSHRC" << 'ALIASES_EOF'

# >>> homebrew-cli-toolbelt aliases >>>
# modern replacements
alias ls="eza --color=always --long --git --icons=auto --no-permissions --no-user"
alias ll="eza --color=always --long --git --icons=auto --all"
alias la="eza --all --icons=auto"
alias tree="eza --tree --icons=auto --level=3"
alias cat="bat --paging=never"
alias less="bat"
alias grep="rg"
alias find="fd"
alias du="dust"
alias df="duf"
alias diff="delta"
alias top="btop"
alias help="tldr"

# quick launchers
alias lg="lazygit"
alias zj="zellij"
alias g="git"
alias j="just"
alias hx="helix"
# <<< homebrew-cli-toolbelt aliases <<<
ALIASES_EOF

  success "Aliases added to ~/.zshrc"
fi

# ---------- add integrations ----------
if grep -qF "$INTEGRATION_MARKER" "$ZSHRC"; then
  success "Integrations already present — skipping"
else
  {
    echo ""
    echo "$INTEGRATION_MARKER"

    # env vars
    echo '# editor defaults'
    echo 'export EDITOR="micro"'
    echo 'export VISUAL="micro"'
    echo 'export MANPAGER="sh -c '\''col -bx | bat -l man -p'\''"'
    echo ''
    echo '# fzf configuration'
    echo 'export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"'
    echo 'export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"'
    echo 'export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git"'
    echo ''

    # conditional tool integrations — only add eval lines for installed tools
    echo '# shell integrations (only for tools detected at setup time)'
    if command -v fzf &>/dev/null; then
      echo 'eval "$(fzf --zsh)"'
      info "fzf detected — integration added" >&2
    else
      warn "fzf not found — skipping" >&2
    fi

    if command -v zoxide &>/dev/null; then
      echo 'eval "$(zoxide init zsh)"'
      info "zoxide detected — integration added" >&2
    else
      warn "zoxide not found — skipping" >&2
    fi

    if command -v starship &>/dev/null; then
      echo 'eval "$(starship init zsh)"'
      info "starship detected — integration added" >&2
    else
      warn "starship not found — skipping" >&2
    fi

    if command -v atuin &>/dev/null; then
      echo 'eval "$(atuin init zsh)"'
      info "atuin detected — integration added" >&2
    else
      warn "atuin not found — skipping" >&2
    fi

    echo "$INTEGRATION_MARKER_END"
  } >> "$ZSHRC"

  success "Integrations added to ~/.zshrc"
fi

# ---------- done ----------
echo ""
success "Shell setup complete!"
info "Run: source ~/.zshrc  (or open a new terminal)"
