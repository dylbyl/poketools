defmodule PokeTools.MakeUpAMon.RandomMon do
  use Ecto.Schema
  alias PokeTools.MakeUpAMon.PokemonStats
  alias PokeTools.MakeUpAMon.PokemonType
  alias PokeTools.MakeUpAMon.RandomElements.BaseDesigns
  alias PokeTools.MakeUpAMon.RandomElements.Descriptors
  alias PokeTools.MakeUpAMon.RandomElements.ExtraConcepts
  alias PokeTools.MakeUpAMon.RandomElements.FoundIn
  alias PokeTools.MakeUpAMon.RandomElements.StatDescriptions
  alias PokeTools.MakeUpAMon.RandomMonParams

  @type random_mon :: %__MODULE__{} | nil
  @type random_mon_params :: %RandomMonParams{} | nil

  embedded_schema do
    field :type1, Ecto.Enum, values: PokemonType.valid_types()
    field :type2, Ecto.Enum, values: PokemonType.valid_types()
    field :base_designs, {:array, :string}, default: []
    field :descriptors, {:array, :string}, default: []
    field :extra_concepts, {:array, :string}, default: []
    field :found_in, {:array, :string}, default: []
    field :is_legendary, :boolean
    field :evolution_stages, :integer
    field :has_mega_evolution, :boolean
    field :has_gigantamax, :boolean
    field :has_alternate_form, :boolean
    field :stat_descriptions, {:array, :string}, default: []
    field :seed, :string
    field :created_at, :utc_datetime
  end

  @doc """
  Generates a `RandomMon`. The randomness is seeded using the current UNIX time,
  with a random integer between 1 and 1000 tacked on the end. This seed will be returned in the RandomMon struct.
  """
  @spec generate(params :: random_mon_params()) :: %__MODULE__{}
  def generate(params \\ %RandomMonParams{}) do
    unix_seconds = System.os_time(:second)
    random_addition = Enum.random(1..1000)
    {seed, _} = Integer.parse("#{unix_seconds}#{random_addition}")
    generate_with_seed_and_params(seed, params)
  end

  @doc """
  Generates a `RandomMon` using the current date and time in basic ISO-8601 format.
  This lets us create a "Daily Mon" by ensuring that every `RandomMon` generated in a 24 hour period is the same.
  """
  @spec generate_daily(params :: random_mon_params()) :: %__MODULE__{}
  def generate_daily(params \\ %RandomMonParams{base_design_count: 1, found_in_count: 1}) do
    {seed, _} =
      DateTime.utc_now()
      |> DateTime.to_iso8601(:basic)
      |> Integer.parse()

    generate_with_seed_and_params(seed, params)
  end

  @doc """
  Generates a `RandomMon` using any integer as a seed.
  This function can be called directly, although `generate/0` and `generate_daily/0` exist for ease of use.
  """
  @spec generate_with_seed_and_params(seed :: integer(), params :: random_mon_params()) ::
          %__MODULE__{}
  def generate_with_seed_and_params(seed, params) do
    :rand.seed(:exsss, seed)
    {type1, type2} = generate_types(params)

    %__MODULE__{
      type1: type1,
      type2: type2,
      base_designs: Enum.take_random(BaseDesigns.all(), params.base_design_count || 3),
      descriptors: Enum.take_random(Descriptors.all(), params.descriptor_count || 3),
      extra_concepts: Enum.take_random(ExtraConcepts.all(), params.extra_concept_count || 3),
      found_in: Enum.take_random(FoundIn.environments(), params.found_in_count || 3),
      is_legendary: generate_boolean(params.is_legendary_chance || 10),
      evolution_stages: Enum.take_random(1..3, 1),
      has_mega_evolution: generate_boolean(params.has_mega_evolution_chance || 25),
      has_alternate_form: generate_boolean(params.has_alternate_form_chance || 25),
      stat_descriptions: generate_stats(),
      seed: seed,
      created_at: DateTime.utc_now(),
      has_gigantamax: generate_boolean(params.has_gigantamax_chance || 15)
    }
  end

  # Generates 1-2 random types
  defp generate_types(params) do
    has_second_type? = generate_boolean(params.second_type_chance || 60)
    [type1 | rest] = Enum.take_random(PokemonType.valid_types(), 2)
    [type2 | _tail] = rest
    type2 = if has_second_type?, do: type2, else: nil
    {type1, type2}
  end

  # Generates a full stat spread with quirky descriptions for each
  defp generate_stats do
    all_stats_with_index =
      PokemonStats.valid_stats()
      |> Enum.with_index()

    stat_descriptions = Enum.take_random(StatDescriptions.all(), length(all_stats_with_index))

    Enum.map(all_stats_with_index, fn {stat, index} ->
      description_string = stat_descriptions |> Enum.at(index) |> String.downcase()
      "#{stat} that is #{description_string}"
    end)
  end

  # Generates a boolean with a specific chance to be true. The desired chance can be passed in as an integer, but defaults to 50.
  defp generate_boolean(chance \\ 50), do: Enum.random(1..100) <= chance
end
