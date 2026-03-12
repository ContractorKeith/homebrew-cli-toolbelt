# lazygit

> a simple terminal UI for git commands

## what it replaces

GitKraken / Tower / VS Code Git panel > `lazygit` -- a full git client in your terminal with staging, rebasing, merge conflict resolution, cherry-picking, and stash management. shows the actual git commands being executed so you learn git while you use it.

## install

```bash
brew install lazygit
```

## 5-minute quickstart

```bash
cd your-git-repo
lazygit                          # or just: lg (if you set the alias)
```

navigate between panels with arrow keys or `h/j/k/l`. press `?` in any panel to see available keybindings.

## essential commands

| key | context | what it does |
|-----|---------|-------------|
| `?` | anywhere | show keybindings for current panel |
| `h/l` or `←/→` | anywhere | switch between panels |
| `j/k` or `↑/↓` | anywhere | move up/down in current panel |
| `space` | files panel | stage/unstage file |
| `a` | files panel | stage/unstage all files |
| `space` | staging view | stage/unstage individual lines |
| `c` | files panel | commit staged changes |
| `P` | anywhere | push to remote |
| `p` | anywhere | pull from remote |
| `Enter` | files panel | open file diff / staging view |
| `n` | branches panel | create new branch |
| `space` | branches panel | checkout branch |
| `M` | branches panel | merge selected branch into current |
| `r` | branches panel | rebase current branch onto selected |
| `s` | files panel | stash changes |
| `S` | stash panel | pop stash |
| `/` | anywhere | search/filter |
| `q` | anywhere | quit lazygit |
| `@` | anywhere | open command log (see actual git commands) |

## configuration

create `~/Library/Application Support/lazygit/config.yml`:

```yaml
gui:
  showIcons: true          # requires Nerd Font
  theme:
    selectedLineBgColor:
      - reverse
  mouseEvents: true
  showCommandLog: true     # always show the command log panel
git:
  paging:
    colorArg: always
    pager: delta --dark --paging=never
```

## aliases

```bash
alias lg="lazygit"
```

## tips

- the command log panel (`@`) is the single best way to learn git. every action you take in the UI shows the underlying git command. after a few weeks of lazygit, you'll know git better than most developers
- press `Enter` on a file to see the diff, then use `space` to stage individual lines or hunks. this replaces VS Code's line-level staging
- interactive rebasing is visual: press `r` on a branch, then in the commits panel use `e` to edit, `s` to squash, `d` to drop, and drag to reorder
- for merge conflicts: lazygit shows both sides with clear highlighting. press `space` on the version you want to keep
- `z` undoes the last git action (reflog-based). this is your safety net while learning
- lazygit reads delta config automatically if delta is your git pager

## learn more

- [GitHub](https://github.com/jesseduffield/lazygit)
- [keybindings reference](https://github.com/jesseduffield/lazygit/blob/master/docs/keybindings)
- [video tutorial](https://youtu.be/CPLdltN7wgE)
