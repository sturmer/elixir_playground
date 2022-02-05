defmodule ElixirPlayground.PlacesTest do
  alias ElixirPlayground.Places
  use ElixirPlayground.RepoCase

  test "adding and retrieving places" do
    assert [] == Places.items()

    Places.add("Vienna")
    Places.add("Siracusa")

    assert [{"Vienna", false}, {"Siracusa", false}] == Places.items()
  end
end
