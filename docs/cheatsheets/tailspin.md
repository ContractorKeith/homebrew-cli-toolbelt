# tailspin

> a log file viewer that adds automatic syntax highlighting to any log

## what it replaces

`tail`/`less` for logs > `tspin` -- auto-detects and highlights dates, IPs, URLs, numbers, HTTP methods, log levels, and more with zero configuration.

## install

```bash
brew install tailspin
```

## 5-minute quickstart

```bash
tspin app.log                   # view a log file with highlighting
tspin --follow app.log          # follow a log file (like tail -f)
cat app.log | tspin             # pipe any output through tailspin
kubectl logs pod-name | tspin   # highlight kubernetes logs
```

## essential commands

| command | what it does |
|---------|-------------|
| `tspin file.log` | open a log file with syntax highlighting in a pager |
| `tspin --follow file.log` | follow a log file in real time (like tail -f) |
| `tspin -f file.log` | short form of --follow |
| `tspin --print file.log` | print highlighted output without a pager |
| `cat file.log \| tspin` | pipe any command output through tailspin |
| `docker logs app \| tspin` | highlight docker container logs |
| `kubectl logs pod \| tspin` | highlight kubernetes pod logs |
| `journalctl -f \| tspin` | highlight systemd journal in real time |
| `tspin -f /var/log/system.log` | follow system logs with highlighting |

## configuration

no configuration needed -- tailspin auto-detects and highlights common log patterns out of the box. it recognizes:

- dates and timestamps
- IP addresses (v4 and v6)
- URLs
- numbers
- HTTP methods (GET, POST, etc.)
- log levels (INFO, WARN, ERROR, DEBUG)
- UUIDs
- key-value pairs

## aliases

```bash
alias tail="tspin --follow"
alias logs="tspin"
```

## tips

- zero config is the killer feature: just pipe anything through `tspin` and it figures out what to highlight
- works great as a universal log viewer -- docker, kubernetes, systemd, nginx, application logs all get highlighted automatically
- use `--print` when piping to another tool so it doesn't open a pager
- pair with `--follow` to replace `tail -f` with a much more readable experience
- the highlighting makes it much easier to spot errors and timestamps in dense log output

## learn more

- [GitHub](https://github.com/bensadeh/tailspin)
