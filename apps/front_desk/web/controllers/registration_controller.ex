defmodule FrontDesk.RegistrationController do
  use FrontDesk.Web, :controller
  alias FrontDesk.Player

  def new(conn, _params) do
    changeset = Player.changeset(%Player{})
    render conn, changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = Player.changeset(%User{}, user_params)

    case FrontDesk.Registration.create(changeset, FrontDesk.Repo) do
      {:ok, changeset} ->
        # sign in the user
      {:error, changeset} ->
        # show error message
    end
end
