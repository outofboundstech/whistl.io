defmodule Whistlio.PageController do
  use Whistlio.Web, :controller

  def index(conn, _params) do
    render conn, "upload.html"
  end
end
