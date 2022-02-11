defmodule ElixirPlayground.SQLTest do
  use ElixirPlayground.RepoCase

  test "width_bucket" do
    {:ok, result} =
      Ecto.Adapters.SQL.query(
        ElixirPlayground.Repo,
        get_query("now() + interval '1 day'")
      )

    # result: {:ok,
    #  %Postgrex.Result{
    #    columns: ["width_bucket"],
    #    command: :select,
    #    connection_id: 343,
    #    messages: [],
    #    num_rows: 1,
    #    rows: [[3]]
    #  }}
    res = Map.get(result, :rows) |> List.first() |> List.first()

    {:ok, result} =
      Ecto.Adapters.SQL.query(
        ElixirPlayground.Repo,
        get_query("now() - interval '1 day'")
      )

    # The index in the array is 1-based!
    res = Map.get(result, :rows) |> List.first() |> List.first()
    assert res == 1
  end

  defp get_query(my_date) do
    """
    SELECT width_bucket(
      #{my_date},
      array['yesterday', 'today', 'tomorrow']::timestamptz[]
      )
    """
  end
end
