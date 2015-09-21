# config/test.exs
use Mix.Config

config :proxylicious, Repo,
  adapter: Sqlite.Ecto,
  database: "test/db/proxies.sqlite3"

config :source,
  proxy_file: "test/fixtures/proxies.txt"

config :check,
  url: "http://...",
  http_status_code: 200
