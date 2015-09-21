defmodule Helper.Config do

  def get(region, key) do
    Application.get_all_env(region) 
    |> List.keyfind(key, 0) 
    |> Tuple.to_list 
    |> List.last
  end

end
