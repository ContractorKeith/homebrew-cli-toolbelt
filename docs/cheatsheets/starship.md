# starship

> the minimal, blazing-fast, and infinitely customizable prompt for any shell

## what it replaces

`user@host $` (default prompt) > `starship` -- shows git branch, repo status, language versions, command duration, error codes, and more. works across bash, zsh, fish, and 10+ other shells with one config file.

## install

```bash
brew install starship
```

add to `~/.zshrc`:
```bash
eval "$(starship init zsh)"
```

## 5-minute quickstart

```bash
# after adding to .zshrc and restarting your shell:
cd any-git-repo                  # prompt shows branch, status, language
mkdir test && cd test            # prompt simplifies for non-repo dirs
starship preset catppuccin-mocha -o ~/.config/starship.toml  # install a theme
```

## essential concepts

starship is configured entirely through `~/.config/starship.toml`. it's module-based: each piece of info (git branch, node version, etc.) is a module that appears when relevant.

| module | shows | appears when |
|--------|-------|-------------|
| `directory` | current path | always |
| `git_branch` | branch name | in a git repo |
| `git_status` | modified/staged/ahead | in a git repo with changes |
| `nodejs` | node version | package.json present |
| `python` | python version | .py files or venv present |
| `rust` | rust version | Cargo.toml present |
| `cmd_duration` | last command time | command took > 2 seconds |
| `character` | prompt symbol | always (green=success, red=error) |

## configuration

```bash
mkdir -p ~/.config

cat << 'EOF' > ~/.config/starship.toml
# get a preset: starship preset catppuccin-mocha -o ~/.config/starship.toml

# or start minimal:
format = """
$directory\
$git_branch\
$git_status\
$nodejs\
$python\
$rust\
$cmd_duration\
$line_break\
$character"""

[directory]
truncation_length = 3
truncate_to_repo = true

[git_branch]
format = "[$symbol$branch]($style) "

[git_status]
format = '([\[$all_status$ahead_behind\]]($style) )'

[cmd_duration]
min_time = 2_000      # show for commands over 2 seconds
format = "took [$duration]($style) "

[character]
success_symbol = "[>](bold green)"
error_symbol = "[>](bold red)"
EOF
```

list all presets:
```bash
starship preset --list
```

## aliases

no aliases needed. starship replaces your prompt automatically.

## tips

- starship only shows modules when relevant. enter a directory with a `Cargo.toml` and the Rust version appears. leave and it vanishes. this keeps the prompt clean
- the `cmd_duration` module is surprisingly useful. it tells you how long your last command took without needing to run `time`
- use a preset as your starting point, then customize. catppuccin-mocha, gruvbox-rainbow, and tokyo-night are popular choices
- starship is fast because it's Rust. it adds < 5ms to your prompt rendering, which is imperceptible
- if you previously used powerlevel10k, starship is the recommended migration path. p10k's creator has stepped back from the project

## learn more

- [starship.rs](https://starship.rs/)
- [configuration reference](https://starship.rs/config/)
- [presets gallery](https://starship.rs/presets/)
