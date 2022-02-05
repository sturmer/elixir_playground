defmodule ElixirPlayground.Place do
  use Ecto.Schema
  import Ecto.Changeset

  schema "places" do
    field(:name, :string)
    field(:description, :string)
    field(:visited, :boolean, default: false)

    timestamps()
  end

  def changeset(record, params \\ :empty) do
    record
    |> cast(params, [:name, :description, :visited])
  end
end
