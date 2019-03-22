use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :band_together_app, BandTogetherAppWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :band_together_app, BandTogetherApp.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "zenbook",
  database: "band_together_app_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
