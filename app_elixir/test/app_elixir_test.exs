defmodule AppElixirTest do
  use ExUnit.Case
  doctest AppElixir

  test "greets the world" do
    assert AppElixir.hello() == :world
  end
end
