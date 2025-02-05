defmodule ChannelRag.MixProject do
  use Mix.Project

  def project do
    [
      app: :channel_rag,
      version: "0.1.0",
      elixir: "~> 1.15",
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
      # Updated nx version to be compatible with exla
      {:nx, "~> 0.7.0"},
      {:bumblebee, "~> 0.5.0"},
      {:pgvector, "~> 0.3.0"},
      {:tokenizers, "~> 0.5.0"},
      {:exla, "~> 0.7.0"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
