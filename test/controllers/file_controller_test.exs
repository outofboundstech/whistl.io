defmodule Whistlio.FileControllerTest do
  use Whistlio.ConnCase

  test "POST /files", %{conn: conn} do
    upload = %Plug.Upload{path: "test/fixtures/dummy.txt", content_type: "application/octet-stream", filename: "dummy.txt"}
    conn = post conn, "/files", %{ "file" => upload }
    assert json_response(conn, 200) == %{ "status" => "ok" }
  end
end
