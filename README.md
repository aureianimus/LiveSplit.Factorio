# Autosplitter for Factorio

Currently tested only against 1.1.30.58304-steam, 1.1.30-standalone, and 1.1.32.58364-steam.

In the current version there is some basic customatisation of splits. The timer starts when a player transitions from not being in a game to being in a game and then splits on research or rocket launch.

Currently the following splits are supported (configurable from options menu, bold-faced are default enabled).
_Note that this only works properly if you also use the script to start your timer, so when resetting in between make sure to have the script start your timer again!_

### Research
- **Automation**
- Logistics
- **Electronics**
- Fast Inserters
- Steel Processing
- **Steel Axe (potentially making part of this useful for the steelaxe% run)**
- Logistic science
- **Automation2**
- **Advanced Oil Processing**
- **Productivity module 3**
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


## TODO

- Add the rest of the research to the options menu.
- Look into splitting on production stats (e.g. number of purple science produced)
- Group splits: for example when there is 5 stone-furnaces & 5 burner-mining-drill (for now there is one split for each)
