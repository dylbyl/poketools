defmodule PokeTools.MakeUpAMon.PokemonType do
  @valid_types ~w[
    normal
    fire
    water
    grass
    electric
    ice
    fighting
    poison
    ground
    flying
    psychic
    bug
    rock
    ghost
    dark
    dragon
    steel
    fairy
  ]a

  def valid_types, do: @valid_types
end
