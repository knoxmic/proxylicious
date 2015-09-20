defmodule HelperConfigTest do
  use ExUnit.Case

  test "get proxy file from config" do
    assert Helper.Config.get(:source, :proxy_file) == "static/test.txt"
  end

end
