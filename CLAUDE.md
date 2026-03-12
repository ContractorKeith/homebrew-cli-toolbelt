# homebrew-cli-toolbelt

## Purpose
Curated Homebrew toolkit that transforms a stock macOS terminal into a modern CLI development environment. Three tiers (minimal/intermediate/full) with cheatsheets for every tool.

## Stack
- Bash (install.sh, setup-shell.sh) — no runtime dependencies
- Homebrew `brew bundle` for package management
- Markdown for all documentation
- GitHub Actions for CI

## Conventions
- Cheatsheets follow template: what it replaces, install, 5-min quickstart, essential commands (table), configuration, aliases, tips, learn more
- Brewfile tiers: minimal (~12 core tools), intermediate (~25), full (45+)
- Aliases use the pattern: alias <old-command>="<new-tool> <flags>"
- Shell integrations use eval "$(tool init zsh)" pattern

## Do NOT
- Add custom Homebrew formulae (all tools come from homebrew-core/cask)
- Add AI coding tools (this is the foundation layer underneath them)
- Add personal configs or dotfiles (shell/ has starter templates only)
- Add non-macOS tools
- Add Node.js, Python, or other runtime dependencies
