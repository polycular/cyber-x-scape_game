import Config

config :phx_game, PhxGameWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "dVhJSCKfPyB0sHj1yIzAykan1AVVxj31QDWL9MLkED9EHIrK2vohJgbLwF1DVsrq",
  server: false

config :logger, level: :warn

config :phoenix, :plug_init_mode, :runtime
