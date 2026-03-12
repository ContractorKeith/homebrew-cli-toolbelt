# jq

> a lightweight and flexible command-line JSON processor

## what it replaces

manually reading JSON / online JSON formatters > `jq` -- parses, filters, transforms, and pretty-prints JSON from the command line. essential for working with APIs, config files, and any JSON data.

## install

```bash
brew install jq
```

## 5-minute quickstart

```bash
echo '{"name":"keith","role":"estimator"}' | jq '.'          # pretty-print
echo '{"name":"keith","role":"estimator"}' | jq '.name'      # extract field
curl -s https://api.github.com/users/contractorkeith | jq '.' # format API response
cat package.json | jq '.dependencies | keys'                  # list dependency names
```

## essential commands

| expression | what it does |
|-----------|-------------|
| `jq '.'` | pretty-print (identity filter) |
| `jq '.field'` | extract a field |
| `jq '.nested.field'` | extract a nested field |
| `jq '.array[0]'` | get first element of array |
| `jq '.array[-1]'` | get last element of array |
| `jq '.array[2:5]'` | slice array (elements 2,3,4) |
| `jq '.array \| length'` | count array elements |
| `jq '.[] \| .name'` | extract .name from each array element |
| `jq 'keys'` | list all keys of an object |
| `jq 'to_entries'` | convert object to key-value pairs |
| `jq 'select(.age > 30)'` | filter: keep items where age > 30 |
| `jq 'map(.name)'` | transform: extract .name from each element |
| `jq 'sort_by(.date)'` | sort array by field |
| `jq -r '.name'` | raw output (no quotes around strings) |
| `jq -c '.'` | compact output (one line) |
| `jq -s '.'` | slurp: read all inputs into single array |

## common recipes

```bash
# pretty-print a file
jq '.' data.json

# extract specific fields from array of objects
cat users.json | jq '.[] | {name: .name, email: .email}'

# filter and count
cat logs.json | jq '[.[] | select(.level == "error")] | length'

# get unique values
cat data.json | jq '[.[].category] | unique'

# create new JSON from existing
cat input.json | jq '{total: (.items | length), names: [.items[].name]}'

# merge two JSON files
jq -s '.[0] * .[1]' file1.json file2.json

# convert JSON to CSV-ish output
cat users.json | jq -r '.[] | [.name, .email] | @csv'

# update a field
cat config.json | jq '.version = "2.0.0"'
```

## configuration

jq doesn't use a config file. it's stateless and reads from stdin or files.

## aliases

```bash
# pretty-print JSON from clipboard
alias jqp="pbpaste | jq '.'"

# pretty-print with colors always (useful for piping to less)
alias jqc="jq -C '.'"
```

## tips

- `jq '.'` is the simplest and most useful command. pipe any JSON into it for instant pretty-printing with syntax highlighting
- use `-r` (raw output) when piping jq output to other commands. without it, strings are quoted: `"keith"` vs `keith`
- the pipe operator `|` in jq works like Unix pipes but inside the JSON processor. chain operations: `.users | map(.name) | sort`
- `select()` is the filter function: `select(.status == "active")` keeps only matching items
- for exploring unfamiliar JSON, start with `jq 'keys'` to see top-level structure, then drill down
- jq pairs perfectly with httpie/curl for API exploration: `http GET api.example.com/users | jq '.data[].name'`

## learn more

- [GitHub](https://github.com/jqlang/jq)
- [manual](https://jqlang.github.io/jq/manual/)
- [jq playground](https://jqplay.org/) (interactive web tool for testing expressions)
