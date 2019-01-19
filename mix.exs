defmodule Greenbox.MixProject do
  use Mix.Project

  def project do
    [
      app: :greenbox,
      version: "0.1.0",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.4"},
      {:poison, "~> 3.1"}
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]

  # Comment this if you want to use the real client
  defp elixirc_paths(_), do: ["lib", "test/support"]
  # defp elixirc_paths(_), do: ["lib"]
end
