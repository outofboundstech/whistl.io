defmodule Whistlio.FileController do
  use Whistlio.Web, :controller

    @target_dir Application.get_env(:whistlio, :target_dir)
    @target_ext Application.get_env(:whistlio, :target_ext)

    def create(conn, %{"file" => f}) do
      case f.content_type do
        "application/octet-stream" ->
          target = @target_dir <> f.filename <> @target_ext
          f.path
          |> File.cp!(target)
          json conn, %{status: :ok}

        # The client must report content_type application/octet-stream
        _ ->
          conn
          |> resp(400, "Illegal content type")
          |> halt()
      end
    end
end
