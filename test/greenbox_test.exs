defmodule GreenboxTest do
  use ExUnit.Case
  doctest Greenbox

  test "greets the world" do
    assert Greenbox.hello() == :world
  end
end
