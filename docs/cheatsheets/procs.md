# procs

> a modern replacement for ps with color, tree view, and search

## what it replaces

`ps` > `procs` -- shows processes with colorized output, human-readable columns, tree views, and built-in keyword search.

## install

```bash
brew install procs
```

## 5-minute quickstart

```bash
procs                       # show all running processes with color
procs node                  # search for processes matching "node"
procs --tree                # show process tree (parent-child relationships)
procs --sortd cpu           # sort by CPU usage, descending
```

## essential commands

| command | what it does |
|---------|-------------|
| `procs` | list all running processes with colored output |
| `procs node` | search for processes by name |
| `procs --tree` | display process tree showing parent-child relationships |
| `procs --watch` | continuously update the process list (like top) |
| `procs --sortd cpu` | sort by CPU usage, highest first |
| `procs --sortd mem` | sort by memory usage, highest first |
| `procs -a` | show all processes (including kernel threads) |
| `procs --pager disable` | disable the pager for piping output |
| `procs --insert elapsed` | add the elapsed time column to output |
| `procs 8080` | find processes using port 8080 |

## configuration

create `~/.config/procs/config.toml` to customize columns and colors:

```toml
[[columns]]
kind = "Pid"
style = "BrightYellow"

[[columns]]
kind = "Username"
style = "BrightGreen"

[[columns]]
kind = "Cpu"
style = "BrightRed"

[[columns]]
kind = "Mem"
style = "BrightCyan"

[[columns]]
kind = "Command"
style = "BrightWhite"
```

## aliases

```bash
alias ps="procs"
alias pst="procs --tree"
```

## tips

- search by name is built in: `procs python` finds all python processes instantly, no grep piping needed
- tree view (`--tree`) is great for understanding which processes spawned what -- useful for debugging runaway child processes
- use `--watch` as a colorful, minimal alternative to top/htop when you just need to monitor processes
- searching by port number (`procs 8080`) is incredibly useful for finding what's occupying a port

## learn more

- [GitHub](https://github.com/dalance/procs)
