# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :band_together_app,
  ecto_repos: [BandTogetherApp.Repo]

# Configures the endpoint
config :band_together_app, BandTogetherAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/3LC+gYHEAy0ZAqQwaJFjWEu9DzvRiZVxUPhHNiZQuqdYfLD9WYfJ7n98D+tu+Te",
  render_errors: [view: BandTogetherAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BandTogetherApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
