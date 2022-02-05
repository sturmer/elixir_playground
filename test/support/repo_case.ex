defmodule ElixirPlayground.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias ElixirPlayground.Repo

      import Ecto
      import Ecto.Query
      import ElixirPlayground.RepoCase

      # and any other stuff
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(ElixirPlayground.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(ElixirPlayground.Repo, {:shared, self()})
    end

    :ok
  end
end
