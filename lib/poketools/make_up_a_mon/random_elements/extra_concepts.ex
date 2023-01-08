defmodule PokeTools.MakeUpAMon.RandomElements.ExtraConcepts do
  @professions [
    "Professor",
    "Artist",
    "Knight",
    "Mage",
    "Peasant",
    "Soldier",
    "Doctor",
    "Programmer",
    "Influencer",
    "Therapist",
    "Secretary",
    "Pharmacist",
    "Cashier"
  ]

  @abstract_ideas [
    "Time",
    "Space",
    "Reality",
    "Imagination",
    "Illusion",
    "Fiction",
    "Amplitude",
    "Frequency",
    "Anatomy",
    "History",
    "Mathematics",
    "Reading",
    "Physical Activity",
    "Sloth / Laziness / Inaction",
    "Pride",
    "Lust",
    "Greed",
    "Envy",
    "Gluttony",
    "Wrath",
    "Apathy",
    "Emotion",
    "Willpower",
    "Intelligence",
    "Weather",
    "Mindfulness",
    "Nature",
    "Patience",
    "Impulsivity",
    "Remembrance",
    "Forgetfulness"
  ]

  def professions, do: @professions
  def abstract_ideas, do: @abstract_ideas
  def all, do: @professions ++ @abstract_ideas
end
