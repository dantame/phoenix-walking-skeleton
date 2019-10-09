use Mix.Config

# Configure your database
config :walking_skeleton, WalkingSkeleton.Repo,
  username: "postgres",
  password: "postgres",
  database: "walking_skeleton_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :walking_skeleton, WalkingSkeletonWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :walking_skeleton, WalkingSkeletonWeb.PowMailer, adapter: Bamboo.TestAdapter
