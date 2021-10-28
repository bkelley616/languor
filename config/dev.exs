import Config

config :esbuild,
  version: "0.12.18",
  esbuild_languor_co: [
    args: ~w(js/app.js --bundle --target=es2016 --minify --outdir=../priv/static/assets),
    cd: Path.expand("../apps/languor_co/assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :master_proxy,
  http: [port: 80],
  backends: [
    %{
      host: ~r/languor.localhost/,
      phoenix_endpoint: LanguorCoWeb.Endpoint
    }
  ]

config :languor_co, LanguorCoWeb.Endpoint,
  http: [port: 1111],
  server: true,
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    # Start the esbuild watcher by calling Esbuild.install_and_run(:default, args)
    esbuild: {Esbuild, :install_and_run, [:esbuild_languor_co, ~w(--sourcemap=inline --watch)]}
  ]

# Watch static and templates for browser reloading.
config :languor_co, LanguorCoWeb.Endpoint,
  reloadable_compilers: [:gettext, :phoenix, :elixir, :surface],
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/languor_co_web/(live|views)/.*(ex)$",
      ~r"lib/languor_co_web/templates/.*(eex)$",
      ~r"lib/languor_co_web/live/.*(sface)$",
      ~r"lib/languor_co_web/(live|components)/.*(ex|js)$"
    ]
  ]

# Do not include metadata nor timestamps in development logs
# :debug for more info
config :logger, :console, format: "[$level] $message\n", level: :info

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime
