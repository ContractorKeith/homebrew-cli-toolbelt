# navi

> an interactive cheatsheet and snippet manager — stop googling the same commands

## what it replaces

searching man pages / googling commands > `navi` -- interactive fuzzy finder for command cheatsheets with variable substitution built in.

## install

```bash
brew install navi
```

## 5-minute quickstart

```bash
navi                              # launch interactive cheatsheet browser
navi --query "docker"             # open browser pre-filtered to docker commands
navi --print                      # print selected command without executing it
navi repo add denisidoro/cheats   # add community cheatsheets
```

## essential commands

| command | what it does |
|---------|-------------|
| `navi` | launch the interactive cheatsheet browser |
| `navi --query "docker"` | open browser pre-filtered by keyword |
| `navi fn welcome` | run a specific named snippet |
| `navi --print` | print the command without executing it |
| `navi repo add user/repo` | add community cheatsheet repository |
| `navi repo browse` | browse available community cheatsheet repos |
| `navi --path /path/to/cheats` | use a custom cheatsheet directory |
| `navi --best-match --query "tar extract"` | non-interactive mode, runs best match directly |

## configuration

cheatsheets live in `~/.local/share/navi/cheats/`. create your own `.cheat` files:

```
% docker, containers

# Stop all running containers
docker stop $(docker ps -q)

# Remove all stopped containers
docker rm $(docker ps -a -q)

# Run a container with port mapping
docker run -d -p <host_port>:<container_port> <image>

$ image: docker images --format '{{.Repository}}:{{.Tag}}'
```

variables in `<angle_brackets>` become interactive prompts. lines starting with `$` define dynamic suggestions.

## aliases

```bash
alias cheat="navi"
alias cs="navi --query"
```

## tips

- community cheatsheets save hours of googling — `navi repo add denisidoro/cheats` gets you started with hundreds of commands
- widget mode (Ctrl+G after shell integration) lets you search and insert commands inline as you type
- write your own cheatsheets for project-specific commands like deploy scripts or database queries
- the `$ variable` syntax lets you pull dynamic options from shell commands (e.g., list docker images for selection)
- add shell integration to `~/.zshrc`: `eval "$(navi widget zsh)"`

## learn more

- [GitHub](https://github.com/denisidoro/navi)
