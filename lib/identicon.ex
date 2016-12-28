defmodule Identicon do
  def main(input) do
    input
    |> hash
    |> pick_color
  end

  def hash(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

  def pick_color(image) do
    [r, g, b | _tail] = image.hex

    [r, g, b]
  end
end
