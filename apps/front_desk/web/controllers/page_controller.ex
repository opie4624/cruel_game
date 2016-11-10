defmodule FrontDesk.PageController do
  use FrontDesk.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
