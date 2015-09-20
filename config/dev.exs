# config/dev.exs
use Mix.Config

config :db,
  file: "db/proxies.sqlite3"
  # create table proxies(proxy varchar(255), ok_count int default 0, error_count int default 0, last_ok datetime, last_error datetime);

config :source,
  proxy_file: "static/proxies.txt"

config :check,
  url: "http://...",
  http_status_code: 200
