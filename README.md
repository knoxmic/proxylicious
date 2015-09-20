proxylicious
============

Test your proxy list for reliability.

## Install
1. Use `mix deps.get` to get dependencies.
4. Modify proxy list `static/proxies.txt`
4. Modify config file `config/dev.exs`

## Usage

```iex
iex> Proxylicious.check
iex> Proxylicious.get_reliable_proxies(2)
```
