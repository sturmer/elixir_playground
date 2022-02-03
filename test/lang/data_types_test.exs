defmodule DataTypesTest do
  use ExUnit.Case

  test "booleans are also atoms" do
    assert is_atom(true)
    assert is_atom(false)
    assert is_boolean(:true)
  end

  test "operators `&&`, `||`, and `!` can be used with any type" do
    assert (1 && false) === false
    assert (1 || false) === 1
    assert !1 === false
  end

  test "operator `and` needs the first arg to be a boolean or will throw" do
    assert_raise BadBooleanError, fn ->
      1 and false
    end
  end

  test "operator `or` needs the first arg to be a boolean or will throw" do
    assert_raise BadBooleanError, fn ->
      1 or true
    end
  end

  test "operator `not` needs the first arg to be a boolean or will throw" do
    assert_raise ArgumentError, fn ->
      not 1
    end
  end
end
