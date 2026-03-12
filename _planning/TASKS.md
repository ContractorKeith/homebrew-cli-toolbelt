# Sprint 1 Task Checklist

## Phase 1: Repo Scaffolding + Rename

- [x] Rename repo from `homebrew-devtools` to `homebrew-cli-toolbelt`
- [x] Update all internal references to new repo name
- [x] Create directory structure: `docs/cheatsheets/`, `shell/`, `Formula/`
- [x] Add README.md with tier overview and install instructions

## Phase 2: Install Scripts

- [x] Write `install.sh` with interactive tier selector
- [x] Write `setup-shell.sh` for shell config (aliases, completions, PATH)
- [x] Make install idempotent (safe to re-run)
- [x] Create three Brewfiles: `Brewfile.minimal`, `Brewfile.intermediate`, `Brewfile`

## Phase 3: CI Workflow

- [x] Create `test-brewfiles.yml` GitHub Actions workflow
- [x] Validate all three Brewfiles resolve against homebrew-core/cask
- [x] Run on macOS runner

## Phase 4: Missing Docs

- [x] Write `docs/WHY-CLI.md` — motivation for CLI tooling
- [x] Write `CONTRIBUTING.md` — how to add tools and cheatsheets
- [x] Write `CLAUDE.md` — project instructions for AI agents
- [x] Add `LICENSE` (MIT)
- [x] Add `.gitignore`

## Phase 5: Cheatsheets

- [x] dust — disk usage (better `du`)
- [x] duf — disk free (better `df`)
- [x] sd — find-and-replace (better `sed`)
- [x] procs — process viewer (better `ps`)
- [x] tailspin — log file highlighter
- [x] ncdu — interactive disk usage
- [x] just — command runner (better `make`)
- [x] mise — runtime version manager
- [x] httpie — HTTP client (better `curl`)
- [x] glow — Markdown renderer for terminal
- [x] navi — interactive cheatsheet browser
- [x] thefuck — auto-correct previous command
- [x] superfile — TUI file manager
- [x] gitui — TUI git client

## Verification

- [x] Rename audit — no leftover `homebrew-devtools` references
- [x] Cheatsheet count matches tool count in Brewfiles
- [x] Directory structure matches README description
