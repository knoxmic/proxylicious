# config/dev.exs
use Mix.Config

config :source,
  proxy_file: "static/test.txt"

config :check,
  url: "http://...",
  http_status_code: 200
