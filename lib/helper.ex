defmodule Helper do

  def random_sleep do
    << a :: 32, b :: 32, c :: 32 >> = :crypto.rand_bytes(12)
    :random.seed(a,b,c)
    :timer.sleep(1000 * :random.uniform |> round)
  end

end
