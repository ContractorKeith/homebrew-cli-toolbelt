# gitui

> a fast TUI git client written in Rust — stage, commit, push, and browse history without leaving the terminal

## what it replaces

GitKraken / Tower / `git add` + `git commit` + `git log` > `gitui` -- full git workflow in a fast terminal UI with keyboard-driven navigation.

## install

```bash
brew install gitui
```

## 5-minute quickstart

```bash
gitui                             # launch in any git repo
# Tab to switch panels (status/log/stash/diff)
# Enter to stage/unstage files
# c to commit, p to push
# q to quit
```

## essential commands

| command | what it does |
|---------|-------------|
| `gitui` | launch gitui in the current git repo |
| `Tab` | switch between status, log, stash, and diff panels |
| `Enter` | stage or unstage the selected file |
| `Space` | stage individual hunks within a file |
| `c` | open commit dialog |
| `p` | push to remote |
| `f` | fetch from remote |
| `1`-`5` | jump directly to a specific tab |
| `/` | search in the current panel |
| `?` | show keybinding help |
| `q` | quit gitui |

## configuration

key bindings can be customized at `~/.config/gitui/key_bindings.ron`:

```ron
(
    move_up: Some(( code: Char('k'), modifiers: "")),
    move_down: Some(( code: Char('j'), modifiers: "")),
)
```

theme file at `~/.config/gitui/theme.ron` for color customization.

## aliases

```bash
alias gu="gitui"
alias gs="gitui"
```

## tips

- significantly faster than lazygit for large repos because it's written in Rust — noticeable on repos with thousands of commits
- hunk-level staging with Space is powerful — stage exactly the lines you want without `git add -p`
- keyboard-driven with vim-like navigation so you rarely need to reach for the mouse
- great for quick staging and committing when you don't need the full power of lazygit's interactive rebase
- complementary to lazygit — try both and pick your preference, or use gitui for speed and lazygit for complex operations

## learn more

- [GitHub](https://github.com/extrawurst/gitui)
