defmodule Helper do

  def random_sleep do
    :random.seed(:os.timestamp)
    :timer.sleep(1000 * :random.uniform |> round)
  end

end
