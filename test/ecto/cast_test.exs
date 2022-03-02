defmodule EctoTest do
  use ExUnit.Case
  use ElixirPlayground.RepoCase

  setup do
    data = %{name: "Gian", birthplace: "Napoli"}
    types = %{name: :string, birthplace: :string}
    params = %{name: "My Changed Name", age: 40}
    permitted = [:name]

    # `cast` applies the changes in the second arg (`params`) to the first arg.
    # The first arg can be a few different types, among which a Changeset and a
    # tuple {data, types}, like in this case.
    res =
      {data, types}
      |> Ecto.Changeset.cast(params, permitted)

    # res: #Ecto.Changeset<
    #   action: nil,
    #   changes: %{name: "My Changed Name"},
    #   errors: [],
    #   data: %{birthplace: "Napoli", name: "Gian"},
    #   valid?: true
    # >

    {:ok, %{res: res, params: params}}
  end

  test "cast summarizes changes in return value", %{res: res, params: params} = _context do
    changes = Map.get(res, :changes)

    assert changes == Map.take(params, [:name])
    # assert Enum.empty?(res.errors)
    # assert res.valid?
  end

  test "cast has an errors list", %{res: res} = _context do
    assert Enum.empty?(res.errors)
  end
end
