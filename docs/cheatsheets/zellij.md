# zellij

> a terminal workspace with batteries included

## what it replaces

opening multiple Terminal windows > `zellij` -- a terminal multiplexer (like tmux) that lets you split your terminal into panes and tabs, with discoverable keybindings shown in a status bar. sessions persist and can be resumed.

## install

```bash
brew install zellij
```

## 5-minute quickstart

```bash
zellij                           # start a new session
# look at the bottom bar -- it shows available keys
# Ctrl+p then d = split pane down
# Ctrl+p then r = split pane right
# Alt+arrow keys = move between panes
# Ctrl+t then n = new tab
# Ctrl+q = quit
```

## essential commands

zellij uses "modes" shown in the status bar. press the mode key to enter it, then the action key.

| keys | what it does |
|------|-------------|
| `Ctrl+p` then `d` | split pane down (horizontal split) |
| `Ctrl+p` then `r` | split pane right (vertical split) |
| `Ctrl+p` then `x` | close current pane |
| `Ctrl+p` then `f` | toggle pane fullscreen |
| `Ctrl+p` then `w` | toggle floating pane |
| `Alt+←/→/↑/↓` | move focus between panes |
| `Alt+=/+/-` | resize current pane |
| `Ctrl+t` then `n` | new tab |
| `Ctrl+t` then `1-9` | go to tab N |
| `Ctrl+t` then `x` | close current tab |
| `Ctrl+t` then `r` | rename current tab |
| `Ctrl+s` then `d` | scroll mode / search (then type to search) |
| `Ctrl+o` then `d` | detach session (keeps running in background) |
| `Ctrl+q` | quit zellij |

### session management

| command | what it does |
|---------|-------------|
| `zellij` | start new session |
| `zellij -s name` | start named session |
| `zellij ls` | list active sessions |
| `zellij a` | attach to most recent session |
| `zellij a name` | attach to named session |
| `zellij kill-session name` | kill a named session |
| `zellij kill-all-sessions` | kill all sessions |

## configuration

create `~/.config/zellij/config.kdl`:

```bash
mkdir -p ~/.config/zellij

cat << 'EOF' > ~/.config/zellij/config.kdl
// use the non-colliding keybinding preset (won't conflict with other tools)
keybinds {
    // use Alt as the main modifier to avoid conflicts with Ctrl-based tools
}

theme "catppuccin-mocha"

// automatically copy selection to system clipboard
copy_on_select true

// show pane frames
pane_frames true

// default layout
default_layout "compact"
EOF
```

generate the default config for reference:
```bash
zellij setup --dump-config > ~/.config/zellij/config.kdl
```

## aliases

```bash
alias zj="zellij"
alias zja="zellij a"
alias zjl="zellij ls"
```

## tips

- zellij's status bar is the killer feature for beginners. it shows exactly what keys do what in each mode. no memorization needed
- sessions auto-save. if your terminal crashes, run `zellij a` to pick up where you left off
- floating panes (`Ctrl+p` then `w`) are great for quick one-off commands without disrupting your layout
- the "compact" layout uses less screen space for the status bar. switch to it after you've learned the keybindings
- zellij has a plugin system using WASM. the built-in session-manager plugin (`Ctrl+o` then `w`) lets you switch between sessions visually
- for AI coding workflows: split panes with your editor in one pane and Claude Code / Codex running in the other

## learn more

- [GitHub](https://github.com/zellij-org/zellij)
- [docs](https://zellij.dev/documentation/)
- [keybinding reference](https://zellij.dev/documentation/keybindings)
