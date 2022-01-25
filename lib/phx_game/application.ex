defmodule PhxGame.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhxGameWeb.Telemetry,
      {Phoenix.PubSub, name: PhxGame.PubSub},
      PhxGameWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: PhxGame.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    PhxGameWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
