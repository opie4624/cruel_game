defmodule FrontDesk.PlayerTest do
  use FrontDesk.ModelCase

  alias FrontDesk.Player

  @valid_attrs %{password: "password", email: "user@example.com", handle: "handle", phone: "12345678910"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Player.changeset(%Player{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Player.changeset(%Player{}, @invalid_attrs)
    refute changeset.valid?
  end
end
