# yazi

> a blazing fast terminal file manager written in Rust

## what it replaces

Finder / `ls + cd` workflow > `yazi` -- a full file manager in your terminal with file previews (syntax-highlighted code, images, PDFs, video thumbnails), dual-pane navigation, bulk operations, and plugin support.

## install

```bash
brew install yazi ffmpeg poppler
# ffmpeg = video thumbnails, poppler = PDF previews
```

## 5-minute quickstart

```bash
yazi                             # open file manager in current directory
yazi ~/Documents                 # open in specific directory
# navigate with arrow keys or h/j/k/l
# Enter to open file/enter directory
# q to quit (returns to where you started)
# Q to quit and cd to current directory
```

## essential commands

| key | what it does |
|-----|-------------|
| `h/j/k/l` or arrows | navigate (left=parent, right=enter, up/down=move) |
| `Enter` | open file in default app or enter directory |
| `q` | quit yazi |
| `Q` | quit and change shell directory to current location |
| `~` | show all keybindings (help) |
| `space` | select/deselect file |
| `V` | visual/range select mode |
| `y` | yank (copy) selected files |
| `d` | cut selected files |
| `p` | paste yanked/cut files |
| `D` | permanently delete (move to trash on macOS) |
| `r` | rename file |
| `a` | create new file |
| `A` | create new directory |
| `/` | search in current directory |
| `z` | jump to directory (zoxide integration) |
| `.` | toggle hidden files |
| `t` | toggle tabs |
| `1-9` | switch to tab N |
| `w` | show task manager (for ongoing copy/move operations) |

## configuration

yazi config lives in `~/.config/yazi/`. three files:

```bash
mkdir -p ~/.config/yazi

# yazi.toml - main config
cat << 'EOF' > ~/.config/yazi/yazi.toml
[manager]
show_hidden = false
sort_by = "natural"
sort_dir_first = true

[preview]
max_width = 1000
max_height = 1000
EOF

# theme.toml - customize colors (or use a preset)
# keymap.toml - customize keybindings
```

## aliases

```bash
# this function lets you cd into the directory you were browsing when you quit yazi
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}
```

## tips

- the `y` shell function above is the recommended way to use yazi. it lets you browse to a directory, press `q`, and your shell is now in that directory. without it, quitting yazi returns you to where you started
- yazi previews are excellent: syntax-highlighted code (via bat integration), image previews in iTerm2/Kitty/Ghostty/WezTerm, PDF rendering via poppler, and video thumbnails via ffmpeg
- zoxide integration (`z` key) lets you jump to any frecency-ranked directory without leaving yazi
- bulk rename: select files with `space`, then press `r` to rename them all (opens in your editor)
- yazi has a Lua plugin system. popular plugins: bookmarks, git status indicators, max-preview (full-screen preview)
- press `w` to see the task manager for long copy/move operations. yazi handles these asynchronously

## learn more

- [GitHub](https://github.com/sxyazi/yazi)
- [docs](https://yazi-rs.github.io/)
- [plugins](https://yazi-rs.github.io/docs/plugins/overview)
