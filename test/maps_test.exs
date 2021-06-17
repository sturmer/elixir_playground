defmodule MapsTest do
  use ExUnit.Case

  test "access can be done via Map.get/2 or using Access" do
    # Favor access via [] to swap data structure in the future, see
    # https://keathley.io/blog/good-and-bad-elixir.html
    my_map = %{a: 1, b: 2}
    assert my_map[:a] == Map.get(my_map, :a)

    my_keywords = [a: 1, b: 3]
    assert my_keywords[:a] == Keyword.get(my_keywords, :a)
  end
end
