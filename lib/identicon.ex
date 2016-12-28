defmodule Identicon do
  def main(input) do
    input
    |> hash
    |> pick_color
    |> build_grid
    |> filter_odd_squares
  end

  def hash(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

  def pick_color(image) do
    [r, g, b | _tail] = image.hex

    %Identicon.Image{image | color: {r, g, b}}
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    grid =
      hex
      |> Enum.chunk(3)
      |> Enum.map(&mirrow_row/1)
      |> List.flatten
      |> Enum.with_index

    %Identicon.Image{image | grid: grid}
  end

  def mirrow_row(row) do
    # [145, 46, 200]
    [first, second | _tail] = row

    # [145, 46, 200, 46, 145]
    row ++ [second, first]
  end

  def filter_odd_squares(%Identicon.Image{grid: grid} = image) do
    filtered_grid = grid
    |> Enum.filter(fn {value, _index} -> (rem(value, 2)) == 0 end)

    %Identicon.Image{image | grid: filtered_grid}
  end
end
