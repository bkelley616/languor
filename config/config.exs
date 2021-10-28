# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
# import Config
import Config

# Configures the endpoint
config :languor_co, LanguorCoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "IkWtEU94hD6RegR29UFB3yKGoKUxZ3v1RyvZWs7RUtbmJkgiqcNNw/cTXlvPoueC",
  render_errors: [view: LanguorCoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LanguorCo.PubSub,
  live_view: [signing_salt: "mtgqcmUF"]

config :surface, :components, [
  {Surface.Components.Form.ErrorTag,
   default_translator: {LanguorCoWeb.ErrorHelpers, :translate_error}}
]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :esbuild,
  version: "0.12.18",
  esbuild_languor_co: [
    args: ~w(js/app.js --bundle --minify --target=es2016 --outdir=../priv/static/assets),
    cd: Path.expand("../apps/languor_co/assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
