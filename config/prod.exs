use Mix.Config

config :band_together_app, BandTogetherAppWeb.Endpoint,
  http: [port: {:system, "PORT"}],
  load_from_system_env: true,
  secret_key_base: "${SECRET_KEY_BASE}",
  url: [host: "${APP_NAME}.gigalixirapp.com", port: 443],
  server: true,
  root: ".",
  cache_static_manifest: "priv/static/cache_manifest.json",
  version: Application.spec(:band_together_app, :vsn)

config :band_together_app, BandTogetherApp.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: "${DATABASE_URL}",
  database: "",
  ssl: true,
  pool_size: 2

# Do not print debug messages in production
config :logger, level: :debug
