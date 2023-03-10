defmodule PokeTools.MakeUpAMon.RandomElements.FoundIn do
  @environments [
    "Rainforest",
    "Temperate Forest",
    "Desert",
    "Tundra",
    "Grassland",
    "Savanna",
    "Snowy Mountains",
    "Desert Mountains",
    "Forested Mountains",
    "Freshwater",
    "Marine",
    "Ice Cap",
    "Autumnal Forest",
    "Mangrove",
    "Large River",
    "Small Stream or Creek",
    "Abandoned Town",
    "Deep Cave",
    "Deserted Mine Shaft",
    "Time-Worn Tunnel",
    "Suburb",
    "Big City Alley",
    "Rural Town",
    "Small Village",
    "Creepy Building",
    "Volcano",
    "River Delta",
    "Lake",
    "Pond",
    "Swamp",
    "Coral Reef",
    "Beach",
    "Ancient Ruins",
    "Foggy Dirt Path",
    "Lovecraftian Pocket Universe",
    "Space",
    "Another Planet",
    "The Metaverse",
    "The Digital World",
    "Flooded Grassland"
  ]

  @countries [
    "Iraq",
    "Egypt",
    "Greece",
    "Sudan",
    "Iran",
    "Cameroon",
    "Malaysia",
    "Antarctica",
    "Burundi",
    "Virgin Islands",
    "Jamaica",
    "Bangladesh",
    "Somalia",
    "Qatar",
    "Sri Lanka",
    "Costa Rica",
    "Serbia",
    "Germany",
    "South Africa",
    "Mozambique",
    "North-Eastern United States",
    "Southern United States",
    "Widwest United States",
    "West Coast United States",
    "Great Lakes United States",
    "Fiji",
    "Nepal",
    "French Guiana",
    "Bahrain",
    "Zambia",
    "Sweden",
    "England",
    "Scotland",
    "Ireland",
    "Wales",
    "Denmark",
    "Grenada",
    "Canada",
    "Mexico",
    "Sierra Leone",
    "India",
    "Austria",
    "Bermuda",
    "Rwanda",
    "Montserrat",
    "Brazil",
    "Argentina",
    "Indonesia",
    "China",
    "Turkey",
    "Russia",
    "Japan",
    "Afghanistan"
  ]

  def environments, do: @environments
  def countries, do: @countries
  def all, do: @environments ++ @countries
end
