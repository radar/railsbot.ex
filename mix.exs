defmodule Railsbot.Mixfile do
  use Mix.Project

  def project do
    [app: :railsbot,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [mod: {Railsbot, []},
      applications: [:logger, :exirc]]
  end

  defp deps do
    [{:exirc, "~> 0.10.0"}]
  end
end
