defmodule LanguorCoWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :languor_co

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  @session_options [
    store: :cookie,
    key: "_languor_co_key",
    signing_salt: "aWu4hx8R"
  ]

  socket "/socket", LanguorCoWeb.UserSocket,
    websocket: true,
    longpoll: false

  socket "/live", Phoenix.LiveView.Socket, websocket: [connect_info: [session: @session_options]]

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.

  if Mix.env() in [:dev, :test] do
    plug Plug.Static,
      at: "/",
      from: :languor_co,
      gzip: false,
      only: ~w(assets fonts images favicon.ico apple-touch-icon.png android-chrome-192x192.png android-chrome-512x512.png favicon-16x16.png favicon-32x32.png mstile-150x150.png safari-pinned-tab.svg manifest.json browserconfig.xml robots.txt)
  end

  if Mix.env() == :prod do
    plug Plug.Static,
      at: "/",
      from: :languor_co,
      gzip: true,
      only: ~w(assets fonts images favicon.ico apple-touch-icon.png android-chrome-192x192.png android-chrome-512x512.png favicon-16x16.png favicon-32x32.png mstile-150x150.png safari-pinned-tab.svg manifest.json browserconfig.xml robots.txt),
      cache_control_for_etags: "must-revalidate, public, max-age=15552000",
      headers: %{"cache-control" => "must-revalidate, public, max-age=15552000"}
  end

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Phoenix.LiveDashboard.RequestLogger,
    param_key: "request_logger",
    cookie_key: "request_logger"

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug LanguorCoWeb.Router
end
