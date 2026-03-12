# httpie

> a human-friendly HTTP client with colorized output and intuitive syntax

## what it replaces

`curl` > `http` -- replaces cryptic curl flags with readable syntax, auto-formats JSON, and colorizes output by default.

## install

```bash
brew install httpie
```

## 5-minute quickstart

```bash
http GET httpbin.org/get           # simple GET request with colorized output
http POST httpbin.org/post name=keith age:=37   # POST JSON body (strings and numbers)
http httpbin.org/headers Authorization:"Bearer mytoken"   # add custom headers
echo '{"id":1}' | http PUT httpbin.org/put      # pipe JSON body from stdin
```

## essential commands

| command | what it does |
|---------|-------------|
| `http GET url` | send a GET request with colorized output |
| `http POST url name=value` | send POST with JSON body (string value) |
| `http POST url count:=5` | send POST with JSON body (non-string value) |
| `http url key==value` | add query string parameters |
| `http PUT url < file.json` | send request body from file |
| `http url Authorization:Bearer\ token` | set custom headers |
| `http --form POST url field=value` | send form-encoded data instead of JSON |
| `http -d url` | download file to disk |
| `http --offline POST url name=test` | print the request without sending it |
| `http --session=myapi url` | save/reuse auth and headers in a named session |
| `http --verify=no url` | skip SSL certificate verification |
| `http --print=HhBb url` | control output: H=request headers, B=request body, h/b=response |

## configuration

create `~/.config/httpie/config.json` for defaults:

```json
{
    "default_options": ["--style=monokai"]
}
```

## aliases

```bash
alias GET="http GET"
alias POST="http POST"
alias PUT="http PUT"
```

## tips

- JSON is the default content type — no need to set `Content-Type` headers for API calls
- syntax is intuitive: `:` for headers, `=` for string data, `:=` for raw JSON values, `==` for query params
- sessions save auth tokens and headers so you don't retype them for repeated API calls
- `http --print=HhBb` controls exactly what's shown: uppercase for request, lowercase for response (Headers/Body)
- pair with `jq` for powerful API exploration: `http api.example.com/data | jq '.results[]'`

## learn more

- [GitHub](https://github.com/httpie/cli)
