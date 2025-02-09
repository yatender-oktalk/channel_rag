# Use the official Elixir image as the base image
FROM elixir:latest

# Install build dependencies
RUN apt-get update && \
    apt-get install -y build-essential git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Hex + Rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Set the working directory
WORKDIR /workspace

# Set environment variables
ENV EXLA_FORCE_REBUILD=true

# Copy the project files into the container
COPY . .