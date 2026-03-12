# eza

> a modern replacement for ls with git integration and icons

## what it replaces

`ls` > `eza` -- adds color-coded file types, git status per file, file icons (with Nerd Font), tree view, and human-readable sizes by default.

## install

```bash
brew install eza
```

requires a [Nerd Font](https://www.nerdfonts.com/) for icons: `brew install --cask font-fira-code-nerd-font`

## 5-minute quickstart

```bash
eza                              # list files (colored, clean)
eza -la --git --icons            # long list with git status and icons
eza --tree --level=2             # tree view, 2 levels deep
eza -la --sort=modified          # sort by most recently modified
```

## essential commands

| command | what it does |
|---------|-------------|
| `eza` | list files with color |
| `eza -l` | long format (permissions, size, date) |
| `eza -la` | long format including hidden files |
| `eza --icons` | show file-type icons (needs Nerd Font) |
| `eza --git` | show git status for each file (M=modified, N=new) |
| `eza --tree` | recursive tree view |
| `eza --tree --level=3` | tree view limited to 3 levels |
| `eza -l --sort=size` | sort by file size |
| `eza -l --sort=modified` | sort by modification time |
| `eza -l --sort=name` | sort alphabetically |
| `eza --group-directories-first` | directories listed first |
| `eza -l --no-permissions --no-user` | clean long view (no permission/owner clutter) |

## configuration

eza reads from `EZA_` environment variables. add to `~/.zshrc`:

```bash
# set default options
export EZA_COLORS="da=37"  # dim the date column

# or just use aliases (recommended)
```

## aliases

```bash
alias ls="eza --color=always --long --git --icons=auto --no-permissions --no-user"
alias ll="eza --color=always --long --git --icons=auto --all"
alias la="eza --all --icons=auto"
alias tree="eza --tree --icons=auto --level=3"
alias lt="eza --tree --icons=auto --level=2"
```

## tips

- the `--git` flag shows per-file status: `M` modified, `N` new/untracked, `-` unchanged. this replaces mentally running `git status` constantly
- combine with `--git-ignore` to hide files in `.gitignore` from listings
- `eza --icons=auto` only shows icons when output is a terminal (not when piping), which prevents garbled output in scripts
- tree view with `--git-ignore` is an excellent way to see your project structure without node_modules clutter: `eza --tree --git-ignore --icons`
- for a quick project overview: `eza --tree --level=2 --icons --git --long --no-permissions --no-user`

## learn more

- [GitHub](https://github.com/eza-community/eza)
- [man page](https://github.com/eza-community/eza/blob/main/man/eza.1.md)
