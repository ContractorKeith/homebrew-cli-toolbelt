# Product Requirements Document

## Project

**contractorkeith/homebrew-cli-toolbelt**

## Purpose

A curated Homebrew toolkit that transforms a stock macOS terminal into a modern CLI
development environment. One repo, one install script, three tiers of tooling, and
cheatsheets so you actually learn what you installed.

## Target User

A developer who just installed an AI coding tool (Claude Code, Codex, Cursor, etc.)
and realized their default terminal is holding them back. They want a better shell
experience but don't want to spend a weekend researching which tools to install.

## Three Tiers

| Tier | Tools | Who It's For |
|------|-------|--------------|
| Minimal | ~12 | "Just make my terminal not suck." Essentials only. |
| Intermediate | ~25 | Daily driver setup. Git, search, file nav, monitoring. |
| Full | 45+ | Power user. Terminal emulators, Nerd Fonts, TUI apps. |

Each tier is a standalone Brewfile. Higher tiers include everything from lower tiers.

## Key Deliverables

- `Brewfile.minimal`, `Brewfile.intermediate`, `Brewfile` (full)
- `install.sh` — interactive tier selector, runs `brew bundle`, configures shell
- `shell/` — shell config snippets (aliases, completions, PATH setup)
- `docs/cheatsheets/` — one-page reference per tool so users learn what they installed
- `docs/WHY-CLI.md` — motivation doc for the "why bother?" crowd
- `CONTRIBUTING.md` — how to add tools or cheatsheets
- `CLAUDE.md` — project instructions for AI-assisted development

## Decisions Locked

- **Repo name**: `homebrew-cli-toolbelt` (renamed from `homebrew-devtools`)
- **License**: MIT
- **Nerd Fonts**: opt-in, not default (large downloads, not everyone wants them)
- **Terminal emulators** (WezTerm, Ghostty, etc.): full tier only
- **Architecture**: `install.sh` -> `brew bundle` -> shell config -> cheatsheets

## What's NOT Included

- AI tools (Claude Code, Codex, etc.) — those are upstream of this project
- Personal dotfiles or opinionated shell themes
- Linux or Windows support — this is macOS + Homebrew only
- Custom Homebrew formulae — everything comes from homebrew-core or homebrew-cask
- Runtime dependencies — no Python, no Node, just Bash + Homebrew + Markdown

## Success Criteria

- A new Mac user can go from stock terminal to productive CLI in under 15 minutes
- Every installed tool has a cheatsheet so nothing sits unused
- The install script is idempotent — safe to re-run
- CI validates that all Brewfiles resolve against homebrew-core/cask

## Out of Scope (Future)

- Tool update/maintenance commands
- Uninstall script
- Per-tool configuration beyond shell aliases
- Integration with dotfile managers (chezmoi, stow, etc.)
