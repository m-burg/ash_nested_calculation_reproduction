defmodule LemonadeStandTest do
  use ExUnit.Case
  doctest LemonadeStand

  test "should return an empty list since the database is empty" do
    assert Ash.read!(LemonadeStand.Things.Component,
             load: [suitable: [machine_id: "5ee6d342-c899-4c4f-be16-de99c9173c38"]]
           ) == []
  end
end
