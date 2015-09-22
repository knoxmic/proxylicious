defmodule HelperConfigTest do
  use ExUnit.Case

  test "get proxy file from config" do
    assert Helper.Config.get(:proxylicious_data, :proxies) == "test/fixtures/proxies.txt"
  end

end
