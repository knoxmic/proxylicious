require IEx

defmodule Proxylicious do

  def get_reliable_proxies(count) when count > 0 do
    proxies = Sqlitex.with_db(Helper.Config.get(:db, :file), fn(db) ->
      query = "SELECT proxy, SUM(ok_count) AS sum_ok, SUM(error_count) AS sum_error " <>
              "FROM proxies GROUP BY proxy ORDER BY SUM(ok_count-error_count) DESC LIMIT 0, :1;"
      Sqlitex.query(db, query, [bind: [count]])
    end)
    proxies |> Enum.map(fn(x) -> x[:proxy] end)
  end

  def check do
    Enum.each(1..3, fn(x) ->
      check_list
    end)
  end

  defp check_list do
    Enum.each(Proxy.raw_list, fn(proxy) ->
      spawn fn ->
        case Proxy.check(proxy) do
          {:ok}    -> Proxy.register(:ok, proxy)
          {:error} -> Proxy.register(:error, proxy)
        end
      end
    end)
  end

end
