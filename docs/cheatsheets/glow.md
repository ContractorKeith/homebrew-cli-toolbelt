# glow

> renders markdown beautifully in the terminal — no browser or editor needed

## what it replaces

`cat README.md` / opening in browser > `glow` -- renders markdown with proper formatting, colors, and layout right in your terminal.

## install

```bash
brew install glow
```

## 5-minute quickstart

```bash
glow README.md                    # render a markdown file with formatting
glow .                            # browse all markdown files in current directory
glow -p README.md                 # render in pager mode (scrollable)
cat notes.md | glow -             # pipe markdown content into glow
```

## essential commands

| command | what it does |
|---------|-------------|
| `glow README.md` | render a markdown file in the terminal |
| `glow .` | browse all markdown files in the current directory |
| `glow -p file.md` | render with pager mode for long documents |
| `glow -w 80 file.md` | set render width (useful for wide terminals) |
| `glow -s dark file.md` | use dark style |
| `glow -s light file.md` | use light style |
| `cat file.md \| glow -` | render piped markdown from stdin |
| `glow https://raw.githubusercontent.com/user/repo/main/README.md` | render markdown from a URL |

## configuration

glow uses `~/.config/glow/glow.yml` for defaults:

```yaml
# default style (dark, light, auto, notty)
style: "auto"
# word-wrap at width
width: 100
# enable pager
pager: true
```

## aliases

```bash
alias md="glow"
alias docs="glow -p"
```

## tips

- `glow .` is great for browsing project docs without leaving the terminal — it shows a file picker
- pair with fzf for fuzzy markdown browsing: `find . -name '*.md' | fzf --preview 'glow -s dark {}'`
- supports custom glamour styles if you want to match your terminal theme
- use `-w` to control width so tables and code blocks render cleanly on wide monitors
- works great in tmux/zellij sessions for reading docs alongside your code

## learn more

- [GitHub](https://github.com/charmbracelet/glow)
