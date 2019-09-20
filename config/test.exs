use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_actions, PhoenixActionsWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :phoenix_actions, PhoenixActions.Repo,
  username: "postgres",
  password: "postgres",
  database: "phoenix_actions_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
