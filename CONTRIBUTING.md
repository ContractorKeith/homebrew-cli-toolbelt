# Contributing to homebrew-cli-toolbelt

Thanks for helping make the terminal better for everyone. Here's how to contribute.

## Suggesting a Tool

Open an issue with:

- **Tool name** and one-line description
- **What it replaces** (e.g., `cat` -> `bat`, `find` -> `fd`)
- **GitHub link** and approximate star count
- **Why it belongs** — what problem does it solve for CLI-first developers?
- **Which tier** — minimal (essential, everyone needs it), intermediate (strong upgrade), or full (power user / niche)

We lean toward tools that are actively maintained, available in homebrew-core, and genuinely better than the built-in they replace.

## Writing a Cheatsheet

Every tool in the Brewfiles should have a matching cheatsheet in `docs/cheatsheets/`. Follow this structure:

1. **What it replaces** — one sentence
2. **Install** — `brew install <tool>`
3. **5-Minute Quickstart** — 3-5 commands to get someone productive immediately
4. **Essential Commands** — table with columns: Command, What it does, Example
5. **Configuration** — config file location, key settings
6. **Aliases** — suggested shell aliases
7. **Tips** — 2-3 things people usually discover late
8. **Learn More** — links to official docs, repo, tldr page

Keep cheatsheets practical. Write for someone who just installed the tool and wants to start using it in the next 5 minutes.

## Reporting Broken Formulae

If `brew bundle check` fails for any Brewfile:

1. Open an issue with the error output
2. Include your macOS version (`sw_vers`) and `brew --version`
3. Note which Brewfile failed (minimal, intermediate, or full)

The weekly CI catches most of these, but upstream changes can break things between runs.

## Pull Request Guidelines

- **One tool per PR** — easier to review and revert if needed
- **Include a cheatsheet** if you're adding a new tool
- **Test the Brewfile** — run `brew bundle check --file=<Brewfile>` locally before submitting
- **Update the tier** — if a tool moves between tiers, update all affected Brewfiles
- Keep commit messages clear: `feat: add ripgrep to minimal tier`

## PR Checklist

- [ ] Tool exists in homebrew-core or homebrew-cask (no custom taps)
- [ ] Brewfile validates with `brew bundle check`
- [ ] Cheatsheet follows the template structure
- [ ] Tool is placed in the correct tier
- [ ] README tool count is updated if applicable

## Code of Conduct

Be helpful and constructive. We're building a toolkit, not debating text editors. If you think a tool is better than what's listed, show us why with concrete examples.

## Questions?

Open an issue. There are no dumb questions about terminal tools — we all started somewhere.
