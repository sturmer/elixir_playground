import Config

# This tells our application about the repo, which will allow us to run commands such as
# `mix ecto.create`.
config :elixir_playground,
  ecto_repos: [Playground.Repo]

import_config "#{config_env()}.exs"
