# mise

> a single version manager for every language — replaces nvm, pyenv, rbenv, and asdf

## what it replaces

`nvm`/`pyenv`/`rbenv`/`asdf` > `mise` -- one tool to manage runtime versions for Node, Python, Ruby, Go, Java, and dozens more.

## install

```bash
brew install mise
```

## 5-minute quickstart

```bash
mise install node@20              # install Node 20
mise use node@20                  # set Node 20 for this project (.mise.toml)
mise use --global node@20         # set Node 20 as your global default
mise current                      # show active versions for all tools
```

## essential commands

| command | what it does |
|---------|-------------|
| `mise install node@20` | install a specific version of a tool |
| `mise use node@20` | set version for current project (writes .mise.toml) |
| `mise use --global node@20` | set version as the global default |
| `mise ls` | list all installed tool versions |
| `mise ls-remote node` | list all available versions for a tool |
| `mise current` | show currently active versions |
| `mise exec node@18 -- node script.js` | run a command with a specific version |
| `mise prune` | remove unused versions to free disk space |
| `mise self-update` | update mise itself |
| `mise trust` | trust a project's .mise.toml file |
| `mise doctor` | check health and diagnose config issues |

## configuration

add a `.mise.toml` to your project root for per-project versions:

```toml
[tools]
node = "20"
python = "3.12"
```

global config lives at `~/.config/mise/config.toml`.

add shell integration to `~/.zshrc`:

```bash
eval "$(mise activate zsh)"
```

## aliases

```bash
alias mi="mise install"
alias mu="mise use"
alias mc="mise current"
```

## tips

- replaces asdf, nvm, pyenv, and rbenv with a single tool — fewer shell plugins, faster startup
- commit `.mise.toml` to git so your whole team uses the same versions automatically
- `mise doctor` catches config issues and missing shell integration — run it after first setup
- mise reads `.node-version`, `.python-version`, and `.tool-versions` files so migration from other managers is seamless
- significantly faster than asdf because it's written in Rust

## learn more

- [GitHub](https://github.com/jdx/mise)
