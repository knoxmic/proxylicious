require IEx

defmodule ProxyTest do
  use ExUnit.Case

  setup_all do
    Repo.start_link
    Repo.delete_all(Proxy)
    :ok
  end

  test "add ok" do
    assert Proxy.add(:ok, "xxx.xxx.xxx.xxx:80") == {:ok}
  end

  test "add error" do
    assert Proxy.add(:error, "xxx.xxx.xxx.xxx:80") == {:ok}
  end

end
