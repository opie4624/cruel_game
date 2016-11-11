defmodule FrontDesk.SessionController do
  use FrontDesk.Web, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end
end
