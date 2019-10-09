defmodule WalkingSkeletonWeb.Router do
  use WalkingSkeletonWeb, :router
  use Pow.Phoenix.Router
  use Pow.Extension.Phoenix.Router, otp_app: :walking_skeleton

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  if Mix.env() == :dev do
    # If using Phoenix
    forward "/sent_emails", Bamboo.SentEmailViewerPlug
  end

  scope "/" do
    pipe_through :browser

    pow_routes()
    pow_extension_routes()
  end

  scope "/", WalkingSkeletonWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/", WalkingSkeletonWeb do
    pipe_through [:browser, :protected]

    # Add your protected routes here
  end

  # Other scopes may use custom stacks.
  # scope "/api", WalkingSkeletonWeb do
  #   pipe_through :api
  # end
end
