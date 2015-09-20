require IEx

defmodule Proxy do

  def raw_list do
    filename = Helper.Config.get(:source, :proxy_file)
    Helper.File.lines_as_list(filename)
  end

  def check(proxy) do
    url = Helper.Config.get(:check, :url)
    http_status_code = Helper.Config.get(:check, :http_status_code)

    IO.puts("#{proxy} -> #{url}")
    case HTTPoison.get(url, [], [{:proxy, proxy}]) do
      {:ok, %HTTPoison.Response{status_code: http_status_code, headers: headers}} ->
        {:ok}
      {:error, error} ->
        {:error}
    end
  end

  def register(:ok, proxy) do
    Sqlitex.with_db(Helper.Config.get(:db, :file), fn(db) ->
      Sqlitex.query(db, "INSERT INTO proxies (proxy, ok_count, last_ok) VALUES (:1, :2, :3);", [bind: [proxy, 1, "DATETIME('now')"]])
    end)
    IO.puts("ok: #{proxy}")
  end

  def register(:error, proxy) do
    Sqlitex.with_db(Helper.Config.get(:db, :file), fn(db) ->
      Sqlitex.query(db, "INSERT INTO proxies (proxy, error_count, last_error) VALUES (:1, :2, :3);", [bind: [proxy, 1, "DATETIME('now')"]])
    end)
    IO.puts("error: #{proxy}")
  end

end
