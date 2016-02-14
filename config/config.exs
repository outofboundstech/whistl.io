# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :whistlio, Whistlio.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "Pt1azmQPmsI2NmH7P6Q7RrTD9p8nxJet3lMTYB0DhxD45ePyPbtF8aqV6M2r4qUj",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Whistlio.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

# target_dir works but I don't know why...
  config :whistlio, target_dir: "priv/uploads/"
  config :whistlio, target_ext: ".gpg"
