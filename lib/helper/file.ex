require IEx

defmodule Helper.File do

  def lines_as_list(filename) do
    if File.exists?(filename) do
      stream = File.stream!(filename, [:read, :utf8], :line)
      data = Enum.reduce stream, [], fn(line, listing) ->
        [process_line(line) | listing]
      end
      data
    end
  end

  def process_file(input_file, listing) do
    line = IO.read(input_file, :line)
    if (line != :eof) do
      process_file(input_file, [process_line(line) | listing])
    else
      listing
    end
  end

  def process_line(line) do
    String.strip(line)
  end  

end
