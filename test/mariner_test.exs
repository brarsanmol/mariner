defmodule MarinerTest do
  use ExUnit.Case
  doctest Mariner

  test "greets the world" do
    assert Mariner.hello() == :world
  end
end
