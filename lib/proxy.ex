require IEx

defmodule Proxy do
  use Ecto.Model

  schema "requests" do
    field :proxy
    field :ok, :integer
    field :error, :integer
    field :last_ok, Ecto.DateTime
    field :last_error, Ecto.DateTime
  end

  def add(:ok, proxy) do
    _add(1, proxy)
  end

  def add(:error, proxy) do
    _add(0, proxy)
  end

  def _add(status, proxy) do
    case status do
      1 -> proxy = %Proxy{proxy: proxy, ok: 1, error: 0, last_ok: Ecto.DateTime.utc}
      0 -> proxy = %Proxy{proxy: proxy, ok: 0, error: 1, last_error: Ecto.DateTime.utc}
    end
    Repo.insert!(proxy)

    {:ok}
  end

  def clear do
    Repo.delete_all(Proxy)  
  end

end
