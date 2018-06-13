defmodule AppElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do

    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: AppElixir.Worker.start_link(arg)
      {AppElixir.Router, []},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AppElixir.Supervisor]
    Supervisor.start_link(children, opts)

    Plug.Adapters.Cowboy2.http(AppElixir.Router, [], [port: String.to_integer(System.get_env("PORT") || "4000")])

  end
end
