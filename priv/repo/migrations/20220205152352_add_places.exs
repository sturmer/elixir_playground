defmodule ElixirPlayground.Repo.Migrations.AddPlaces do
  use Ecto.Migration

  # Generated using `mix ecto.gen.migration AddPlaces`.
  # Applied with `ecto.migrate`.
  def change do
    create table(:places) do
      add :name, :string
      add :description, :string
      add :visited, :boolean, default: false

      timestamps()
    end
  end
end
