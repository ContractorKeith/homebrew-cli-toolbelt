# just

> a modern task runner that replaces make without the quirks

## what it replaces

`make` > `just` -- runs project tasks defined in a simple `justfile` without make's tab sensitivity, implicit rules, or confusing syntax.

## install

```bash
brew install just
```

## 5-minute quickstart

```bash
just --init                 # create a starter justfile in current directory
just --list                 # show all available recipes
just test                   # run the "test" recipe
just --choose               # pick a recipe with fzf
```

## essential commands

| command | what it does |
|---------|-------------|
| `just` | run the default recipe (first one in the justfile) |
| `just <recipe>` | run a specific recipe by name |
| `just --list` | show all available recipes with descriptions |
| `just --choose` | interactively pick a recipe using fzf |
| `just --dry-run <recipe>` | show what would run without executing |
| `just --evaluate` | display all variable values |
| `just --fmt` | auto-format the justfile |
| `just --init` | create a new justfile in the current directory |
| `just --summary` | list recipe names (compact, no descriptions) |
| `just <recipe> arg1 arg2` | pass arguments to a recipe |

## configuration

create a `justfile` in your project root (no extension, no capital letters needed):

```just
# run the dev server
dev:
    npm run dev

# run tests with verbose output
test:
    pytest -v

# lint and format the codebase
lint:
    ruff check src/
    black src/

# deploy to production (runs tests first)
deploy: test
    ./deploy.sh

# recipe with arguments
greet name:
    echo "Hello, {{name}}!"

# set environment variables
export DATABASE_URL := "sqlite:///dev.db"

# use variables
version := "1.0.0"
build:
    echo "Building version {{version}}"
```

## aliases

```bash
alias j="just"
alias jl="just --list"
alias jc="just --choose"
```

## tips

- recipes are just shell commands with no tab weirdness -- spaces work fine, unlike make
- `just --choose` with fzf is amazing for discoverability on projects with lots of recipes
- recipes support dependencies: `deploy: test lint` runs test and lint before deploy
- justfiles are self-documenting: add a comment above any recipe and it shows in `just --list`
- just searches parent directories for a justfile, so you can run `just` from any subdirectory

## learn more

- [GitHub](https://github.com/casey/just)
- [docs](https://just.systems/man/en/)
