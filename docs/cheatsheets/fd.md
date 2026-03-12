# fd

> a simple, fast, and user-friendly alternative to find

## what it replaces

`find` > `fd` -- replaces find's arcane syntax with intuitive defaults. automatically ignores .gitignore entries, hidden files, and binary files. 5-10x faster than find.

## install

```bash
brew install fd
```

## 5-minute quickstart

```bash
fd                               # list all files recursively (like find .)
fd "\.js$"                       # find all JavaScript files
fd readme                        # find files with "readme" in the name (case-insensitive)
fd -e py                         # find all .py files
fd -e py -x wc -l                # count lines in every Python file
```

## essential commands

| command | what it does |
|---------|-------------|
| `fd pattern` | find files matching pattern (regex, case-insensitive) |
| `fd -e js` | find files with .js extension |
| `fd -e js -e ts` | find .js and .ts files |
| `fd pattern path/` | search in a specific directory |
| `fd -H pattern` | include hidden files |
| `fd -I pattern` | don't respect .gitignore |
| `fd -t f pattern` | files only (no directories) |
| `fd -t d pattern` | directories only |
| `fd -d 2` | limit search depth to 2 levels |
| `fd -E node_modules` | exclude a directory |
| `fd -S +1m` | files larger than 1 megabyte |
| `fd -x command` | execute command on each result |
| `fd -X command` | execute command once with all results as args |
| `fd --changed-within 1d` | files modified in the last day |

## configuration

fd doesn't use a config file. set defaults via aliases.

## aliases

```bash
alias find="fd"
```

## tips

- `fd` with no arguments lists all files recursively from the current directory (respecting .gitignore). this is way more useful than `find .`
- the pattern is a regex by default but case-insensitive. `fd readme` matches README.md, readme.txt, etc.
- combine with bat for a "find and preview" workflow: `fd -e md | fzf --preview "bat --color=always {}"`
- use `-x` to run a command per result and `-X` to batch them. example: `fd -e jpg -X open` opens all JPGs in Preview
- `fd -e py --changed-within 2h` is great for "what Python files did i just touch?"
- fd outputs paths relative to the search root, making it perfect for piping into other tools

## learn more

- [GitHub](https://github.com/sharkdp/fd)
- [README](https://github.com/sharkdp/fd#readme)
