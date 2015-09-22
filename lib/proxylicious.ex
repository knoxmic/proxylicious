require IEx

defmodule Proxylicious do

  def get(count \\ 1) when count > 0 do
    proxies = Sqlitex.with_db(Helper.Config.get(:proxylicious_data, :db), fn(db) ->
      query = "SELECT proxy, SUM(ok) AS sum_ok, SUM(error) AS sum_error " <>
              "FROM requests GROUP BY proxy ORDER BY SUM(ok-error) DESC LIMIT 0, :1;"
       Sqlitex.query(db, query, [bind: [count]])
    end)

    proxies |> Enum.map(fn(x) -> x[:proxy] end) |> Enum.shuffle
  end

  def run do
    setup

    list = ProxyList.raw |> Enum.shuffle
    Enum.each(list, fn(proxy) ->
      spawn fn ->
        Helper.random_sleep
        case request(proxy) do
          {:ok, proxy} -> 
            Proxy.add(:ok, proxy)
            IO.write(".")
          {:error, proxy} ->
            Proxy.add(:error, proxy)
            IO.write("F")
        end
      end
    end)
  end

  def request(proxy) do
    url = Helper.Config.get(:proxylicious_check, :url)
    _status_code = Helper.Config.get(:proxylicious_check, :status_code)

    try do
      request = HTTPoison.get(url, [], [{:proxy, proxy}, {:timeout, Helper.Config.get(:proxylicious_check, :timeout)}])
      case request do
        {:ok, %HTTPoison.Response{status_code: _status_code, headers: _headers}} -> {:ok, proxy}
        {:error, _error} -> {:error, proxy}
      end
    rescue
      _ -> {:error, proxy}
    end
  end

  def clear do
    setup

    Proxy.clear  
  end

  defp setup do
    Repo.start_link
  end

end
