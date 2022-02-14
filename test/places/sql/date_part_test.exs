defmodule ElixirPlayground.DatePartTest do
  use ElixirPlayground.RepoCase

  test "date_part" do
    {:ok, result} =
      Ecto.Adapters.SQL.query(
        ElixirPlayground.Repo,
        "SELECT date_part('minute', interval '3 hours 6 minutes')"
      )

    res = Map.get(result, :rows) |> List.first() |> List.first()
    assert res == 6
  end
end
