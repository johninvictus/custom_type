# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :custom_type,
  ecto_repos: [CustomType.Repo]

# Configures the endpoint
config :custom_type, CustomTypeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "RIN3XTNLLk/I4vOVdLZgaueco+q4pYV1Zd1zYmj7X6+jjFEEpW1ezl+xbk4NQhn3",
  render_errors: [view: CustomTypeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CustomType.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
