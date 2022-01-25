import Config

config :phx_game, PhxGameWeb.Endpoint,
  url: [host: "cyber-x-scape.at", port: 443],
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger, level: :info
