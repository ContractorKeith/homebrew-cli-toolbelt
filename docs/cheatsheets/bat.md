# bat

> a cat clone with syntax highlighting and git integration

## what it replaces

`cat` > `bat` -- adds syntax highlighting for 200+ languages, line numbers, git change markers, and automatic paging for long files.

## install

```bash
brew install bat
```

## 5-minute quickstart

```bash
bat README.md                    # view a file with syntax highlighting
bat src/*.js                     # view multiple files
bat -A config.yml                # show invisible characters (tabs, spaces, newlines)
echo '{"name":"keith"}' | bat -l json   # pipe with explicit language
```

## essential commands

| command | what it does |
|---------|-------------|
| `bat file.py` | display file with syntax highlighting and line numbers |
| `bat -n file.py` | display with line numbers only (no header/grid) |
| `bat -p file.py` | plain output (no line numbers, no header, no grid) |
| `bat -A file.py` | show non-printable characters (tabs, spaces, newlines) |
| `bat -r 10:20 file.py` | show only lines 10 through 20 |
| `bat -l json file` | force a specific language for highlighting |
| `bat --diff file.py` | show only lines that differ from git index |
| `bat -d file.py` | short form of --diff |
| `bat --list-languages` | list all supported languages |
| `bat --list-themes` | list all available color themes |
| `bat --theme=Dracula file.py` | use a specific theme |
| `bat file1.py file2.py` | concatenate and display multiple files |

## configuration

create `~/.config/bat/config` to set defaults:

```bash
mkdir -p ~/.config/bat
cat << 'EOF' > ~/.config/bat/config
# set the theme
--theme="Catppuccin Mocha"

# show line numbers but no grid
--style="numbers,changes,header"

# use italics for comments
--italic-text=always
EOF
```

list themes and preview them:
```bash
bat --list-themes | fzf --preview="bat --theme={} --color=always ~/.zshrc"
```

## aliases

```bash
alias cat="bat --paging=never"
alias less="bat"
```

## tips

- bat automatically uses a pager (less) for long files. use `--paging=never` in aliases if you want cat-like behavior
- pair with fzf for fuzzy file preview: `fzf --preview 'bat --color=always {}'`
- bat works as a drop-in `MANPAGER`: add `export MANPAGER="sh -c 'col -bx | bat -l man -p'"` to get syntax-highlighted man pages
- use `bat --diff` to quickly see what you've changed in a file vs. the last git commit
- bat integrates with delta automatically for git diffs

## learn more

- [GitHub](https://github.com/sharkdp/bat)
- [docs/configuration](https://github.com/sharkdp/bat#configuration-file)
