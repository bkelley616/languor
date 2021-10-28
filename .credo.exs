%{
  configs: [
    %{
      name: "default",
      files: %{
        included: ["./apps/", "./config/", "mix.exs"],
        excluded: ["./apps/**/assets/**","./apps/**/priv/**"]
      },
      # checks etc.
    }
  ]
}
