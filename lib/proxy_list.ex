defmodule ProxyList do

  def raw do
    filename = Helper.Config.get(:proxylicious_data, :proxies)
    Helper.File.lines_as_list(filename)
  end

end
