# atuin

> magical shell history that syncs, searches, and gives you context

## what it replaces

`Ctrl+R` (basic reverse search) / `history` > `atuin` -- replaces your shell history with a searchable, filterable database. shows command duration, exit code, directory context, and optionally syncs encrypted history across machines.

## install

```bash
brew install atuin
```

add to `~/.zshrc`:
```bash
eval "$(atuin init zsh)"
```

## 5-minute quickstart

```bash
# after adding to .zshrc and restarting shell:
Ctrl+R                           # open atuin search (replaces default fzf/shell history)
# type to search
# arrow keys to navigate results
# Enter to execute
# Tab to paste into command line without executing
```

## essential commands

| key/command | what it does |
|-------------|-------------|
| `Ctrl+R` | open interactive history search |
| `↑/↓` | navigate through results |
| `Enter` | execute selected command |
| `Tab` | insert command into prompt (edit before running) |
| `Ctrl+R` again | cycle search modes (global > host > session > directory) |
| `atuin search "pattern"` | search from command line |
| `atuin stats` | show shell usage statistics |
| `atuin history list` | list recent history |
| `atuin history list --cmd-only` | list commands only (no metadata) |
| `atuin import auto` | import existing shell history |

### search modes (cycle with Ctrl+R)

| mode | scope |
|------|-------|
| global | all history across all machines (if syncing) |
| host | only commands run on this machine |
| session | only commands from current terminal session |
| directory | only commands run in the current directory |

## configuration

```bash
mkdir -p ~/.config/atuin

cat << 'EOF' > ~/.config/atuin/config.toml
# search settings
search_mode = "fuzzy"            # fuzzy, prefix, fulltext, skim
filter_mode = "global"           # default search scope
style = "compact"                # compact, full

# display
show_preview = true              # show command preview
show_help = true                 # show help bar

# sync (optional - disabled by default)
# to enable: atuin register / atuin login
# sync_address = "https://api.atuin.sh"
# auto_sync = true
EOF
```

### optional: set up sync across machines

```bash
atuin register -u your_username -e your@email.com
# or
atuin login -u your_username
```

all history is end-to-end encrypted before syncing.

## aliases

```bash
# atuin replaces Ctrl+R automatically, no aliases needed
# but useful for quick stats:
alias hstats="atuin stats"
```

## tips

- the directory search mode is incredibly powerful for development. `Ctrl+R Ctrl+R Ctrl+R` to cycle to directory mode, then search -- you'll only see commands you've run in this specific project folder
- atuin tracks exit codes, so you can filter for failed commands to debug recurring issues
- command duration tracking helps you identify slow commands you might want to optimize
- `atuin stats` shows fascinating data: your most-used commands, busiest hours, command frequency
- import your existing history immediately after install: `atuin import auto` grabs bash/zsh/fish history
- sync is opt-in and encrypted. if you work across multiple machines (home Mac, work Mac), this is transformative

## learn more

- [GitHub](https://github.com/atuinsh/atuin)
- [docs](https://docs.atuin.sh/)
- [configuration reference](https://docs.atuin.sh/configuration/)
