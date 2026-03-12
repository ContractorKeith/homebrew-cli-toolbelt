#!/bin/bash
set -euo pipefail

# homebrew-cli-toolbelt: interactive install script
# Installs modern CLI tools via Homebrew, configures shell, and sets up integrations.
# Safe to run multiple times — idempotent, non-destructive.

# ---------- color helpers (degrade gracefully if no tty) ----------
if [ -t 1 ]; then
  BOLD="\033[1m"
  GREEN="\033[0;32m"
  YELLOW="\033[0;33m"
  CYAN="\033[0;36m"
  RED="\033[0;31m"
  RESET="\033[0m"
else
  BOLD="" GREEN="" YELLOW="" CYAN="" RED="" RESET=""
fi

info()    { echo -e "${CYAN}▸${RESET} $*"; }
success() { echo -e "${GREEN}✔${RESET} $*"; }
warn()    { echo -e "${YELLOW}⚠${RESET} $*"; }
error()   { echo -e "${RED}✖${RESET} $*"; }
header()  { echo -e "\n${BOLD}$*${RESET}\n"; }

# ---------- helper: yes/no prompt with default ----------
# Usage: ask "question" [default y|n]
ask() {
  local prompt="$1"
  local default="${2:-y}"
  local hint
  if [[ "$default" == "y" ]]; then hint="[Y/n]"; else hint="[y/N]"; fi

  read -rp "$(echo -e "${CYAN}?${RESET} ${prompt} ${hint} ")" answer
  answer="${answer:-$default}"
  [[ "$answer" =~ ^[Yy] ]]
}

# ---------- locate Brewfile directory (same dir as this script) ----------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ---------- step 1: ensure Homebrew is installed ----------
header "Step 1 — Checking for Homebrew"

if command -v brew &>/dev/null; then
  success "Homebrew is already installed"
else
  info "Homebrew not found — installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # add brew to PATH for Apple Silicon Macs if needed
  if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  success "Homebrew installed"
fi

# ---------- step 2: select tier ----------
header "Step 2 — Select install tier"

echo -e "  ${BOLD}minimal${RESET}        ~12 tools — modern replacements + essentials (< 2 min)"
echo -e "  ${BOLD}intermediate${RESET}   ~25 tools — minimal + productivity layer"
echo -e "  ${BOLD}full${RESET}           ~45 tools — the complete modern CLI toolkit"
echo ""

read -rp "$(echo -e "${CYAN}?${RESET} Choose tier [minimal/intermediate/full] (default: minimal): ")" TIER
TIER="${TIER:-minimal}"

# map tier to Brewfile path
case "$TIER" in
  minimal)
    BREWFILE="$SCRIPT_DIR/Brewfile.minimal"
    ;;
  intermediate)
    BREWFILE="$SCRIPT_DIR/Brewfile.intermediate"
    ;;
  full)
    BREWFILE="$SCRIPT_DIR/Brewfile"
    ;;
  *)
    error "Unknown tier: $TIER — defaulting to minimal"
    TIER="minimal"
    BREWFILE="$SCRIPT_DIR/Brewfile.minimal"
    ;;
esac

if [[ ! -f "$BREWFILE" ]]; then
  error "Brewfile not found at $BREWFILE"
  exit 1
fi

# ---------- step 3: brew bundle ----------
header "Step 3 — Installing $TIER tier"

info "Running: brew bundle --file=$BREWFILE"
brew bundle --file="$BREWFILE"
success "Brew bundle complete"

# ---------- step 4: nerd font ----------
header "Step 4 — Nerd Font"

if ask "Install a Nerd Font for icon support?"; then
  if brew list --cask font-fira-code-nerd-font &>/dev/null; then
    success "font-fira-code-nerd-font is already installed"
  else
    info "Installing FiraCode Nerd Font..."
    brew install --cask font-fira-code-nerd-font
    success "FiraCode Nerd Font installed"
  fi
  echo -e "\n  ${YELLOW}→ Set your terminal font to 'FiraCode Nerd Font' for icon support${RESET}\n"
else
  info "Skipping Nerd Font"
fi

# ---------- step 5: aliases ----------
header "Step 5 — Shell aliases"

# guard marker used to detect if aliases were already added
ALIAS_MARKER="# >>> homebrew-cli-toolbelt aliases >>>"
ALIAS_MARKER_END="# <<< homebrew-cli-toolbelt aliases <<<"

ZSHRC="$HOME/.zshrc"

if ask "Add recommended aliases to ~/.zshrc?"; then
  # check if already present
  if [[ -f "$ZSHRC" ]] && grep -qF "$ALIAS_MARKER" "$ZSHRC"; then
    success "Aliases already present in ~/.zshrc — skipping"
  else
    # back up existing .zshrc
    if [[ -f "$ZSHRC" ]]; then
      BACKUP="$ZSHRC.backup.$(date +%Y%m%d%H%M%S)"
      cp "$ZSHRC" "$BACKUP"
      success "Backed up ~/.zshrc to $BACKUP"
    fi

    # append aliases inline (no source dependency on repo path)
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
else
  info "Skipping aliases"
fi

# ---------- step 6: shell integrations ----------
header "Step 6 — Shell integrations"

INTEGRATION_MARKER="# >>> homebrew-cli-toolbelt integrations >>>"
INTEGRATION_MARKER_END="# <<< homebrew-cli-toolbelt integrations <<<"

if ask "Configure shell integrations (fzf, zoxide, starship, atuin)?"; then
  if [[ -f "$ZSHRC" ]] && grep -qF "$INTEGRATION_MARKER" "$ZSHRC"; then
    success "Shell integrations already present in ~/.zshrc — skipping"
  else
    # back up if not already backed up in this run
    if [[ -f "$ZSHRC" ]] && ! grep -qF "$ALIAS_MARKER" "$ZSHRC" 2>/dev/null; then
      # aliases step was skipped so no backup was made yet
      BACKUP="$ZSHRC.backup.$(date +%Y%m%d%H%M%S)"
      cp "$ZSHRC" "$BACKUP"
      success "Backed up ~/.zshrc to $BACKUP"
    fi

    # build the integration block — only include lines for installed tools
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

      # conditional tool integrations
      echo '# shell integrations (auto-detected at install time)'
      if command -v fzf &>/dev/null; then
        echo 'eval "$(fzf --zsh)"'
        success "  fzf integration added"
      else
        warn "  fzf not found — skipping integration"
      fi

      if command -v zoxide &>/dev/null; then
        echo 'eval "$(zoxide init zsh)"'
        success "  zoxide integration added"
      else
        warn "  zoxide not found — skipping integration"
      fi

      if command -v starship &>/dev/null; then
        echo 'eval "$(starship init zsh)"'
        success "  starship integration added"
      else
        warn "  starship not found — skipping integration"
      fi

      if command -v atuin &>/dev/null; then
        echo 'eval "$(atuin init zsh)"'
        success "  atuin integration added"
      else
        warn "  atuin not found — skipping integration"
      fi

      echo "$INTEGRATION_MARKER_END"
    } >> "$ZSHRC"

    success "Shell integrations added to ~/.zshrc"
  fi
else
  info "Skipping shell integrations"
fi

# ---------- step 7: starship config ----------
header "Step 7 — Starship prompt config"

STARSHIP_CONFIG="$HOME/.config/starship.toml"
STARSHIP_SOURCE="$SCRIPT_DIR/shell/starship.toml"

if ask "Install starter starship config?"; then
  if [[ -f "$STARSHIP_CONFIG" ]]; then
    warn "~/.config/starship.toml already exists — skipping (not overwriting)"
  elif [[ ! -f "$STARSHIP_SOURCE" ]]; then
    warn "Starter starship.toml not found at $STARSHIP_SOURCE — skipping"
  else
    mkdir -p "$HOME/.config"
    cp "$STARSHIP_SOURCE" "$STARSHIP_CONFIG"
    success "Installed starship.toml to ~/.config/starship.toml"
  fi
else
  info "Skipping starship config"
fi

# ---------- step 8: quickstart summary ----------
header "Done! Here's what to try first"

echo -e "${BOLD}All tiers:${RESET}"
echo "  ls              → eza with icons and git status"
echo "  cat README.md   → bat with syntax highlighting"
echo "  lg              → lazygit TUI"
echo "  btop            → system monitor"
echo "  help git        → tldr pages"
echo "  Ctrl+R          → fzf fuzzy history search"
echo ""

if [[ "$TIER" == "intermediate" || "$TIER" == "full" ]]; then
  echo -e "${BOLD}Intermediate tier extras:${RESET}"
  echo "  zj              → zellij terminal multiplexer"
  echo "  y               → yazi file manager"
  echo "  j               → just task runner"
  echo "  hx              → helix editor"
  echo "  gh pr list      → GitHub CLI"
  echo ""
fi

if [[ "$TIER" == "full" ]]; then
  echo -e "${BOLD}Full tier extras:${RESET}"
  echo "  glow README.md  → render markdown"
  echo "  http GET url    → httpie"
  echo "  hyperfine 'cmd' → benchmark commands"
  echo "  tokei           → count lines of code"
  echo "  mise use node   → version management"
  echo ""
fi

# ---------- step 9: reload suggestion ----------
header "Reload your shell to activate everything"

echo -e "  Run: ${BOLD}source ~/.zshrc${RESET}"
echo -e "  Or just open a new terminal window."
echo ""
success "Installation complete. Enjoy your new CLI toolkit!"
