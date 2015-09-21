defmodule ProxyList do

  def raw do
    filename = Helper.Config.get(:source, :proxy_file)
    Helper.File.lines_as_list(filename)
  end

end
