use Mix.Config

config :band_together_app, BandTogetherAppWeb.Endpoint,
  load_from_system_env: true,
  http: [port: {:system, "PORT"}],
  server: true,
  secret_key_base: "${SECRET_KEY_BASE}",
  url: [scheme: "https", host: "${APP_NAME}.gigalixirapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  cache_static_manifest: "priv/static/cache_manifest.json"

config :band_together_app, BandTogetherApp.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: "${DATABASE_URL}",
  database: "",
  ssl: true,
  pool_size: 2

# Do not print debug messages in production
config :logger, level: :debug
