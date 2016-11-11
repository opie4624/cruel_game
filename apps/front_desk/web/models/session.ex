defmodule FrontDesk.Session do
  alias FrontDesk.Player

  def login(params, repo) do
    player = repo.get_by(Player, email: String.downcase(params["email"]))
    case authenticate(player, params["password"]) do
      true -> {:ok, player}
      _    -> :error
    end
  end

  def current_player(conn) do
    id = Plug.Conn.get_session(conn, :current_player)
    if id, do: Blog.Repo.get(Player, id)
  end

  def logged_in?(conn), do: !!current_player(conn)

  defp authenticate(player, password) do
    case player do
      nil -> false
      _   -> Comeonin.Bcrypt.checkpw(password, player.crypted_password)
    end
  end
end
