use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :hello_world, HelloWorld.Repo,
  username: "postgres",
  password: "postgres",
  database: "hello_world_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hello_world, HelloWorldWeb.Endpoint,
  http: [port: 4002],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

config :wallaby,
  driver: Wallaby.Chrome,
  otp_app: :hello_world,
  chromedriver: [
    headless: true
  ]

config :hello_world, :sandbox, Ecto.Adapters.SQL.Sandbox
