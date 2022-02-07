defmodule ElixirPlayground.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_playground,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env()),
      aliases: aliases()
    ]
  end

  defp aliases do
    [test: ["ecto.create --quiet", "ecto.migrate", "test"]]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :ecto],
      mod: {ElixirPlayground.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:joken, "~> 2.0"},
      {:jason, "~> 1.1"},
      {:ecto, "~> 3.7"},
      {:ecto_sql, "~> 3.7"},
      {:postgrex, "~> 0.16.1"},
      {:dataloader, "~> 1.0"}
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
