defmodule PokeTools.MakeUpAMon.RandomMonParams do
  use Ecto.Schema

  embedded_schema do
    field :second_type_chance, :integer
    field :base_design_count, :integer
    field :descriptor_count, :integer
    field :extra_concept_count, :integer
    field :found_in_count, :integer
    field :is_legendary_chance, :integer
    field :evolution_stage_count, :integer
    field :has_mega_evolution_chance, :integer
    field :has_gigantamax_chance, :integer
    field :has_alternate_form_chance, :integer
  end
end
