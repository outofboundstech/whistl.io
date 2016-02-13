defmodule Whistlio.FileControllerTest do
  use Whistlio.ConnCase

  test "POST /file", %{conn: conn} do
    conn = post conn, "/file"
    assert json_response(conn, 200) == %{status: :ok}
  end
end
