defmodule Anka.Router do
  use Anka.Web, :router

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

  scope "/", Anka do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", Anka do
    pipe_through :api
    resources "/weather", WeatherController, except: [:new, :edit, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Anka do
  #   pipe_through :api
  # end
end
