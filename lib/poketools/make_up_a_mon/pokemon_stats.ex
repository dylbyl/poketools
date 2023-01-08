defmodule PokeTools.MakeUpAMon.PokemonStats do
  use Ecto.Schema

  @valid_stats [
    "HP",
    "Attack",
    "Defense",
    "Special Attack",
    "Special Defense",
    "Speed"
  ]

  # TODO rework so that there is an individual Stat struct - each with a name, value, IV, EV, etc - maybe for full dex entries?
  embedded_schema do
    field :hp, :integer
    field :attack, :integer
    field :defense, :integer
    field :special_attack, :integer
    field :special_defense, :integer
    field :speed, :integer

    timestamps()
  end

  def valid_stats, do: @valid_stats

  def to_list(%__MODULE__{} = stats) do
    # TODO clean this up
    [
      {"HP", stats.hp},
      {"Attack", stats.attack},
      {"Defense", stats.defense},
      {"Special Attack", stats.special_attack},
      {"Special Defense", stats.special_defense},
      {"Speed", stats.speed}
    ]
  end
end
