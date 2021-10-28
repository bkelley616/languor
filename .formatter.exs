# Used by "mix format"
[
  surface_line_length: 120,
  inputs: ["mix.exs", "config/*.exs"],
  subdirectories: ["apps/*"],
  import_deps: [:ecto, :phoenix, :surface],
  surface_inputs: ["{lib,test}/**/*.{ex,exs,sface}"]
]
