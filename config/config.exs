# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

# Configure Mix tasks and generators
config :eastegg,
  namespace: EastEgg,
  exchange: "eastegg"

config :eastegg_web,
  namespace: EastEggWeb,
  generators: [context_app: :eastegg]

# Configures the endpoint
config :eastegg_web, EastEggWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: EastEggWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: EastEgg.PubSub,
  live_view: [signing_salt: "BWP2D34S"]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.12.18",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../apps/eastegg_web/assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
