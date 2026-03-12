# fzf

> a general-purpose command-line fuzzy finder

## what it replaces

`Ctrl+R` (basic history search) > `fzf` -- transforms any list into a fuzzy-searchable, interactive selection. powers shell history, file finding, directory jumping, and integrates with dozens of other tools.

## install

```bash
brew install fzf
```

## 5-minute quickstart

```bash
# add to ~/.zshrc for shell integrations
eval "$(fzf --zsh)"

# now try these
Ctrl+R                           # fuzzy search command history
Ctrl+T                           # fuzzy find files, insert into command
Alt+C                            # fuzzy find directories, cd into selection

# pipe anything into fzf
ls | fzf                         # pick a file interactively
git branch | fzf                 # pick a branch interactively
```

## essential commands

| command | what it does |
|---------|-------------|
| `Ctrl+R` | fuzzy search shell history (after shell integration) |
| `Ctrl+T` | fuzzy find file and insert path into current command |
| `Alt+C` | fuzzy find directory and cd into it |
| `command \| fzf` | pipe any list into interactive fuzzy finder |
| `fzf --preview 'bat {}'` | fuzzy find with file preview |
| `fzf -m` | multi-select mode (Tab to select, Enter to confirm) |
| `fzf --height=40%` | inline mode (doesn't take over full screen) |
| `fzf -q "query"` | start with an initial query |
| `fzf --preview 'bat --color=always {}'` | preview files with syntax highlighting |
| `fzf --bind 'ctrl-y:execute-silent(echo {} \| pbcopy)'` | custom keybinding |

## configuration

add to `~/.zshrc`:

```bash
# shell integration (Ctrl+R, Ctrl+T, Alt+C)
eval "$(fzf --zsh)"

# default options
export FZF_DEFAULT_OPTS="
  --height=40%
  --layout=reverse
  --border
  --info=inline
  --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796
  --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6
  --color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796
"

# use fd instead of find for file finding
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git"

# preview with bat
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :200 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --level=2 --icons {}'"
```

## aliases

```bash
# fuzzy open file in editor
alias fe='micro $(fzf --preview "bat --color=always {}")'

# fuzzy git checkout branch
alias gcb='git checkout $(git branch | fzf | tr -d " ")'

# fuzzy kill process
alias fkill='kill -9 $(ps aux | fzf | awk "{print \$2}")'
```

## tips

- fzf is the glue that holds the modern CLI together. once you internalize Ctrl+R and Ctrl+T, you'll wonder how you ever lived without them
- in multi-select mode (`fzf -m`), Tab selects individual items. great for staging specific files or deleting specific processes
- type multiple words separated by spaces for AND matching. prefix with `!` to negate: `fzf` then type `js !test` finds js files without "test"
- prefix with `'` for exact match: `'README` only matches "README" exactly
- fzf integrates with forgit, lazygit, yazi, atuin, navi, and dozens more tools. installing fzf improves everything else
- the `--preview` flag accepts any command. use bat for files, eza for directories, jq for JSON

## learn more

- [GitHub](https://github.com/junegunn/fzf)
- [wiki/examples](https://github.com/junegunn/fzf/wiki/Examples)
