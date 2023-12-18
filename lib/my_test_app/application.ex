defmodule MyTestApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MyTestAppWeb.Telemetry,
      # Start the Ecto repository
      MyTestApp.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: MyTestApp.PubSub},
      # Start Finch
      {Finch, name: MyTestApp.Finch},
      # Start the Endpoint (http/https)
      MyTestAppWeb.Endpoint
      # Start a worker by calling: MyTestApp.Worker.start_link(arg)
      # {MyTestApp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MyTestApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MyTestAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
