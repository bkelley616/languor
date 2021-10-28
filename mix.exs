defmodule Languor.MixProject do
  @moduledoc """
    languor umbrella project
  """
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      releases: [
        languor: [
          applications: [languor_co: :permanent]
        ]
      ]
    ]
  end

  # Dependencies listed here are available only for this
  # project and cannot be accessed from applications inside
  # the apps folder.
  #
  # Run "mix help deps" for examples and options.
  defp deps do
    []
  end

  defp aliases do
    [
      setup: [
        "deps.get",
        "cmd --cd ../.. npm install",
        "cmd --cd assets npm install"
      ],
      "assets.deploy": [
        "cmd --app languor_co --cd assets npm install",
        "cmd --app languor_co --cd ../.. npm install",
        "cmd --app languor_co mix esbuild esbuild_languor_co --minify",
        "cmd --app languor_co mix phx.digest"
      ]
    ]
  end
end
