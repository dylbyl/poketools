defmodule PokeTools.MakeUpAMon.RandomElements.StatDescriptions do
  @boring_descriptions [
    "Very High",
    "High",
    "Low",
    "Very Low",
    "Middling"
  ]

  @fun_descriptions [
    "Phenomenal!",
    "Nothing to write home about...",
    "Very meh.",
    "Best in class.",
    "Absolutely pathetic!",
    "Laughable...",
    "Mind-boggling!",
    "Astounding!",
    "Unfathomably average!",
    "A little better than most.",
    "Slightly worse than average.",
    "So low it's not even funny.",
    "Higher than we ever could have imagined.",
    "An absolute disaster.",
    "Perfect!",
    "Unclear.",
    "Smack dab in the middle.",
    "Curiously normal...",
    "Sky high.",
    "Bottomed out.",
    "Middle of the road."
  ]

  def boring_descriptions, do: @boring_descriptions
  def fun_descriptions, do: @fun_descriptions
  def all, do: @fun_descriptions
end
