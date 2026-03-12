# superfile

> a modern TUI file manager with dual-pane support and file preview

## what it replaces

Finder / `ls` + `cd` + `cp` + `mv` > `spf` -- full file management with dual panes, preview, and keyboard-driven navigation without leaving the terminal.

## install

```bash
brew install superfile
```

## 5-minute quickstart

```bash
spf                               # launch superfile in current directory
# use arrow keys or hjkl to navigate
# press Tab to open a second pane
# press Space to select files, then y to copy and p to paste
```

## essential commands

| command | what it does |
|---------|-------------|
| `spf` | launch superfile in the current directory |
| arrows / `hjkl` | navigate files and directories |
| `Enter` | open directory or file |
| `Space` | select/deselect a file |
| `y` | copy selected files |
| `x` | cut selected files |
| `p` | paste files |
| `d` | delete selected files |
| `r` | rename file or directory |
| `n` | create new file |
| `N` | create new directory |
| `/` | search files in current directory |
| `Tab` | switch between panes |
| `q` | quit superfile |

## configuration

config lives at `~/.config/superfile/config.toml`:

```toml
[general]
default_open_file_preview = true

[style]
theme = "catppuccin"
```

## aliases

```bash
alias sf="spf"
alias fm="spf"
```

## tips

- dual-pane layout is great for moving and copying files between directories — Tab switches focus
- file preview is built-in so you can see contents before opening
- supports themes to match your terminal color scheme
- lighter and simpler alternative to yazi if you want straightforward file management
- keyboard-driven workflow is faster than Finder once you learn the shortcuts

## learn more

- [GitHub](https://github.com/yorukot/superfile)
