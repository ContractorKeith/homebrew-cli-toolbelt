# helix

> a post-modern text editor with built-in LSP and tree-sitter

## what it replaces

vim/neovim (with less config) > `helix` -- a modal editor like vim but with a "select-then-act" model that's more visual and intuitive. ships with LSP support, syntax highlighting, and auto-completion out of the box. no plugins to install or configure.

## install

```bash
brew install helix
```

## 5-minute quickstart

```bash
hx file.py                       # open a file
# you start in NORMAL mode (status bar shows "NOR")
# press i to enter INSERT mode (type text)
# press Esc to return to NORMAL mode
# type :w to save
# type :q to quit
# type :wq to save and quit
```

## core concept: select-then-act

helix uses the opposite model from vim:
- **vim**: verb first, then object (`d` delete, then `w` word) = "delete word"
- **helix**: select first, then verb (`w` select word, then `d` delete) = "select word, then delete it"

this means you always SEE what you're about to change before you change it. much less scary for beginners.

## essential commands (normal mode)

| key | what it does |
|-----|-------------|
| `i` | enter insert mode (before cursor) |
| `a` | enter insert mode (after cursor) |
| `Esc` | return to normal mode |
| `h/j/k/l` | move left/down/up/right |
| `w` | select next word |
| `b` | select previous word |
| `x` | select current line |
| `d` | delete selection |
| `c` | change selection (delete and enter insert mode) |
| `y` | yank (copy) selection |
| `p` | paste after cursor |
| `u` | undo |
| `U` | redo |
| `/` | search |
| `n` | next search result |
| `N` | previous search result |
| `:w` | save |
| `:q` | quit |
| `:wq` | save and quit |
| `:q!` | quit without saving |

### space menu (press Space in normal mode)

| key | what it does |
|-----|-------------|
| `Space f` | file picker (fuzzy find files) |
| `Space b` | buffer picker (switch between open files) |
| `Space s` | symbol picker (jump to function/class) |
| `Space /` | global search across project |
| `Space k` | show docs for item under cursor (LSP hover) |
| `Space a` | code actions (LSP) |
| `Space r` | rename symbol (LSP) |

### goto menu (press g in normal mode)

| key | what it does |
|-----|-------------|
| `g g` | go to start of file |
| `g e` | go to end of file |
| `g d` | go to definition (LSP) |
| `g r` | go to references (LSP) |
| `g l` | go to end of line |
| `g h` | go to start of line |

## configuration

helix config is at `~/.config/helix/config.toml`:

```bash
mkdir -p ~/.config/helix

cat << 'EOF' > ~/.config/helix/config.toml
theme = "catppuccin_mocha"

[editor]
line-number = "relative"
cursorline = true
auto-save = true
bufferline = "multiple"          # show tabs when multiple files open
color-modes = true               # color status line by mode

[editor.cursor-shape]
insert = "bar"
normal = "block"
select = "underline"

[editor.file-picker]
hidden = false                   # show hidden files in picker

[editor.lsp]
display-messages = true
display-inlay-hints = true

[editor.indent-guides]
render = true
EOF
```

### language servers

helix auto-detects and uses language servers. install them for your languages:

```bash
# python
pip install python-lsp-server --break-system-packages

# javascript/typescript
npm install -g typescript-language-server typescript

# rust
rustup component add rust-analyzer
```

check what's available: `hx --health`

## aliases

```bash
# helix binary is "hx"
alias hx="helix"                 # not needed if brew install works
export EDITOR="hx"               # set as default editor (after you're comfortable)
```

## tips

- the tutor is built in: run `hx --tutor` for an interactive tutorial that teaches you helix in 20-30 minutes
- helix's "select-then-act" model is genuinely easier to learn than vim's "verb-then-object" because you see what's selected before you act on it
- the space menu is your command palette (like Cmd+Shift+P in VS Code). press Space and read the popup
- LSP works immediately if the language server is installed. no plugin configuration needed. this is the biggest advantage over vim/neovim for new users
- helix does NOT have a plugin system yet (planned). if you need extensive customization, neovim is the answer. if you want productive editing with minimal config, helix wins
- tree-sitter provides semantic syntax highlighting. it understands your code structure, not just regex patterns

## learn more

- [helix-editor.com](https://helix-editor.com/)
- [GitHub](https://github.com/helix-editor/helix)
- [docs](https://docs.helix-editor.com/)
- [keymap reference](https://docs.helix-editor.com/keymap.html)
