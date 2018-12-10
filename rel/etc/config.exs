use Mix.Config

config :app1,
  db_path: System.get_env("DB_PATH") || raise("need DB_PATH")
