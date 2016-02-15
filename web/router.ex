defmodule Whistlio.Router do
  use Whistlio.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :fileupload do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Whistlio do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/files", Whistlio do
    pipe_through :fileupload

    post "/", FileController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", Whistlio do
  #   pipe_through :api
  # end
end
