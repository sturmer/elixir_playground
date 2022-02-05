defmodule ElixirPlayground.Repo do
  @moduledoc """
  This module is used to query the DB. See also config.exs (where we tell the application about our
  repo) and application.ex (where we use it as a supervisor in the supervision tree).
  """

  use Ecto.Repo,
    otp_app: :elixir_playground,
    adapter: Ecto.Adapters.Postgres
end
