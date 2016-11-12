defmodule FrontDesk.GameTest do
  use FrontDesk.ModelCase

  alias FrontDesk.Game

  @valid_attrs %{end: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, location: "some content", start: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Game.changeset(%Game{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Game.changeset(%Game{}, @invalid_attrs)
    refute changeset.valid?
  end
end
