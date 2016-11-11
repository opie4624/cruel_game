defmodule FrontDesk.RegistrationController do
  use FrontDesk.Web, :controller
  alias FrontDesk.Player

  def new(conn, _params) do
    changeset = Player.changeset(%Player{})
    render conn, changeset: changeset
  end

  def create(conn, %{"player" => user_params}) do
    changeset = Player.changeset(%Player{}, user_params)

    case FrontDesk.Registration.create(changeset, FrontDesk.Repo) do
      {:ok, changeset} ->
        conn
        |> put_session(:current_player, changeset.id)
        |> put_flash(:info, "Your account was created")
        |> redirect(to: "/")
      {:error, changeset} ->
        conn
        |> put_flash(:info, "Unable to create account")
        |> render("new.html", changeset: changeset)
    end
  end
end
