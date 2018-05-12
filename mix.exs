defmodule Csvm.MixProject do
  use Mix.Project

  def project do
    [
      app: :csvm,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      rustler_crates: rustler_crates(),
      compilers: [:rustler] ++ Mix.compilers,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Csvm.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, "~> 0.16.0"}
    ]
  end

  defp rustler_crates do
    [csvm: [
      path: "native/csvm",
      mode: (if Mix.env == :prod, do: :release, else: :debug),
    ]]
  end
end
