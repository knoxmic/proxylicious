# config/dev.exs
use Mix.Config

config :proxylicious, Repo,
  adapter: Sqlite.Ecto,
  database: "db/proxies.sqlite3"
  # create table requests(id integer, proxy varchar(255), ok int default 0, error int default 0, last_ok datetime, last_error datetime);

config :proxylicious_data,
  db: "db/proxies.sqlite3",
  proxies: "static/proxies.txt"

config :proxylicious_check,
  url: "http://...",
  status_code: 200, # 301
  timeout: 5000 # ms
