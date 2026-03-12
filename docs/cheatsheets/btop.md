# btop

> a resource monitor with a beautiful TUI

## what it replaces

`top` / Activity Monitor > `btop` -- gorgeous system monitor with per-core CPU graphs, memory/disk/network visualization, process management, mouse support, and 20+ color themes.

## install

```bash
brew install btop
```

## 5-minute quickstart

```bash
btop                             # launch the monitor
# use mouse to click panels, or:
# arrow keys to navigate
# ESC for menu
# q to quit
```

## essential commands

| key | what it does |
|-----|-------------|
| `ESC` | open main menu |
| `q` | quit |
| `h` | toggle help |
| `m` | cycle memory display mode |
| `n` | cycle network display mode |
| `d` | cycle disk display mode |
| `e` | toggle per-core CPU graphs |
| `p` | cycle sort order for process list |
| `r` | reverse sort order |
| `f` or `/` | filter processes by name |
| `Enter` | expand process details |
| `k` | send SIGTERM to selected process (kill) |
| `K` | send SIGKILL to selected process (force kill) |
| `t` | toggle tree view for processes |
| `+/-` | expand/collapse process tree |
| `Tab` | cycle between panels |

## configuration

btop config is at `~/.config/btop/btop.conf`. easiest to configure from the menu (ESC > Options):

```bash
# or set some useful defaults manually:
mkdir -p ~/.config/btop
cat << 'EOF' > ~/.config/btop/btop.conf
color_theme = "catppuccin_mocha"
theme_background = False
truecolor = True
shown_boxes = "cpu mem net proc"
update_ms = 1000
proc_tree = True
proc_sorting = "cpu lazy"
EOF
```

## aliases

```bash
alias top="btop"
```

## tips

- macOS limitation: CPU temperature and GPU metrics are not available through btop due to Apple API restrictions. for Apple Silicon thermals, use `asitop` or `macmon` as a complement
- click any process with your mouse to select it, then press `k` to kill it. this is faster than finding PIDs
- tree view (`t`) groups child processes under their parent, which is great for seeing what's spawning subprocesses
- btop themes live in `~/.config/btop/themes/`. download community themes from the btop GitHub repo
- the network panel shows real-time bandwidth per interface, which is useful for spotting unexpected network activity
- press `e` to toggle per-core CPU display. on Apple Silicon, this shows efficiency vs. performance cores

## learn more

- [GitHub](https://github.com/aristocratos/btop)
- [themes](https://github.com/aristocratos/btop/tree/main/themes)
