# Stack Decisions

| Layer | Choice | Rationale |
|-------|--------|-----------|
| Language | Bash | Shell scripts for shell tool installation. No dependencies. |
| Package manager | Homebrew `brew bundle` | Native Brewfile support, one-command install |
| CI | GitHub Actions | Free for public repos, macOS runners available |
| Docs | Markdown | Static, no build step, renders on GitHub |
| License | MIT | Matches Keith's other projects |
| Shell config | POSIX-compat snippets | Works with zsh (default) and bash |

## Additional Notes

- No runtime dependencies. No Python. No Node. Just Bash + Homebrew + Markdown.
- All tools come from `homebrew-core` or `homebrew-cask` (no custom taps).
- Brewfiles are the source of truth for tool lists — everything else derives from them.
- Cheatsheets are plain Markdown, one file per tool, no templating engine.
- CI runs `brew bundle check` against each Brewfile to catch formula renames or removals.
- The install script targets `/bin/bash` (macOS system Bash) so it works before
  Homebrew installs a newer Bash.
