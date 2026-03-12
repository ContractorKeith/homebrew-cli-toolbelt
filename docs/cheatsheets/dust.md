# dust

> a more intuitive, visual alternative to du for disk usage

## what it replaces

`du` > `dust` -- shows disk usage with visual bar charts sorted by size, making it immediately obvious where your space is going.

## install

```bash
brew install dust
```

## 5-minute quickstart

```bash
dust                        # show disk usage for current directory
dust -n 10                  # show only the top 10 entries
dust -d 2 /path             # limit depth to 2 levels
dust -X node_modules        # ignore node_modules directory
```

## essential commands

| command | what it does |
|---------|-------------|
| `dust` | show disk usage for current directory with visual bars |
| `dust /path` | show disk usage for a specific path |
| `dust -n 10` | limit output to top 10 largest entries |
| `dust -d 2` | limit directory depth to 2 levels |
| `dust -r` | reverse the output order (smallest first) |
| `dust -s` | show apparent size instead of disk usage |
| `dust -b` | hide the percent bars (numbers only) |
| `dust -f` | flat view -- show only files, no directories |
| `dust -i` | ignore hidden files and directories |
| `dust -X node_modules` | exclude a specific directory |
| `dust -X '*.log'` | exclude files matching a pattern |

## configuration

no config file needed -- dust works great out of the box. all options are passed as flags.

## aliases

```bash
alias du="dust"
alias du10="dust -n 10"
```

## tips

- the visual bars make it instantly clear which directories are eating your disk -- no mental math needed
- pairs well with ncdu if you want to interactively browse and delete large files after spotting them with dust
- use `dust -d 1` for a quick top-level overview of a drive or home directory
- pipe-friendly: `dust -b` gives clean output without bars for scripting

## learn more

- [GitHub](https://github.com/bootandy/dust)
