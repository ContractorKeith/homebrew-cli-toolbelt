# thefuck

> auto-corrects your previous failed command — just type fuck and it fixes the mistake

## what it replaces

retyping commands after typos > `fuck` -- analyzes the previous failed command and suggests the corrected version automatically.

## install

```bash
brew install thefuck
```

## 5-minute quickstart

```bash
eval "$(thefuck --alias)"         # add to ~/.zshrc for shell integration
git pussh                          # oops, typo
fuck                               # thefuck suggests: git push
fuck --yeah                        # auto-apply correction without confirmation
```

## essential commands

| command | what it does |
|---------|-------------|
| `fuck` | correct the previous failed command |
| `fuck --yeah` | auto-apply the correction without asking |
| `fuck --debug` | show debug info for the last correction |
| `eval "$(thefuck --alias)"` | initialize shell integration (add to .zshrc) |
| `eval "$(thefuck --alias oops)"` | use a custom alias name instead of "fuck" |

## configuration

settings live in `~/.config/thefuck/settings.py`:

```python
# which rules to use (DEFAULT = all built-in rules)
rules = DEFAULT

# seconds to wait for a command to finish before giving up
wait_command = 3

# ask before applying correction
require_confirmation = True

# exclude specific rules
excluded_rules = ['fix_file']
```

## aliases

```bash
# shell integration (pick one)
eval "$(thefuck --alias)"          # default: fuck
eval "$(thefuck --alias fix)"      # family-friendly: fix
eval "$(thefuck --alias oops)"     # casual: oops
```

## tips

- type `fuck` after any failed command and it suggests the right version — handles typos in commands, arguments, and flags
- knows git commands extremely well: suggests `--set-upstream` when you forget, corrects branch names, fixes `git add` before commit
- handles `sudo` — if a command fails due to permissions, it re-runs with `sudo` prefixed
- can be aliased to anything less profane: `eval "$(thefuck --alias oops)"` gives you `oops` instead
- works with package managers too — suggests `brew install` when a command isn't found

## learn more

- [GitHub](https://github.com/nvbn/thefuck)
