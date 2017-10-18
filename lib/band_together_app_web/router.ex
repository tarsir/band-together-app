defmodule BandTogetherAppWeb.Router do
  use BandTogetherAppWeb, :router

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

  scope "/", BandTogetherAppWeb do
    pipe_through :api # Use the default browser stack

    resources "/users", UserController, except: [:new, :edit]
    resources "/talents", TalentController, except: [:new, :edit]
    resources "/portfolios", PortfolioController, except: [:new, :edit]
    get "/health_check", MonitoringController, :health_check
  end

  # Other scopes may use custom stacks.
  # scope "/api", BandTogetherAppWeb do
  #   pipe_through :api
  # end
end
