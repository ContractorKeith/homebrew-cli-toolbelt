# homebrew-cli-toolbelt

> one command to mass-upgrade a stock macOS terminal from basic to beautiful.

you just installed Claude Code or Codex CLI. you're staring at a blank terminal. you realize the terminal itself is the problem -- it's ugly, slow, and every command feels like it was designed in 1985.

this fixes that.

`homebrew-cli-toolbelt` is a curated Homebrew tap that installs 40+ modern CLI tools on macOS, organized into three tiers (minimal, intermediate, full), with practical cheatsheets for every tool. no AI coding tools included -- this is the foundation layer that makes your terminal worth living in.

---

## quickstart

### pick your tier

**minimal** (~12 tools, < 2 min install) -- just make my terminal not suck:
```bash
brew bundle --file=https://raw.githubusercontent.com/contractorkeith/homebrew-cli-toolbelt/main/Brewfile.minimal
```

**intermediate** (~25 tools) -- i'm ready to go deeper:
```bash
brew bundle --file=https://raw.githubusercontent.com/contractorkeith/homebrew-cli-toolbelt/main/Brewfile.intermediate
```

**full** (~45+ tools) -- give me everything:
```bash
brew bundle --file=https://raw.githubusercontent.com/contractorkeith/homebrew-cli-toolbelt/main/Brewfile
```

### or use the setup script (recommended)

the setup script installs your chosen tier, configures shell aliases, and sets up integrations:

```bash
curl -fsSL https://raw.githubusercontent.com/contractorkeith/homebrew-cli-toolbelt/main/install.sh | bash
```

or clone and run locally:

```bash
git clone https://github.com/contractorkeith/homebrew-cli-toolbelt.git
cd homebrew-cli-toolbelt
./install.sh
```

the script is interactive -- it asks which tier you want and what to configure. it's idempotent so you can run it again safely.

---

## what you get

### before and after

| task | before (stock macOS) | after (homebrew-cli-toolbelt) |
|------|---------------------|--------------------------|
| list files | `ls` -- no colors, no info | `eza` -- git status, icons, tree view |
| read a file | `cat` -- raw dump | `bat` -- syntax highlighting, line numbers |
| search code | `grep -r` -- slow, noisy | `ripgrep` -- 100x faster, respects .gitignore |
| find files | `find . -name "*.js"` -- painful syntax | `fd "*.js"` -- fast, intuitive |
| navigate dirs | `cd ../../../project` -- tedious | `z project` -- jump anywhere by partial name |
| git workflow | memorize 50 git commands | `lazygit` -- full TUI, teaches you git as you use it |
| view diffs | `git diff` -- unreadable | `delta` -- syntax-highlighted, word-level changes |
| system monitor | `top` -- cryptic | `btop` -- gorgeous, mouse-enabled, themed |
| file management | switch to Finder | `yazi` -- fast TUI with previews, stay in terminal |
| split panes | open multiple terminal windows | `zellij` -- splits, tabs, session persistence |
| shell prompt | `user@host $` | `starship` -- git branch, language versions, fast |
| command history | up arrow, pray | `atuin` -- searchable, filterable, syncs across machines |
| man pages | `man grep` -- 47 pages of options | `tldr grep` -- 5 practical examples |

### tool categories at a glance

every tool below has a [cheatsheet](docs/cheatsheets/) with quickstart commands, essential usage, and tips.

**modern CLI replacements** -- drop-in upgrades for legacy commands:
`bat` `eza` `fd` `ripgrep` `zoxide` `delta` `dust` `duf` `sd` `procs` `tailspin`

**core developer tools** -- the productivity backbone:
`fzf` `jq` `lazygit` `starship` `atuin` `btop` `tldr` `gh` `just` `mise`

**TUI applications** -- terminal user interfaces that replace GUI apps:
`yazi` `zellij` `lazygit` `btop` `gitui` `superfile`

**shell enhancements** -- make zsh smarter:
`zsh-autosuggestions` `zsh-syntax-highlighting` `starship` `atuin` `thefuck`

**text editors** -- graduated from "i can edit a file" to "full IDE":
`micro` `helix` `neovim`

**networking and API tools** -- debug and explore from terminal:
`httpie` `xh` `gping` `doggo` `bandwhich` `trippy`

**productivity extras** -- tools you didn't know you needed:
`glow` `gum` `navi` `hyperfine` `tokei` `watchexec` `fx` `direnv` `forgit`

**terminal emulators** (casks) -- the window your terminal runs in:
`ghostty` `iterm2`

---

## recommended aliases

after installation, add these to your `~/.zshrc` (the install script can do this for you):

```bash
# modern replacements
alias ls="eza --color=always --long --git --icons=auto --no-permissions --no-user"
alias ll="eza --color=always --long --git --icons=auto --all"
alias tree="eza --tree --icons=auto"
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
alias y="yazi"
alias zj="zellij"
alias g="git"
alias j="just"

# fzf integrations (add to .zshrc)
# Ctrl+R = fuzzy history search
# Ctrl+T = fuzzy file finder
# Alt+C  = fuzzy directory jump
eval "$(fzf --zsh)"

# zoxide (smarter cd)
eval "$(zoxide init zsh)"

# starship prompt
eval "$(starship init zsh)"

# atuin (better shell history)
eval "$(atuin init zsh)"
```

---

## learning path

don't try to learn 40 tools at once. follow this progression:

### week 1: aliases only

just use the aliases above. you'll notice the improvements immediately without learning anything new.

- `ls` now shows git status and file icons
- `cat` now has syntax highlighting
- `grep` is now 100x faster
- `find` has readable syntax
- try `z` to jump to frequently-used directories
- try `tldr` instead of `man` for any command

**one new thing to try**: `Ctrl+R` to fuzzy-search your command history (fzf)

### week 2: git and monitoring

- open any git repo and run `lazygit` -- explore with arrow keys and `?` for help
- run `btop` to see your system in a way that actually makes sense
- try `git diff` and notice delta making diffs readable automatically

**one new thing to try**: in lazygit, stage individual lines (not whole files) with `space`

### week 3: file management and multiplexing

- run `yazi` in any directory -- navigate with arrows, preview files, `q` to quit
- run `zellij` for your first split-pane session
- try `micro` to edit a file -- it works like VS Code (Ctrl+S, Ctrl+C, Ctrl+V)

**one new thing to try**: in zellij, press `Ctrl+p` then `d` to split panes, `Alt+arrows` to navigate

### week 4: customize and explore

- edit `~/.config/starship.toml` to customize your prompt
- set up atuin and search your history with context (directory, exit code, duration)
- try helix for a modal editor that's easier to learn than vim/neovim

**one new thing to try**: run `jq '.' < some-api-response.json` to pretty-print JSON

### ongoing

layer in tools as you need them. the cheatsheets are always here.

full learning path guide: [docs/LEARNING-PATH.md](docs/LEARNING-PATH.md)

---

## cheatsheets

every tool has a dedicated cheatsheet with quickstart commands, essential usage, configuration, and tips.

| tool | replaces | cheatsheet |
|------|----------|------------|
| bat | cat | [docs/cheatsheets/bat.md](docs/cheatsheets/bat.md) |
| eza | ls | [docs/cheatsheets/eza.md](docs/cheatsheets/eza.md) |
| fd | find | [docs/cheatsheets/fd.md](docs/cheatsheets/fd.md) |
| ripgrep | grep | [docs/cheatsheets/ripgrep.md](docs/cheatsheets/ripgrep.md) |
| zoxide | cd | [docs/cheatsheets/zoxide.md](docs/cheatsheets/zoxide.md) |
| delta | diff | [docs/cheatsheets/delta.md](docs/cheatsheets/delta.md) |
| fzf | Ctrl+R | [docs/cheatsheets/fzf.md](docs/cheatsheets/fzf.md) |
| lazygit | GitKraken/Tower | [docs/cheatsheets/lazygit.md](docs/cheatsheets/lazygit.md) |
| btop | top/Activity Monitor | [docs/cheatsheets/btop.md](docs/cheatsheets/btop.md) |
| yazi | Finder | [docs/cheatsheets/yazi.md](docs/cheatsheets/yazi.md) |
| zellij | multiple windows | [docs/cheatsheets/zellij.md](docs/cheatsheets/zellij.md) |
| starship | boring prompt | [docs/cheatsheets/starship.md](docs/cheatsheets/starship.md) |
| atuin | shell history | [docs/cheatsheets/atuin.md](docs/cheatsheets/atuin.md) |
| micro | nano/TextEdit | [docs/cheatsheets/micro.md](docs/cheatsheets/micro.md) |
| helix | vim (easier) | [docs/cheatsheets/helix.md](docs/cheatsheets/helix.md) |
| jq | manual JSON parsing | [docs/cheatsheets/jq.md](docs/cheatsheets/jq.md) |
| dust | du | [docs/cheatsheets/dust.md](docs/cheatsheets/dust.md) |
| duf | df | [docs/cheatsheets/duf.md](docs/cheatsheets/duf.md) |
| sd | sed | [docs/cheatsheets/sd.md](docs/cheatsheets/sd.md) |
| procs | ps | [docs/cheatsheets/procs.md](docs/cheatsheets/procs.md) |
| tailspin | tail/log viewing | [docs/cheatsheets/tailspin.md](docs/cheatsheets/tailspin.md) |
| ncdu | du (interactive) | [docs/cheatsheets/ncdu.md](docs/cheatsheets/ncdu.md) |
| just | make | [docs/cheatsheets/just.md](docs/cheatsheets/just.md) |
| mise | nvm/pyenv/rbenv | [docs/cheatsheets/mise.md](docs/cheatsheets/mise.md) |
| httpie | curl | [docs/cheatsheets/httpie.md](docs/cheatsheets/httpie.md) |
| glow | markdown viewer | [docs/cheatsheets/glow.md](docs/cheatsheets/glow.md) |
| navi | remembering commands | [docs/cheatsheets/navi.md](docs/cheatsheets/navi.md) |
| thefuck | retyping after typos | [docs/cheatsheets/thefuck.md](docs/cheatsheets/thefuck.md) |
| superfile | Finder (dual-pane) | [docs/cheatsheets/superfile.md](docs/cheatsheets/superfile.md) |
| gitui | git CLI | [docs/cheatsheets/gitui.md](docs/cheatsheets/gitui.md) |

---

## requirements

- macOS 13 (Ventura) or later
- Apple Silicon or Intel Mac
- [Homebrew](https://brew.sh) installed
- a terminal emulator (stock Terminal.app works; Ghostty or iTerm2 recommended)
- a [Nerd Font](https://www.nerdfonts.com/) for icon support in eza, yazi, and starship

### nerd font setup

many tools display icons that require a patched font. quickest setup:

```bash
brew install --cask font-fira-code-nerd-font
```

then set your terminal emulator's font to "FiraCode Nerd Font". other popular options: JetBrainsMono Nerd Font, Hack Nerd Font, MesloLGS Nerd Font.

---

## what's NOT included (and why)

**AI coding tools** (Claude Code, Codex CLI, Gemini CLI, aider): these change too fast and have their own install processes. this tap is the foundation layer underneath them.

**dotfiles/personal configs**: the `shell/` directory has starter templates, not opinionated configs. fork and customize.

**linux/windows tools**: macOS only. every tool is tested on macOS with ARM64 Homebrew bottles.

**custom formulae**: every tool is in homebrew-core or homebrew-cask already. no maintenance burden.

---

## contributing

found a tool that should be here? open an issue with:

1. tool name and what it replaces
2. GitHub link and star count
3. why it belongs (what problem does it solve for someone leaving a GUI IDE?)
4. which tier it fits (minimal, intermediate, full)

PRs for new cheatsheets are especially welcome.

---

## license

MIT

---

## credits

built by [ContractorKeith](https://github.com/contractorkeith) -- a construction professional turned builder of practical digital tools.

inspired by [modern-unix](https://github.com/ibraheemdev/modern-unix) and the CLI renaissance driven by AI-assisted coding.
