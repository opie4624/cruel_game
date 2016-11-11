defmodule FrontDesk.SessionController do
  use FrontDesk.Web, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => session_params}) do
    case FrontDesk.Session.login(session_params, FrontDesk.Repo) do
      {:ok, player} ->
        conn
        |> put_session(:current_player, player.id)
        |> put_flash(:info, "Logged in")
        |> redirect(to: "/")
      :error ->
        conn
        |> put_flash(:info, "Wrong email or password")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> delete_session(:current_player)
    |> put_flash(:info, "Logged out")
    |> redirect(to: "/")
  end
end
