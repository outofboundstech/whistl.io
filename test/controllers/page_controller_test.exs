defmodule Whistlio.PageControllerTest do
  use Whistlio.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Whistl.io!"
  end
end
