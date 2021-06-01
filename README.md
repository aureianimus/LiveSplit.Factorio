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
- **Rocket Silo**
- **Number of rockets launched changing from 0 to 1**

### Building number
- 5 stone-furnaces
- 5 burner-mining-drill
- 6 stone-furnaces
- 6 burner-mining-drill
- 1 boiler
- 1 steam-engine
- 1 lab

## Cheat Engine .CT File
Based on Bloodybone cheat file.
Added Pointers for:
Researches

## TODO

- check buildingNumberArea (in state section) for other versions than 1.34-gog
- Add the rest of the research to the options menu.
- Look into splitting on production stats (e.g. number of purple science produced)
- Group splits: for example when there is 5 stone-furnaces & 5 burner-mining-drill (for now there is one split for each)
