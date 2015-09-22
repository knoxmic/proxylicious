# config/test.exs
use Mix.Config

config :proxylicious, Repo,
  adapter: Sqlite.Ecto,
  database: "test/db/proxies.sqlite3"

config :proxylicious_data,
  db: "test/db/proxies.sqlite3",
  proxies: "test/fixtures/proxies.txt"

config :proxylicious_check,
  url: "http://...",
  status_code: 200, # 301
  timeout: 5000 # ms