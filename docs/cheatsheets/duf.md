# duf

> a better df -- disk usage with a colorful, human-readable table

## what it replaces

`df` > `duf` -- replaces cryptic df output with a clean, colorized table showing disk usage, mount points, and filesystem types at a glance.

## install

```bash
brew install duf
```

## 5-minute quickstart

```bash
duf                         # show all mounted filesystems in a nice table
duf /home                   # show info for a specific path
duf --only local            # show only local filesystems (skip network mounts)
duf --sort size             # sort output by size
```

## essential commands

| command | what it does |
|---------|-------------|
| `duf` | display all mounted filesystems |
| `duf /path` | show disk usage for a specific path |
| `duf --all` | include pseudo, duplicate, and inaccessible filesystems |
| `duf --only local` | show only local filesystems |
| `duf --only network` | show only network filesystems |
| `duf --sort size` | sort output by size |
| `duf --hide-mp "/snap/*"` | hide specific mount points by pattern |
| `duf --hide-fs tmpfs` | hide specific filesystem types |
| `duf --json` | output as JSON for scripting |
| `duf --theme light` | use light theme for light terminal backgrounds |

## configuration

no config file needed -- duf looks good out of the box. use flags for customization, or set the `DUF_THEME` environment variable:

```bash
export DUF_THEME="light"    # add to .zshrc for light terminals
```

## aliases

```bash
alias df="duf"
alias dfl="duf --only local"
```

## tips

- great for a quick "how full are my drives" check -- way more readable than df -h
- json output (`duf --json`) is handy for disk monitoring scripts or dashboards
- use `--only local` to skip noisy network and virtual mounts
- combine `--hide-fs` and `--hide-mp` to clean up output on systems with lots of mount points

## learn more

- [GitHub](https://github.com/muesli/duf)
