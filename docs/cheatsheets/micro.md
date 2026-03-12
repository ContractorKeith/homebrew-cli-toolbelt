# micro

> a modern and intuitive terminal-based text editor

## what it replaces

nano / TextEdit / "i need to edit a file but don't know vim" > `micro` -- a terminal editor that uses the same keybindings as GUI editors (Ctrl+S to save, Ctrl+C to copy, Ctrl+V to paste). zero learning curve if you've used any GUI text editor.

## install

```bash
brew install micro
```

## 5-minute quickstart

```bash
micro file.py                    # open a file
micro                            # open empty buffer
# just start typing. it works exactly like you expect.
# Ctrl+S to save, Ctrl+Q to quit
```

## essential commands

| key | what it does |
|-----|-------------|
| `Ctrl+S` | save |
| `Ctrl+Q` | quit |
| `Ctrl+Z` | undo |
| `Ctrl+Y` | redo |
| `Ctrl+C` | copy selection |
| `Ctrl+X` | cut selection |
| `Ctrl+V` | paste |
| `Ctrl+A` | select all |
| `Ctrl+D` | duplicate line |
| `Ctrl+F` | find |
| `Ctrl+H` | find and replace |
| `Ctrl+G` | go to line number |
| `Ctrl+E` | open command bar |
| `Ctrl+T` | open new tab |
| `Alt+,` / `Alt+.` | switch tabs left/right |
| `Ctrl+W` | cycle between splits |
| mouse click | place cursor |
| mouse drag | select text |
| mouse scroll | scroll |

### command bar (Ctrl+E)

| command | what it does |
|---------|-------------|
| `set colorscheme monokai` | change color scheme |
| `set tabsize 4` | set tab width |
| `set softtabs true` | use spaces instead of tabs |
| `set ruler true` | show column ruler |
| `hsplit filename` | horizontal split |
| `vsplit filename` | vertical split |
| `tab filename` | open file in new tab |

## configuration

micro config is at `~/.config/micro/settings.json`:

```bash
mkdir -p ~/.config/micro

cat << 'EOF' > ~/.config/micro/settings.json
{
    "autoindent": true,
    "colorscheme": "catppuccin-mocha",
    "cursorline": true,
    "hlsearch": true,
    "keepautoindent": true,
    "mkparents": true,
    "ruler": true,
    "savecursor": true,
    "scrollbar": true,
    "softtabs": true,
    "tabsize": 4
}
EOF
```

## aliases

```bash
alias nano="micro"
export EDITOR="micro"            # set as default editor for git, etc.
export VISUAL="micro"
```

## tips

- micro is intentionally positioned as the "gateway editor" for terminal newcomers. if you know Ctrl+S/C/V, you already know micro
- mouse support works fully: click to place cursor, drag to select, scroll wheel works. this is the closest thing to editing in a GUI
- micro supports syntax highlighting for 130+ languages out of the box. no plugins needed for basic editing
- split views work: `Ctrl+E` then `vsplit` or `hsplit` to work on two files side by side
- plugin support exists for linting, auto-completion, and file trees. install with `micro -plugin install [name]`
- set micro as your `EDITOR` and `VISUAL` environment variable so git commit messages, `crontab -e`, etc. all use micro instead of vim

## learn more

- [GitHub](https://github.com/zyedidia/micro)
- [docs](https://micro-editor.github.io/)
- [keybindings](https://github.com/zyedidia/micro/blob/master/runtime/help/keybindings.md)
