# ripgrep (rg)

> a line-oriented search tool that recursively searches directories for a regex pattern

## what it replaces

`grep` > `rg` -- 10-100x faster than grep, automatically respects .gitignore, skips binary files, uses smart case sensitivity, and shows colorized output with context.

## install

```bash
brew install ripgrep
```

## 5-minute quickstart

```bash
rg "TODO"                        # search all files recursively for "TODO"
rg "function" src/               # search only in src/ directory
rg -i "error" --type js          # case-insensitive, JavaScript files only
rg "useState" -C 3               # show 3 lines of context around matches
```

## essential commands

| command | what it does |
|---------|-------------|
| `rg "pattern"` | search recursively from current directory |
| `rg "pattern" path/` | search in a specific directory |
| `rg -i "pattern"` | case-insensitive search |
| `rg -w "word"` | match whole words only |
| `rg -l "pattern"` | list only filenames that contain matches |
| `rg -c "pattern"` | count matches per file |
| `rg -C 3 "pattern"` | show 3 lines of context around each match |
| `rg -B 2 -A 5 "pattern"` | show 2 lines before and 5 after |
| `rg --type js "pattern"` | search only JavaScript files |
| `rg --type-list` | list all recognized file types |
| `rg -g "*.py" "pattern"` | search files matching a glob |
| `rg -g "!test*" "pattern"` | exclude files matching a glob |
| `rg --no-ignore "pattern"` | don't respect .gitignore |
| `rg -F "literal string"` | search for a literal string (no regex) |
| `rg "pattern" --replace "new"` | show what replacements would look like |

## configuration

create `~/.ripgreprc` and point to it:

```bash
cat << 'EOF' > ~/.ripgreprc
# search settings
--smart-case
--hidden
--glob=!.git

# output settings
--colors=line:fg:yellow
--colors=line:style:bold
--colors=path:fg:green
--colors=match:fg:red
--colors=match:style:bold
EOF

# add to ~/.zshrc
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
```

## aliases

```bash
alias grep="rg"
alias rgi="rg -i"                # case insensitive shortcut
alias rgf="rg -l"               # filenames only
alias rgt="rg --type"           # search by type shortcut
```

## tips

- smart case is the killer feature: `rg error` matches "error" and "Error", but `rg Error` only matches "Error" (any uppercase letter triggers case-sensitive mode)
- rg respects `.gitignore` by default, so searching a project with `node_modules` is fast. use `--no-ignore` when you need to search ignored files
- combine with fzf for interactive search: `rg --line-number "pattern" | fzf`
- use `--json` output for piping into jq: `rg --json "TODO" | jq '.data.lines.text'`
- VS Code and GitHub Copilot both use ripgrep internally for code search. when you learn rg, you're learning the same engine

## learn more

- [GitHub](https://github.com/BurntSushi/ripgrep)
- [user guide](https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md)
