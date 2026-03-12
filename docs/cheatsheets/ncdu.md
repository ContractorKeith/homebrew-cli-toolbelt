# ncdu

> an interactive disk usage analyzer with an ncurses UI

## what it replaces

`du` (interactive) > `ncdu` -- gives you a browsable, interactive view of disk usage where you can navigate directories and delete files on the spot.

## install

```bash
brew install ncdu
```

## 5-minute quickstart

```bash
ncdu                        # scan and browse current directory
ncdu /home                  # scan a specific path
ncdu -x /                   # scan root but stay on one filesystem
ncdu --exclude '*.log'      # skip log files during scan
```

## essential commands

| command | what it does |
|---------|-------------|
| `ncdu` | scan current directory and open interactive browser |
| `ncdu /path` | scan a specific directory |
| `ncdu -x /` | stay on one filesystem (don't cross mount points) |
| `ncdu --exclude pattern` | exclude files matching a pattern |
| `ncdu -e` | enable shell mode (spawn shell in selected directory) |
| arrow keys / `j` `k` | navigate up and down the list |
| enter / right arrow | drill into a directory |
| left arrow | go back to parent directory |
| `d` | delete the selected file or directory |
| `n` | sort by name |
| `s` | sort by size |
| `g` | cycle through graph modes (percent, bar, both) |
| `q` | quit ncdu |

## configuration

no config file needed. ncdu is controlled through flags and keyboard shortcuts within the interactive UI.

```bash
# scan and export results to a file for later viewing
ncdu -o scan.json /path

# load a previously saved scan
ncdu -f scan.json
```

## aliases

```bash
alias du-i="ncdu"
alias diskclean="ncdu -x /"
```

## tips

- press `d` to delete files directly from the UI -- powerful but be careful, there's no undo
- use `-x` when scanning `/` to avoid scanning mounted network drives or external volumes
- export scans with `-o scan.json` on remote servers, then view locally with `-f scan.json` -- great for headless systems
- press `g` to cycle through percentage, bar graph, and combined views
- pairs well with dust for quick non-interactive overviews before diving into ncdu for cleanup

## learn more

- [GitHub](https://dev.yorhel.nl/ncdu)
