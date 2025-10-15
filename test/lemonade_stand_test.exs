defmodule LemonadeStandTest do
  use ExUnit.Case
  doctest LemonadeStand

  test "greets the world" do
    assert LemonadeStand.hello() == :world
  end
end
