# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :walking_skeleton,
  ecto_repos: [WalkingSkeleton.Repo]

# Configures the endpoint
config :walking_skeleton, WalkingSkeletonWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "EHG4PdrBoSpE1uKKd1JE4hRDc31URdKp9ggzf0hVNZ8tpNDw4anMGlwKPPVw3FyN",
  render_errors: [view: WalkingSkeletonWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: WalkingSkeleton.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :walking_skeleton, :pow,
  user: WalkingSkeleton.Users.User,
  repo: WalkingSkeleton.Repo,
  web_module: WalkingSkeletonWeb,
  extensions: [PowResetPassword, PowEmailConfirmation, PowPersistentSession],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks,
  mailer_backend: WalkingSkeletonWeb.PowMailer,
  web_mailer_module: WalkingSkeletonWeb

config :walking_skeleton, WalkingSkeletonWeb.PowMailer, adapter: Bamboo.LocalAdapter

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
