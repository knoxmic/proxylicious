# config/dev.exs
use Mix.Config

config :proxylicious, Repo,
  adapter: Sqlite.Ecto,
  database: "db/proxies.sqlite3"
  # create table requests(id integer, proxy varchar(255), ok int default 0, error int default 0, last_ok datetime, last_error datetime);

config :source,
  proxy_file: "static/proxies.txt"

config :check,
  url: "http://...",
  http_status_code: 200
