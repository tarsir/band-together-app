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

  pipeline :auth do
    plug BandTogetherAppWeb.AuthPlug
  end

  scope "/api", BandTogetherAppWeb do
    pipe_through :api # Use the default browser stack

    resources "/sessions", SessionController, only: [:create]
    get "/current_user", SessionController, :current_user
    get "/health_check", MonitoringController, :health_check
  end

  scope "/api", BandTogetherAppWeb do
    pipe_through [:auth, :api]

    resources "/sessions", SessionController, only: [:delete]
    resources "/users", UserController, except: [:new, :edit]
    resources "/bands", BandController, except: [:new, :edit]
    resources "/talents", TalentController, except: [:new, :edit]
    resources "/portfolios", PortfolioController, except: [:new, :edit]
  end

  scope "/", BandTogetherAppWeb do
    pipe_through [:browser]

    get "/", PageController, :index
    get "/signin", SessionController, :new
    get "/register", UserController, :new
  end


  # Other scopes may use custom stacks.
  # scope "/api", BandTogetherAppWeb do
  #   pipe_through :api
  # end
end
