defmodule Railsbot do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    IO.puts "Starting app"
    {:ok, client} = ExIrc.start_client!

    children = [
      # Define workers and child supervisors to be supervised
      worker(Railsbot.ConnectionHandler, [client]),
      worker(Railsbot.LoginHandler, [client, ["#logga"]]),
      worker(Railsbot.Handler, [client])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: OhaiIrc.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
