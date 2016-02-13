defmodule Whistlio.FileController do
  use Whistlio.Web, :controller

    @target_dir Application.get_env(:whistlio, :target_dir)
    @target_ext Application.get_env(:whistlio, :target_ext)

    def create(conn, %{"file" => f}) do
      target = @target_dir <> f.filename <> @target_ext
      f.path
      |> File.rename(target)
      json conn, %{status: :ok}
    end
end
