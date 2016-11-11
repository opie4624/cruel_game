defmodule FrontDesk.Session do
  alias FrontDesk.Player

  def login(params, repo) do
    player = repo.get_by(Player, email: String.downcase(params["email"]))
    case authenticate(player, params["password"]) do
      true -> {:ok, player}
      _    -> :error
    end
  end

  defp authenticate(player, password) do
    case player do
      nil -> false
      _   -> Comeonin.Bcrypt.checkpw(password, player.crypted_password)
    end
  end
end
