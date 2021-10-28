defmodule LanguorCoWeb.Router do
  use LanguorCoWeb, :router
  import Phoenix.LiveDashboard.Router
  alias Plugs.Redirect

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {LanguorCoWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end



  scope "/" do
    pipe_through [:browser, :admins_only]
    live_dashboard "/admin", metrics: LanguorCoWeb.Telemetry
  end

  scope "/", LanguorCoWeb do
    pipe_through :browser
    live "/", HomeLive, :index
    get "/*path", Redirect, to: "/"
  end


  pipeline :admins_only do
    plug :admin_basic_auth
  end

  defp admin_basic_auth(conn, _opts) do
    username = System.fetch_env!("AUTH_USERNAME")
    password = System.fetch_env!("AUTH_PASSWORD")
    Plug.BasicAuth.basic_auth(conn, username: username, password: password)
  end

  # Other scopes may use custom stacks.
  # scope "/api", LanguorCoWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).

end
