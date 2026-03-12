# zoxide

> a smarter cd command that learns your habits

## what it replaces

`cd` > `z` -- tracks which directories you visit and how often, then lets you jump to any of them by typing a partial name. no more `cd ../../projects/my-app/src`.

## install

```bash
brew install zoxide
```

add to `~/.zshrc`:
```bash
eval "$(zoxide init zsh)"
```

## 5-minute quickstart

```bash
# first, use cd normally for a few sessions so zoxide learns your paths
cd ~/Documents/github/my-project
cd ~/Desktop
cd ~/.config

# then start jumping
z my-project                     # jumps to ~/Documents/github/my-project
z config                         # jumps to ~/.config
z doc git                        # jumps to ~/Documents/github (matches both words)
zi                               # interactive selection with fzf
```

## essential commands

| command | what it does |
|---------|-------------|
| `z pattern` | jump to the best match for pattern |
| `z pat1 pat2` | jump to directory matching both patterns |
| `zi` | interactive mode (fuzzy search all tracked directories) |
| `zi pattern` | interactive mode with initial query |
| `z -` | jump to previous directory (like `cd -`) |
| `zoxide query pattern` | show what directory z would jump to (dry run) |
| `zoxide query -l` | list all tracked directories with scores |
| `zoxide query -l -s` | list all directories sorted by score |
| `zoxide add /path` | manually add a directory to the database |
| `zoxide remove /path` | remove a directory from the database |
| `zoxide edit` | interactively edit the database |

## configuration

zoxide works out of the box. optional environment variables in `~/.zshrc`:

```bash
# change the command name (default is z)
# eval "$(zoxide init zsh --cmd j)"  # use j instead of z

# set data directory (default is ~/.local/share/zoxide)
# export _ZO_DATA_DIR="$HOME/.zoxide"

# exclude directories from tracking
export _ZO_EXCLUDE_DIRS="$HOME:$HOME/Downloads:/tmp"
```

## aliases

```bash
# zoxide init already creates z and zi
# optionally add:
alias cd="z"                     # fully replace cd (bold move)
```

## tips

- zoxide uses "frecency" (frequency + recency) to rank directories. a directory you visited 5 times today outranks one you visited 50 times last month
- you need to visit directories at least once with regular `cd` before `z` can find them. after a day of normal use, zoxide becomes magical
- `zi` (interactive mode) uses fzf if installed, giving you fuzzy search across all tracked directories with a preview
- zoxide stores its database in `~/.local/share/zoxide/db.zo`. you can back this up or sync it across machines
- multi-word queries are powerful: `z doc git fence` would match `~/Documents/github/fence-calc` because all three words appear in the path

## learn more

- [GitHub](https://github.com/ajeetdsouza/zoxide)
- [README](https://github.com/ajeetdsouza/zoxide#readme)
