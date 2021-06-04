# Autosplitter for Factorio

Currently tested only against 1.1.30.58304-steam, 1.1.30-standalone, 1.1.32.58364-steam, 1.1.34-gog.

In the current version there is some basic customatisation of splits. The timer starts when a player transitions from not being in a game to being in a game and then splits on research, rocket launch or building count.

Currently the following splits are supported (configurable from options menu, bold-faced are default enabled).
_Note that this only works properly if you also use the script to start your timer (the timer will automaticaly reset if "game" (in-game) is closed_

### Research
#### Red Science
- 	automation
- 	logistics
- 	electronics
- 	fast-inserter
- 	steel-processing
- 	steel-axe
- 	logistic-science-pack
#### Green Science
- 	automation2
- 	advanced-material-processing
- 	engine
- 	fluid-handling
- 	oil-processing
- 	plastics
- 	advanced-electronics
- 	sulfur-processing
- 	chemical-science-pack
- 	battery
- 	modules
- 	productivity-module
- 	logistics-2
- 	railway
- 	speed-module
- 	advanced-oil-processing
- 	lubricant
- 	electric-engine
- 	robotics
- 	advanced-electronics-2
- 	advanced-material-processing-2
- 	toolbelt
- 	research-speed-1
- 	research-speed-2
- 	flammables
- 	concrete
#### Blue Science
- 	construction-robotics
- 	worker-robots-speed-1
- 	worker-robots-speed-2
- 	production-science-pack
- 	low-density-structure
- 	utility-science-pack
- 	rocket-fuel
- 	productivity-module-2
- 	speed-module-2
#### Purple Science
- 	productivity-module-3
- 	speed-module-3
- 	effect-transmission
- 	research-speed-3
#### Yellow science
- 	rocket-control-unit
- 	rocket-silo

### Rocket launch
- Number of rockets launched changing from 0 to 1

### Building number
#### Burner City
 - stone-furnace: 22
 - burner-mining-drill: 35
 - iron-chest: 1

#### First power
 - stone-furnace: 22
 - burner-mining-drill: 35
 - iron-chest: 1
 - offshore-pump: 1
 - boiler: 1
 - steam-engine: 1
 - pump: 6
 - electric-mining-drill: 1
 - small-electric-pole: 14
 - lab: 1
 - pipe: 5

#### Green chips
 - stone-furnace: 96
 - burner-mining-drill: 44
 - iron-chest: 15
 - offshore-pump: 1
 - boiler: 5
 - steam-engine: 10
 - pump: 6
 - electric-mining-drill: 58
 - small-electric-pole: 84
 - lab: 3
 - pipe: 9
 - pipe-to-ground: 2
 - assembling-machine-1: 34
 - express-inserter: 203
 - express-belt: 425
 - express-splitter: 2
 - long-handed-inserter: 9

#### 36 labs
 - stone-furnace: 124
 - burner-mining-drill: 44
 - iron-chest: 21
 - offshore-pump: 1
 - boiler: 15
 - steam-engine: 30
 - pump: 6
 - electric-mining-drill: 84
 - small-electric-pole: 151
 - lab: 36
 - pipe: 19
 - pipe-to-ground: 4
 - assembling-machine-1: 63
 - express-inserter: 288
 - express-belt: 754
 - express-splitter: 4
 - long-handed-inserter: 41
 - fast-inserter: 56

#### Blue Science
 - stone-furnace: 103
 - burner-mining-drill: 37
 - iron-chest: 37
 - offshore-pump: 3
 - boiler: 37
 - steam-engine: 74
 - pump: 6
 - electric-mining-drill: 312
 - small-electric-pole: 449
 - lab: 36
 - pipe: 185
 - pipe-to-ground: 71
 - assembling-machine-1: 26
 - express-inserter: 683
 - express-belt: 2600
 - express-splitter: 8
 - long-handed-inserter: 283
 - fast-inserter: 131
 - underground-belt: 63
 - assembling-machine-2: 133
 - steel-furnace: 216
 - pumpjack: 5
 - oil-refinery: 9
 - chemical-plant: 8
 - storage-tank: 10

## Cheat Engine .CT File
Based on Bloodybone cheat file.
Added Pointers for: Researches and building numbers

## TODO

- check buildingNumberArea (in state section) for other versions than 1.34-gog
- Add the rest of the research to the options menu.
- Look into splitting on production stats (e.g. number of purple science produced)
- Add the rest of the buildings to the building list
- Add more splits (on building count) in the option menu
