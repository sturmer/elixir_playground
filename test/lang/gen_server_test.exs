defmodule GenServerExampleTest do
  use ExUnit.Case

  setup do
    gen_server = start_supervised!(GenServerExample)
    %{gen_server: gen_server}
  end

  test "responds to call messages" do
    # Calling update_state works only because there's a process named 'GenServerExample' (because
    # we used the `name:` option in start_link).
    %{in_answer_to: dest, state: updated_state} =
      GenServerExample.update_state(%{q: "...and justice for all"})

    assert updated_state[:name] == GenServerExample
    assert updated_state[:message] == "sõnum"
    assert updated_state[:q] == "...and justice for all"

    assert dest == self()

    %{in_answer_to: _, state: state} = GenServerExample.state()
    assert state == updated_state
  end

  # test "responds to info messages", %{gen_server: gen_server} do
  #   # This triggers handle_info. Note: gen_server is a PID.
  #   Process.send(gen_server, :test, [])

  #   receive do
  #     {:noreply, state} -> assert state[:name] == GenServerExample
  #   end
  # end
end
