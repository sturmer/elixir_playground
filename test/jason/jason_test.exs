defmodule JasonTest do
  # NOTE(gianluca): Jason is a dependency of Joken.
  use ExUnit.Case

  test "can decode JSON" do
     content = Jason.decode!("{\"enabled\": true}")
     assert content["enabled"] == true

     content_with_atoms = Jason.decode!("{\"enabled\": true}", %{keys: :atoms})
     assert content_with_atoms[:enabled] == true
  end

  test "raises ArgumentError when called with nil" do
    # NOTE(gianluca): The documentation of the decode function states that it
    # either returns {:ok, term} | {:error, DecodeError.t()}.
    assert_raise ArgumentError, fn ->
      Jason.decode(nil)
    end
  end
end
