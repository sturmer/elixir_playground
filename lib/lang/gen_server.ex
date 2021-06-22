defmodule GenServerExample do
  use GenServer

  @initial_state %{name: __MODULE__, message: "sõnum"}

  # Client API
  def start_link(_opts) do
    GenServer.start_link(__MODULE__, @initial_state, name: __MODULE__)
  end

  @impl true
  def init(_init_arg) do
    {:ok, @initial_state}
  end

  def state() do
    GenServer.call(__MODULE__, {:get})
  end

  def update_state(data \\ %{}) do
    GenServer.call(__MODULE__, {:test_call, data})
  end

  # Server API

  @doc "Update the state and return it"
  @impl true
  def handle_call({:test_call, update}, {pid, _tag} = _from, state) do
    updated_state = Map.merge(state, update)
    {:reply, %{in_answer_to: pid, state: updated_state}, updated_state}
  end

  @doc "Get current state"
  def handle_call({:get}, {pid, _tag} = _from, state) do
    {:reply, %{in_answer_to: pid, state: state}, state}
  end
end
