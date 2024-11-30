defmodule MusicCentral.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MusicCentralWeb.Telemetry,
      MusicCentral.Repo,
      {DNSCluster, query: Application.get_env(:music_central, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: MusicCentral.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: MusicCentral.Finch},
      # Start a worker by calling: MusicCentral.Worker.start_link(arg)
      # {MusicCentral.Worker, arg},
      # Start to serve requests, typically the last entry
      MusicCentralWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MusicCentral.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MusicCentralWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
