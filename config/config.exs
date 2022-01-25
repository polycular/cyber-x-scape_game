import Config

# https://registry.npmjs.org/esbuild/latest
esbuild_version = "0.14.13"

config :phx_game, PhxGameWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: PhxGameWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PhxGame.PubSub,
  live_view: [signing_salt: "XP7nd3T2"]

config :esbuild,
  version: esbuild_version,
  default: [
    args:
      ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets --external:/fonts/* --external:/images/* --external:/audio/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{config_env()}.exs"
