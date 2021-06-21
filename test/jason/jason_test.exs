defmodule JasonTest do
  use ExUnit.Case

  test "can decode JSON" do
     content = Jason.decode!("{\"enabled\": true}")
     assert content["enabled"] == true

     content_with_atoms = Jason.decode!("{\"enabled\": true}", %{keys: :atoms})
     assert content_with_atoms[:enabled] == true
  end
end
