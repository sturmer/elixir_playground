defmodule Playground do
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      Playground.Repo
    ]

    opts = [strategy: :one_for_one, name: Playground.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
