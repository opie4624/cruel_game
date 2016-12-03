defmodule FrontDesk.PageControllerTest do
  use FrontDesk.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Cruel 2 B Kind"
  end
end
