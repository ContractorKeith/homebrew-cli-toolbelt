# learning path: from GUI IDE to CLI in 4 weeks

you don't learn 40 tools in a day. this guide is a week-by-week progression from "i just opened Terminal" to "i don't miss VS Code anymore."

the core principle: **start with aliases that improve what you already do, then layer in new workflows one at a time.**

---

## week 1: drop-in replacements (zero new skills)

**goal**: make your existing terminal usage better without learning anything new.

### what to do

add these aliases to your `~/.zshrc` and restart your terminal:

```bash
alias ls="eza --color=always --long --git --icons=auto --no-permissions --no-user"
alias cat="bat --paging=never"
alias grep="rg"
alias find="fd"
alias du="dust"
alias df="duf"
alias help="tldr"
```

now use your terminal exactly as before. you'll immediately notice:

- `ls` shows git status, file icons, and colors
- `cat` has syntax highlighting and line numbers
- `grep` is dramatically faster and skips irrelevant files
- `find` has readable syntax
- `help curl` gives you 5 practical examples instead of a 200-page man page

### one new skill to try

**fzf Ctrl+R**: add `eval "$(fzf --zsh)"` to your `~/.zshrc`. now press `Ctrl+R` and start typing to fuzzy-search your command history. this alone is worth the entire install.

### one new tool to explore

**zoxide**: add `eval "$(zoxide init zsh)"` to your `~/.zshrc`. use `cd` normally for a few days. by the end of the week, try `z` with partial directory names: `z proj` instead of `cd ~/Documents/github/my-project`.

### time investment: 10 minutes to set up, 0 minutes to learn

---

## week 2: git and monitoring (two new TUI tools)

**goal**: replace your GUI git client and Activity Monitor.

### what to do

open any git repo in your terminal and run:

```bash
lazygit
```

spend 10 minutes exploring. press `?` in any panel to see keybindings. try:

1. navigate between panels with arrow keys or `h/l`
2. stage a file with `space`
3. open a file diff with `Enter`, then stage individual lines with `space`
4. commit with `c`
5. look at the **command log** (press `@`) to see what git commands lazygit is running

now run:

```bash
btop
```

this replaces Activity Monitor. click processes with your mouse. press `f` to filter. press `k` to kill. press `q` to quit.

### one new skill to try

**delta diffs**: configure delta as your git pager (see the [delta cheatsheet](cheatsheets/delta.md)). every `git diff` is now syntax-highlighted with word-level changes. you don't do anything differently; it's automatic.

### time investment: 30 minutes with lazygit, 5 minutes with btop

---

## week 3: file management and split panes (getting comfortable)

**goal**: stop switching to Finder. start using split panes instead of multiple windows.

### what to do

**yazi (file manager)**: navigate to a project directory and run:

```bash
yazi
```

use arrow keys to browse. press `Enter` to open files or enter directories. notice the file previews on the right: syntax-highlighted code, images, PDFs. press `q` to quit.

better yet, add the `y` shell function from the [yazi cheatsheet](cheatsheets/yazi.md) so quitting yazi lands you in the directory you were browsing.

**zellij (terminal multiplexer)**: start a session:

```bash
zellij
```

look at the status bar at the bottom. it tells you exactly what keys to press. try:

1. `Ctrl+p` then `d` to split pane down
2. `Ctrl+p` then `r` to split pane right
3. `Alt+arrow keys` to move between panes
4. run different things in each pane (code in one, git in another, server in a third)

**micro (text editor)**: when you need to edit a file:

```bash
micro config.yml
```

it works like any GUI editor: Ctrl+S save, Ctrl+C copy, Ctrl+V paste, Ctrl+Z undo, mouse click to place cursor. zero learning curve.

### one new skill to try

**starship prompt**: install the prompt and pick a theme:

```bash
starship preset catppuccin-mocha -o ~/.config/starship.toml
```

add `eval "$(starship init zsh)"` to `~/.zshrc`. your prompt now shows git branch, language versions, and command duration.

### time investment: 15 minutes each for yazi, zellij, micro. 5 minutes for starship.

---

## week 4: customize and go deeper

**goal**: make the terminal truly yours.

### what to do

**atuin (shell history)**: install and initialize (see [cheatsheet](cheatsheets/atuin.md)). press `Ctrl+R` to see your new shell history TUI. cycle through search modes with `Ctrl+R` again: global > host > session > directory.

import your existing history:
```bash
atuin import auto
```

**helix (modal editor)**: if you're curious about modal editing but intimidated by vim, try helix:

```bash
hx --tutor
```

the built-in tutorial takes 20-30 minutes and teaches the selection-first model. if you like it, start using `hx` for small edits alongside micro.

**customize your environment**: by now you know what tools you use most. personalize:

- edit `~/.config/starship.toml` to customize your prompt
- create `~/.config/bat/config` to set your preferred theme
- tweak lazygit's config to show icons and use delta
- explore `fzf` preview integrations with bat and eza

### one new skill to try

**jq**: practice with a real API:

```bash
curl -s https://api.github.com/repos/contractorkeith/homebrew-cli-toolbelt | jq '.'
curl -s https://api.github.com/repos/contractorkeith/homebrew-cli-toolbelt | jq '.name, .stargazers_count, .description'
```

### time investment: varies. this is where exploration begins.

---

## ongoing: layer in tools as needed

you don't need to use every tool in the tap. add them when a specific need arises:

| when you need to... | reach for... |
|---------------------|-------------|
| run project commands | `just` (Justfile) |
| manage runtime versions | `mise` |
| test an API | `httpie` or `xh` |
| work with YAML | `yq` |
| benchmark a command | `hyperfine` |
| count lines of code | `tokei` |
| auto-reload on file changes | `watchexec` or `entr` |
| read markdown in terminal | `glow` |
| explore JSON interactively | `fx` |
| auto-correct typos | `thefuck` |
| find a command you forgot | `navi` |
| manage environment variables | `direnv` |
| debug DNS | `doggo` |
| visualize network traffic | `bandwhich` |
| trace network routes | `trippy` |

---

## the graduation moment

you'll know the transition is complete when you catch yourself:

- opening Terminal before your IDE
- reaching for `Ctrl+R` instead of scrolling through files
- using `lg` for git instead of opening a GUI client
- saying "let me just check something real quick" and staying in the terminal
- feeling annoyed when you have to use a mouse

that's not "becoming a command-line person." that's just becoming efficient.

welcome to the CLI.
