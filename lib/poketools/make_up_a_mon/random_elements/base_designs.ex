defmodule PokeTools.MakeUpAMon.RandomElements.BaseDesigns do
  @cats [
    "Cat (Generic)",
    "Cat (Maine Coon)",
    "Cat (Calico)",
    "Cat (Tabby)",
    "Cat (Himalayan)",
    "Cat (Hairless)",
    "Cat (Persian)",
    "Lion",
    "Tiger",
    "Cheetah",
    "Serval",
    "Lynx",
    "Jaguar",
    "Leopard",
    "Ocelot",
    "Liger"
  ]

  @dogs [
    "Dog (Generic)",
    "Dog (Pomeranian)",
    "Dog (Husky)",
    "Dog (Retriever)",
    "Dog (Terrier)",
    "Dog (Dachsund)",
    "Dog (Chihuaha)",
    "Dog (Pug)",
    "Dog (Shiba)",
    "Dog (Border Collie)",
    "Dog (Corgi)",
    "Dog (Spaniel)",
    "Wolf",
    "Dingo"
  ]

  @birds [
    "Toucan",
    "Penguin",
    "Owl",
    "Barn Owl",
    "Snowy Owl",
    "Great Horned Owl",
    "Burrowing Owl",
    "Hummingbird",
    "Crane",
    "Stork",
    "Ibis",
    "Albatross",
    "Flamingo",
    "Hen",
    "Rooster",
    "Pigeon",
    "Raven",
    "Cardinal",
    "Kiwi",
    "Seagull",
    "Pelican",
    "Duck",
    "Goose"
  ]

  @mammals [
    "Hedgehog",
    "Porcupine",
    "Hamster",
    "Bunny",
    "Rabbit",
    "Hare",
    "Beaver",
    "Otter",
    "Mink",
    "Ferret",
    "Bear",
    "Black Bear",
    "Brown Bear",
    "Polar Bear",
    "Bat",
    "Flying Squirrel",
    "Squirrel",
    "Chipmunk",
    "Mouse",
    "Rat",
    "Raccoon",
    "Red Panda",
    "Panda",
    "Red Fox",
    "Fennec Fox",
    "Kit Fox",
    "Arctic Fox"
  ]

  @hooved_mammals [
    "Foal",
    "Buck (Male Deer with Antlers)",
    "Deer",
    "Reindeer",
    "Elk",
    "Bison",
    "Buffalo",
    "Boar",
    "Feral Hog",
    "Moose",
    "Camel",
    "Mountain Goat"
  ]

  @farm_animals [
    "Dairy Cow",
    "Bull",
    "Pig",
    "Teacup Pig",
    "Horse",
    "Sheep",
    "Goat",
    "Llama",
    "Alpaca",
    "Mule"
  ]

  @reptiles [
    "Lizard",
    "Chameleon",
    "Komodo Dragon",
    "Crocodile",
    "Alligator",
    "Skink",
    "Snake",
    "Anaconda",
    "Cobra",
    "Diamondback",
    "Garden Snake",
    "Cottonmouth",
    "Rattlesnake"
  ]

  @amphibians [
    "Axolotl",
    "Frog",
    "Turtle",
    "Tortoise",
    "Snapping Turtle",
    "Sea Turtle"
  ]

  @dinosaurs [
    "Raptor",
    "T-Rex",
    "Pterodactyl",
    "Stegosaurus",
    "Triceratops",
    "Ankylosaurus"
  ]

  @extinct_animals [
    "Sabre-Toothed Cat",
    "Wooly Mammoth",
    "Dodo",
    "Tasmanian Tiger",
    "Ibex"
  ]

  @marine_mammals [
    "Whale",
    "Walrus",
    "Narwhal",
    "Seal",
    "Sea Lion",
    "Elephant Seal",
    "Leopard Seal",
    "Orca"
  ]

  @fish [
    "Fighting Fish",
    "Tilapia",
    "Oarfish",
    "Swordfish",
    "Blue Tang",
    "Eel",
    "Mackerel",
    "Rainbow Trout",
    "Anglerfish",
    "Clownfish",
    "Hairy Fogfish",
    "Sarcastic Fringehead",
    "Anchovy",
    "Carp",
    "Mandarinfish",
    "Algae Eater",
    "Squid",
    "Colossal Squid",
    "Cuttlefish",
    "Stubby Squid",
    "Octopus",
    "Dumbo Octopus",
    "Flapjack Octopus",
    "Granrojo Jellyfish"
  ]

  @aquatic_life [
    "Starfish",
    "Clam",
    "Mantis Shrimp",
    "Rainbow Shrimp",
    "Sea Dragon",
    "Leafy Sea Dragon",
    "Seahorse",
    "Horseshoe Crab",
    "Crab",
    "Giant Mud Crab",
    "Lobster",
    "Shrimp",
    "Krill",
    "Hermit Crab",
    "Crawdad",
    "Crayfish",
    "Japanese Spider Crab"
  ]

  @insects [
    "Spider",
    "Termite",
    "Mosquito",
    "House Fly",
    "Horsefly",
    "Pill Bug",
    "Grasshopper",
    "Stick Insect",
    "Stinkbug",
    "Deer Tick"
  ]

  @animals @cats ++
             @dogs ++
             @birds ++
             @mammals ++
             @hooved_mammals ++
             @farm_animals ++
             @reptiles ++
             @amphibians ++
             @dinosaurs ++
             @extinct_animals ++ @marine_mammals ++ @fish ++ @aquatic_life ++ @insects

  @objects [
    "Doll",
    "Teddy Bear",
    "Microphone",
    "Oboe",
    "French Horn",
    "Water Bottle",
    "TV Remote",
    "Game Controller"
  ]

  @urban_legends [
    "Mothman",
    "Bigfoot",
    "Wendigo",
    "NotDeer",
    "Loch Ness Monster",
    "Chupacabra",
    "Sea Serpent",
    "Kraken",
    "Mongolian Death Worm",
    "Drop Bear",
    "Yeti",
    "Hoop Snake",
    "Jersey Devil",
    "Thunderbird",
    "Cthulu",
    "Dybbuk",
    "Ghost",
    "Tanuki",
    "Kappa",
    "Tengu",
    "Rokuro Kubi",
    "Azuki Arai"
  ]

  @mythical_creatures [
    "Western Dragon",
    "Eastern Dragon",
    "Ouroboros",
    "Oni",
    "Demon",
    "Angel",
    "Angel (The Scary, Biblically Accurate Kind)",
    "Lovecraftian Horror",
    "Cyclops",
    "Golem",
    "Ogre",
    "Gnome",
    "Goblin",
    "Faerie",
    "Gorgon",
    "Mermaid",
    "Minotaur",
    "Centaur",
    "Faun",
    "Werewolf",
    "Griffin",
    "Phoenix",
    "Basilisk",
    "Unicorn",
    "Chimera",
    "Hydra",
    "Zombie",
    "Banshee",
    "Vampire",
    "Kelpie",
    "Selkie",
    "Harpy",
    "Roc",
    "Cockatrice",
    "Bugbear",
    "Cerberus",
    "Fenrir",
    "Manticore",
    "Carbuncle",
    "Jackalope",
    "Snipe",
    "Lamia"
  ]

  @imaginary_creatures @urban_legends ++ @mythical_creatures

  def animals, do: @animals
  def objects, do: @objects
  def imaginary_creatures, do: @imaginary_creatures
  def all, do: @animals ++ @objects ++ @imaginary_creatures
end
