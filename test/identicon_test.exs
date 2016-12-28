defmodule IdenticonTest do
  use ExUnit.Case
  doctest Identicon

  test "hash should return an Image with a hex property" do
    input = "testingHash"

    expected = %Identicon.Image{
      hex: [171, 77, 107, 248, 117, 196, 29, 219,
            27, 71, 64, 188, 13, 185, 97, 145]
    }

    current = Identicon.hash(input)

    assert expected == current
  end
end
