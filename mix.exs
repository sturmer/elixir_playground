defmodule ElixirPlayground.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_playground,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
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
      {:postgrex, "~> 0.16.1"}
    ]
  end
end
