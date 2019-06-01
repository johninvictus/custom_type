use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :custom_type, CustomTypeWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :custom_type, CustomType.Repo,
  username: "postgres",
  password: "",
  database: "custom_type_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
