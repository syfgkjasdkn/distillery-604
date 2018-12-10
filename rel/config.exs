use Mix.Releases.Config,
  default_release: :remumb,
  default_environment: Mix.env()

environment :dev do
  # If you are running Phoenix, you should make sure that
  # server: true is set and the code reloader is disabled,
  # even in dev mode.

  # It is recommended that you build with MIX_ENV=prod and pass
  # the --env flag to Distillery explicitly if you want to use
  # dev mode.

  set(dev_mode: true)
  set(include_erts: false)
  set(cookie: :"FOhzo0d,x5:<Hf72J`!gMQxL%~T=*X!(8)QZrI5lSrP3VRzU]j%}XQMtAkZMmkH*")
end

environment :prod do
  set(include_erts: true)
  set(include_src: false)
  set(cookie: :"Y!w/6O!nj=.IlcEvL`Gjd^&456,fl19FpVpBzc;M7tZ`y8?l9Tul<MuprLqgtg~T")

  set(
    overlays: [
      {:copy, "rel/etc/config.exs", "etc/config.exs"},
      {:copy, "bin/remsh", "bin/remsh"}
    ]
  )

  set(
    config_providers: [
      {Mix.Releases.Config.Providers.Elixir, ["${RELEASE_ROOT_DIR}/etc/config.exs"]}
    ]
  )
end

release :remumb do
  set(version: "0.1.0")

  set(
    applications: [
      :runtime_tools,
      app1: :permanent,
      app2: :permanent
    ]
  )
end
