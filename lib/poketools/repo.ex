defmodule PokeTools.Repo do
  use Ecto.Repo,
    otp_app: :poketools,
    adapter: Ecto.Adapters.Postgres
end
