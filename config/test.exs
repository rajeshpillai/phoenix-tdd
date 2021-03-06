import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :chatter, Chatter.Repo,
  username: "postgres",
  password: "root123",
  database: "chatter_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :chatter, ChatterWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "sQvIhmhQRVfRcFqgRHAFdeRUVE89otNDW2IkF0OMlHoMFcwf019BxkZM4qy0kOjb",
  server: true  # rp: so that server is run during test

# In test we don't send emails.
config :chatter, Chatter.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Use Ecto's sandbox in test
config :chatter, :sql_sandbox, true

config :wallaby,
  driver: Wallaby.Chrome
