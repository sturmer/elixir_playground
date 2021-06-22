defmodule MapsTest do
  use ExUnit.Case

  @my_map %{a: 1, b: 2}

  test "access can be done via Map.get/2 or using Access" do
    # Favor access via [] to swap data structure in the future, see
    # https://keathley.io/blog/good-and-bad-elixir.html
    assert @my_map[:a] == Map.get(@my_map, :a)

    my_keywords = [a: 1, b: 3]
    assert my_keywords[:a] == Keyword.get(my_keywords, :a)
  end

  test "update existing keys" do
    updated_map = %{@my_map | a: 3}
    assert updated_map[:a] == 3

    assert_raise KeyError, fn ->
      %{@my_map | c: 4}
    end
  end

  test "add values" do
    new_map = Map.put(@my_map, :c, 4)
    assert new_map[:c] == 4
  end

  test "put_new only add key if key doesn't exist" do
    new_map = Map.put_new(@my_map, :c, 5)
    assert new_map[:c] == 5
    newer_map = Map.put_new(new_map, :c, 8)
    assert newer_map[:c] == 5
  end
end
