defmodule Whistlio.PageController do
  use Whistlio.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def receive(conn, params) do
    IO.inspect(params)
    json conn, %{status: :ok}
  end

  def upload(conn, _params) do
    render conn, "upload.html"
  end
end
