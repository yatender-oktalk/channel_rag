# Use the official Elixir image as the base image
FROM elixir:latest

# Install Hex + Rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Set the working directory
WORKDIR /app

# Copy mix.exs and mix.lock files
COPY mix.exs mix.lock ./
ENV EXLA_FORCE_REBUILD=true
ENV MIX_ENV=prod
# Install Elixir dependencies
RUN mix deps.get

# Copy the rest of the application code
COPY . .

# Compile the application
RUN mix compile

# Expose the Phoenix server port
EXPOSE 4000

# The CMD will be overridden by docker-compose
CMD ["iex", "-S", "mix"]
