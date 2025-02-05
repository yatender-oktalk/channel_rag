# Use the official Elixir image as the base image
FROM elixir:latest

# Install build dependencies
RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get clean

# Install Hex + Rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Set the working directory
WORKDIR /workspace

# Set environment variables
ENV EXLA_FORCE_REBUILD=true

# The rest will be handled by devcontainer.json