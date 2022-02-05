defmodule ElixirPlayground.Places do
  alias ElixirPlayground.{Repo, Place}
  import Ecto.Query

  def items do
    from(t in Place, select: {t.name, t.visited})
    |> Repo.all()
  end

  def add(name) do
    Place.changeset(%Place{}, %{name: name})
    |> Repo.insert!()
  end
end
