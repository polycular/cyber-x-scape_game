defmodule PhxGameWeb.Router do
  use PhxGameWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {PhxGameWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhxGameWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/datenschutz", PageController, :privacy
    get "/impressum", PageController, :imprint

    live_session :game, root_layout: {PhxGameWeb.LayoutView, :game} do
      live "/game", Game
      live "/cards", Card
    end
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: PhxGameWeb.Telemetry
    end
  end
end
