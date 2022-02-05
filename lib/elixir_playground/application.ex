defmodule ElixirPlayground.Application do
  use Application

  def start(_type, _args) do
    children = [
      ElixirPlayground.Repo
    ]

    opts = [strategy: :one_for_one, name: ElixirPlayground.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
