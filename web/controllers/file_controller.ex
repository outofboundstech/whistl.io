defmodule Whistlio.FileController do
  use Whistlio.Web, :controller

    alias Whistlio.Crypto

    @target_dir Application.get_env(:whistlio, :files)[:target_dir]
    @target_ext Application.get_env(:whistlio, :files)[:target_ext]

    def create(conn, %{"file" => f}), do: _create(conn, f)

    defp _create(conn, %Plug.Upload{content_type: "application/octet-stream", path: source}) do
      filename = Crypto.uuid() # <> @target_ext
      target = Path.join(@target_dir ++ [filename])
      case File.exists?(target) do
        true ->
          conn
          |> resp(500, "Internal Server Error")
          |> halt()

        false ->
          # Copy temporary file to target folder
          File.cp!(source, target)
          # Determine path to report to client (may not work in production)
          path = Path.join(List.last(@target_dir), filename)
          json conn, %{status: :ok, filename: filename, location: path}
      end
    end

    defp _create(conn, _f) do
      conn
      |> resp(400, "Illegal Content Type")
      |> halt()
    end
end
