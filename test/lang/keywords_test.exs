defmodule KeywordsTest do
  use ExUnit.Case

  test "keywords can be written using short-hand syntax" do
    my_keywords = [{:a, 1}, {:b, true}]
    my_keywords_short = [a: 1, b: true]

    for kw <- my_keywords do
      # kw looks like {:a, 1}
      key = elem(kw, 0)

      assert Keyword.get(my_keywords, key) == Keyword.get(my_keywords_short, key)
    end
  end

  test "when used as last arg, keywords can be written without brackets" do
    assert Keywords.count_trailing_keywords([{:a, 1}, {:b, 2}, {:c, 3}]) == 3
    assert Keywords.count_trailing_keywords(a: 1, b: 2, c: 3) == 3
  end
end
