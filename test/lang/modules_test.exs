defmodule ModulesTest do
  use ExUnit.Case

  test "access inner module" do
    assert MyModule.Inner.test_fun() == "fun"
  end
end
