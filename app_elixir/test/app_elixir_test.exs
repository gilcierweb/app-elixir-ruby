defmodule AppElixirTest do
  use ExUnit.Case
  doctest AppElixir

  import Plug.Test

  test "greets the world" do
    assert AppElixir.hello() == :world
  end

  test "/ success" do
    conn = conn("GET", "/")
    conn = AppElixir.Router.call(conn, [])
    assert conn.status == 200
  end

  test "/gilcierweb success" do
    conn = conn("GET", "/gilcierweb")
    conn = AppElixir.Router.call(conn, [])
    assert conn.status == 200
  end

  test "/search success" do
    conn = conn("GET", "/search")
    conn = AppElixir.Router.call(conn, [])
    assert conn.status == 200
  end

#  test "/search returns valid JSON" do
#    conn = conn("GET", "/search")
#    conn = AppElixir.Router.call(conn, [])
#    data = Poison.Parser.parse!(conn.resp_body)
#    IO.puts data
#    assert data
#  end

end
