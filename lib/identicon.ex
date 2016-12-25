defmodule Identicon do
  def main(input) do
    input
    |> hash
  end

  def hash(input) do
    :crypto.hash(:md5, input)
    |> :binary.bin_to_list
  end
end
