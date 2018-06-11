defmodule AppElixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :app_elixir,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:cowboy, :plug, :poison, :logger],
      mod: {AppElixir.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 2.4"},
      {:plug, "~> 1.5"},
      {:httpoison, "~> 1.1"},
      {:poison, "~> 3.1"},
      {:postgrex, "~> 0.13.5"},
      {:ecto, "~> 2.2"},
      {:distillery, "~> 1.5"},
      {:earmark, "~> 1.2", only: :dev},
      {:ex_doc, "~> 0.18.3", only: :dev},
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
