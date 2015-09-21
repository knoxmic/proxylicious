defmodule ProxyListTest do
  use ExUnit.Case

  test "get raw list" do
    assert ProxyList.raw == ["xxx.xxx.xxx.xxx:80"]
  end

end
