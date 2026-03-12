# sd

> a simpler, faster find-and-replace tool

## what it replaces

`sed` > `sd` -- does find-and-replace without sed's cryptic syntax. string literals by default, no need to escape slashes.

## install

```bash
brew install sd
```

## 5-minute quickstart

```bash
sd 'old_text' 'new_text' file.txt          # replace in a file
sd -p 'old_text' 'new_text' < file.txt     # preview replacements (dry run)
cat file.txt | sd 'old' 'new'              # use in a pipe
fd -e py | xargs sd 'old_func' 'new_func'  # bulk replace across python files
```

## essential commands

| command | what it does |
|---------|-------------|
| `sd 'old' 'new' file` | replace all occurrences in a file (in-place) |
| `sd -p 'old' 'new' < file` | preview changes without modifying the file |
| `cat file \| sd 'old' 'new'` | replace text from stdin and print to stdout |
| `sd '\d+' 'NUM' file` | use regex to replace all numbers with NUM |
| `sd -f i 'old' 'new' file` | case-insensitive replacement |
| `sd 'foo/bar' 'baz/qux' file` | replace paths -- no escaping slashes needed |
| `sd '(\w+)@(\w+)' '$2/$1' file` | regex with capture groups |
| `fd -e js \| xargs sd 'var' 'const'` | bulk replace across files found by fd |
| `sd -s 'exact.match' 'new' file` | fixed-string mode (disable regex entirely) |

## configuration

no config file -- sd is a single-purpose tool controlled entirely by flags.

## aliases

```bash
alias replace="sd"
```

## tips

- the biggest win over sed: no need to escape slashes in paths. `sd 'usr/local' 'opt/homebrew' file` just works
- string literals are the default, so dots and brackets are treated literally unless you use regex
- pair with fd for powerful bulk renames: `fd -e py | xargs sd 'old_func' 'new_func'` replaces across an entire codebase
- always preview first with `-p` when doing large replacements -- there's no undo for in-place edits
- works great in shell scripts as a drop-in sed replacement with cleaner syntax

## learn more

- [GitHub](https://github.com/chmln/sd)
