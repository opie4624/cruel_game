# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :front_desk,
  ecto_repos: [FrontDesk.Repo]

# Configures the endpoint
config :front_desk, FrontDesk.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "52H9n2nNJEoZxz3XUvhIXvubltwpaZP7+dtfGBMLXwVSxvxPS42Lpye1K9J+60/U",
  render_errors: [view: FrontDesk.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FrontDesk.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
