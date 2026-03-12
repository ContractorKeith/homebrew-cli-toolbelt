# delta

> a syntax-highlighting pager for git, diff, grep, and blame output

## what it replaces

`git diff` (unreadable) > `delta` -- transforms git diffs into syntax-highlighted, word-level change views with line numbers and side-by-side mode. works automatically once configured as your git pager.

## install

```bash
brew install git-delta
```

## 5-minute quickstart

```bash
# configure as your git pager (one-time setup):
git config --global core.pager delta
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.navigate true
git config --global delta.dark true
git config --global merge.conflictstyle diff3

# now every git diff is beautiful:
git diff                         # syntax-highlighted diff
git log -p                       # syntax-highlighted commit diffs
git show HEAD                    # syntax-highlighted commit
git blame file.py                # enhanced blame view
```

## essential commands

delta works automatically as a git pager. no new commands to learn.

| git command | delta enhancement |
|-------------|------------------|
| `git diff` | syntax highlighting, line numbers, word-level changes |
| `git diff --staged` | same enhancements for staged changes |
| `git log -p` | syntax-highlighted patch output |
| `git show` | syntax-highlighted commit view |
| `git blame` | enhanced blame with better formatting |
| `git stash show -p` | syntax-highlighted stash diffs |
| `git add -p` | delta highlights the interactive staging view |

### delta-specific features while viewing diffs

| key | what it does |
|-----|-------------|
| `n` | jump to next file (when delta.navigate = true) |
| `N` | jump to previous file |
| `q` | quit pager |
| `/pattern` | search within diff |

## configuration

add to `~/.gitconfig` (or run the git config commands above):

```ini
[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    navigate = true
    dark = true
    side-by-side = false
    line-numbers = true
    syntax-theme = "Catppuccin Mocha"

[merge]
    conflictstyle = diff3

[diff]
    colorMoved = default
```

for side-by-side diffs (wider terminals):
```ini
[delta]
    side-by-side = true
```

## aliases

```bash
alias diff="delta"               # use delta for standalone diff too
```

## tips

- delta is invisible once configured. every `git diff`, `git log -p`, `git show`, etc. automatically uses delta. you don't change your workflow at all
- word-level diffing is the killer feature. instead of highlighting entire changed lines, delta shows exactly which words changed within a line
- `navigate = true` lets you jump between files in a diff with `n`/`N`, which is much faster than scrolling
- side-by-side mode (`side-by-side = true`) is great on wide screens but can be hard to read on laptops. leave it off by default and use `git diff | delta --side-by-side` when you want it
- delta supersedes diff-so-fancy entirely. if you're using diff-so-fancy, switch to delta
- lazygit automatically uses delta as its diff pager if delta is configured as your git pager

## learn more

- [GitHub](https://github.com/dandavison/delta)
- [configuration](https://dandavison.github.io/delta/)
- [theme gallery](https://dandavison.github.io/delta/supported-languages-and-themes.html)
