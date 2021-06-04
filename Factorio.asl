/** 
 * Factorio.asl - An ASL script for the auto-splitter of LiveSplit for the game Factorio (x64, steam version, English localization)
 * @author  AureiAnimus and MrHug (inspired by original autosplitter by Ekelbatzen)
 * @additionnalAuthor Tignass
 * @version 1.1 on May 1st 2021 
 */
state("Factorio", "1.1.33.58442-steam") {
	//Check whether we are in a game and whether or not the game is paused"
	ulong 	gamePointer : 0x1C21B00, 0x68;
	ulong	researchArea: 0x1C21B00, 0x68, 0x68, 0x2C8, 0x70, 0x8, 0x0;
	ulong	buildingNumberArea:	0x1C21B00, 0x68, 0x68, 0x2C8, 0xE0, 0x28, 0x30; // not tested
	byte	gamePaused:   0x1C21B00, 0x68, 0x68, 0x270;
	byte 	numRockets: 0x1C21B00, 0x68, 0x68, 0x2A8, 0x0, 0x5d8;
}

state("Factorio", "1.1.30.58304-steam") {
	//Check whether we are in a game and whether or not the game is paused"
	ulong 	gamePointer : 0x1C1AAE0, 0x68;
	ulong	researchArea: 0x1C1AAE0, 0x68, 0x68, 0x2C8, 0x70, 0x8, 0x0;
	ulong	buildingNumberArea:	0x1C1AAE0, 0x68, 0x68, 0x2C8, 0xE0, 0x28, 0x30; // not tested
	byte	gamePaused:   0x1C1AAE0, 0x68, 0x68, 0x270;
	byte 	numRockets: 0x1c1aae0, 0x68, 0x68, 0x2A8, 0x0, 0x5d8;
}

state("Factorio", "1.1.32.58364-steam") {
	//Check whether we are in a game and start of the research table.
	ulong 	gamePointer : 0x1c199e0, 0x68;
	ulong	researchArea: 0x1c199e0, 0x68, 0x68, 0x2C8, 0x70, 0x8, 0x0;
	ulong	buildingNumberArea:	0x1c199e0, 0x68, 0x68, 0x2C8, 0xE0, 0x28, 0x30; // not tested
	byte	gamePaused:   0x1c199e0, 0x68, 0x68, 0x270;
	byte 	numRockets: 0x1c199e0, 0x68, 0x68, 0x2A8, 0x0, 0x5d8;
}

state("Factorio", "1.1.30-standalone") {
	//Check whether we are in a game and whether or not the game is paused"
	ulong 	gamePointer : 0x1C1FD40, 0x68;
	ulong	researchArea: 0x1C1FD40, 0x68, 0x68, 0x2C8, 0x70, 0x8, 0x0;
	ulong	buildingNumberArea:	0x1C1FD40, 0x68, 0x68, 0x2C8, 0xE0, 0x28, 0x30; // not tested
	byte	gamePaused:   0x1C1FD40, 0x68, 0x68, 0x270;
	byte 	numRockets: 0x1C1FD40, 0x68, 0x68, 0x2A8, 0x0, 0x5d8;
}

state("Factorio", "1.1.34-gog") {
	//Check whether we are in a game and whether or not the game is paused"
	ulong 	gamePointer : 0x1C21B00, 0x68;
	ulong	researchArea: 0x1C21B00, 0x68, 0x68, 0x2C8, 0x70, 0x8, 0x0;
	ulong	buildingNumberArea:	0x1C21B00, 0x68, 0x68, 0x2C8, 0xE0, 0x28, 0x30;
	byte	gamePaused:   0x1C21B00, 0x68, 0x68, 0x270;
	byte 	numRockets: 0x1C21B00, 0x68, 0x68, 0x2A8, 0x0, 0x5d8;
}
init{
	if (modules.First().ModuleMemorySize == 30756864)
        version = "1.1.30.58304-steam";
  	else if (modules.First().ModuleMemorySize == 30777344)
        version = "1.1.30-standalone";
	else if (modules.First().ModuleMemorySize == 30752768)
        version = "1.1.32.58364-steam";
	else if (modules.First().ModuleMemorySize == 30765056)
        version = "1.1.33.58442-steam";
	else if (modules.First().ModuleMemorySize == 30785536)
        version = "1.1.34-gog";
	else
		print("No known version MemorySize " + modules.First().ModuleMemorySize);
}	

startup {
	print("startup");
	
	// Object structure (Parent, Id, Description, Pointer, defaultSelection)
	// if Id has a # followed by an integer (ex: #5) in it, will create the split whith this specific Number of building
	// exemple: "stone-furnace#5" will split when there is 5 stone-furnaces built
	
	//////////////////////////////////////////////////////////////////////
	// This section is used to configure researches
	// {parent (in auto-splitter settings), id, name, description, address, default selection (in auto-splitter settings)}
	//////////////////////////////////////////////////////////////////////
	Object [,] Settings =
		{
			{ "none", "Firsts", "Split with firsts", 0x0, true },
				{ "Firsts", "rocket", "First rocket launch", 0xf5, true },

			{ "none", "Research", "Split with research completion:", 0x0, true },
				{ "Research", "red-sci", "Splits with red science:", 0x0, true },
					{ "red-sci", "automation", "automation completed" , 0xf4, true },
					{ "red-sci", "logistics", "logistics completed" , 0x604, false },
					{ "red-sci", "electronics", "electronics completed", 0x2a4, false },
					{ "red-sci", "fast-inserter", "fast-inserter completed", 0x334, false },
					{ "red-sci", "steel-processing", "steel-processing completed", 0x1534, false },
					{ "red-sci", "steel-axe", "steel-axe completed", 0x16e4, true },
					{ "red-sci", "logistic-science-pack", "logistic-science-pack completed", 0x1321, true },
				{ "Research", "green-sci", "Splits with green science:" ,0x0, true},
					{ "green-sci", "automation2", "automation2 completed", 0x184, true },
					{ "green-sci", "advanced-material-processing", "advanced-material-processing completed", 0x1654, false },
					{ "green-sci", "engine", "engine completed", 0xBA4, false },
					{ "green-sci", "fluid-handling", "fluid-handling completed", 0x3034, false },
					{ "green-sci", "oil-processing", "oil-processing completed", 0x2FA4, false },
					{ "green-sci", "plastics", " completed", 0x3274, true },
					{ "green-sci", "advanced-electronics", "advanced-electronics completed", 0x3C4, false },
					{ "green-sci", "sulfur-processing", "sulfur-processing completed", 0x31E4, true },
					{ "green-sci", "chemical-science-pack", "chemical-science-pack completed", 0x1264, true },
					{ "green-sci", "battery", "battery completed", 0xD54, false },
					{ "green-sci", "modules", "modules completed", 0x63F4, false },
					{ "green-sci", "productivity-module", "productivity-module completed", 0x6634, true },
					{ "green-sci", "logistics-2", "logistics-2 completed", 0x694, false },
					{ "green-sci", "railway", "railway completed", 0x1A44, false },
					{ "green-sci", "speed-module", "speed-module completed", 0x6484, false },
					{ "green-sci", "advanced-oil-processing", "advanced-oil-processing completed", 0x30c4, false },
					{ "green-sci", "lubricant", "lubricant completed", 0xCC4, true },
					{ "green-sci", "electric-engine", "electric-engine completed", 0xC34, false },
					{ "green-sci", "robotics", "robotics completed", 0x1C84, false },
					{ "green-sci", "advanced-electronics-2", "advanced-electronics-2 completed", 0x454, false },
					{ "green-sci", "advanced-material-processing-2", "advanced-material-processing-2 completed", 0x1774, false },
					{ "green-sci", "toolbelt", "toolbelt completed", 0x2734, false },
					{ "green-sci", "research-speed-1", "research-speed-1 completed", 0x27C4, false },
					{ "green-sci", "research-speed-2", "research-speed-2 completed", 0x2854, false },
					{ "green-sci", "flammables", "flammables completed", 0x3814, false },
					{ "green-sci", "concrete", "concrete completed", 0x1804, false },
				{ "Research", "blue-sci", "Splits with blue science:" ,0x0, true },
					{ "blue-sci", "construction-robotics", "construction-robotics completed", 0x1D14, false },
					{ "blue-sci", "worker-robots-speed-1", "worker-robots-speed-1 completed", 0x1FE4, false },
					{ "blue-sci", "worker-robots-speed-2", "worker-robots-speed-2 completed", 0x2074, false },
					{ "blue-sci", "production-science-pack", "production-science-pack completed", 0x1414, true },
					{ "blue-sci", "low-density-structure", "low-density-structure completed", 0x6A24, false },
					{ "blue-sci", "utility-science-pack", "utility-science-pack completed", 0x15C4, true },
					{ "blue-sci", "rocket-fuel", "rocket-fuel completed", 0x6B44, false },
					{ "blue-sci", "productivity-module-2", "productivity-module-2 completed", 0x66C4, false },
					{ "blue-sci", "speed-module-2", "speed-module-2 completed", 0x6514, false },
				{ "Research", "purple-sci", "Splits with purple science:",0x0, false },
					{ "purple-sci", "productivity-module-3", "productivity-module-3 completed", 0x6754, false },
					{ "purple-sci", "speed-module-3", "speed-module-3 completed", 0x65A4, false },
					{ "purple-sci", "effect-transmission", "effect-transmission completed", 0x6994, false },
					{ "purple-sci", "research-speed-3", "research-speed-3 completed", 0x28E4, false },
				{ "Research", "yellow-sci", "Splits with yellow science:",0x0, true},
					{ "yellow-sci", "rocket-control-unit", "rocket-control-unit completed", 0x6AB4, false },
					{ "yellow-sci", "rocket-silo", "rocket-silo completed", 0x3345, true },
		};

	// create a variable of the array lenght
	vars.ArrayLength = Settings.GetLength(0);
	
	//create a new dictionnary
	vars.searchSplit = new Dictionary<string, Dictionary<string, ulong>>();

	for (int i = 0; i < vars.ArrayLength; ++i){
		string 	parent 			= Settings[i, 0].ToString();
		string 	id    			= Settings[i, 1].ToString();
		string 	description  		= Settings[i, 2].ToString();
		ulong 	address			= Convert.ToUInt64(Settings[i, 3]);
		bool	defaultSelection	= Convert.ToBoolean(Settings[i, 4]);

		//add parents entry in layout selection
		if (parent=="none"){
			settings.Add(id, defaultSelection, description);
		}else{
			settings.Add(id, defaultSelection, description, parent);
		}
		//create variables usable in "split section"
		if (address==Convert.ToUInt64(0x0)){
			if (!vars.searchSplit.ContainsKey(id)){
				vars.searchSplit[id] = new Dictionary<string, ulong>();
			}
		}else{
			vars.searchSplit[parent][id] = address;
		}
	}
	//////////////////////////////////////////////////////////////////////
	// this section is used to set memory addresses of the buildings count
	// {building name, address}
	//////////////////////////////////////////////////////////////////////
	Object [,] BuildingsAddressList =
	{
		{ "stone-furnace", 0x3A4 },
		{ "burner-mining-drill", 0xF4 },
		{ "iron-chest", 0x39C },
		{ "offshore-pump", 0x2CC },
		{ "boiler", 0xE8 },
		{ "steam-engine", 0x394 },
		{ "pump", 0x300 },
		{ "electric-mining-drill", 0x198 },
		{ "small-electric-pole", 0x33C },
		{ "lab", 0x25C },
		{ "pipe", 0x2E0 },
		{ "pipe-to-ground", 0x2E4 },
		{ "assembling-machine-1", 0x70 },
		{ "express-inserter", 0x24C },
		{ "express-belt", 0x3D0 },
		{ "express-splitter", 0x388 },
		{ "long-handed-inserter", 0x2A4 },
		{ "fast-inserter", 0x1E4 },
		{ "underground-belt", 0x3E0 },
		{ "assembling-machine-2", 0x74 },
		{ "steel-furnace", 0x3A0 },
		{ "pumpjack", 0x304 },
		{ "oil-refinery", 0x2D0 },
		{ "chemical-plant", 0x10C },
		{ "storage-tank", 0x3AC },
		{ "storage-chest", 0x29C },
		{ "passive-provider-chest", 0x294 },
		{ "roboport", 0x314 },	
	};
	vars.BuildingList = new Dictionary<string, ulong>();
	for (int i = 0; i < BuildingsAddressList.GetLength(0); ++i){
		string 	buildingName 	= BuildingsAddressList[i,0].ToString();
		ulong 	address			= Convert.ToUInt64(BuildingsAddressList[i, 1]);
		vars.BuildingList[buildingName] = address;
		// print(buildingName+" - "+address+" / "+vars.BuildingList[buildingName]);
	}

	//////////////////////////////////////////////////////////////////////
	// This array is used to configure split on building count
	// {split name, building name, number of buildings, default selection (if true: will be counted, if false: won't be taken into account)}
	//////////////////////////////////////////////////////////////////////
	Object [,] BuildingSplitsConfig =
	{
		// { "Exemple", "stone-furnace", 00, true },
		// { "Exemple", "burner-mining-drill", 00, true },
		// { "Exemple", "iron-chest", 00, true },
		// { "Exemple", "offshore-pump", 00, true },
		// { "Exemple", "boiler", 00, true },
		// { "Exemple", "steam-engine", 00, true },
		// { "Exemple", "pump", 00, true },
		// { "Exemple", "electric-mining-drill", 00, true },
		// { "Exemple", "small-electric-pole", 00, false },
		// { "Exemple", "lab", 00, true },
		// { "Exemple", "pipe", 00, false },
		// { "Exemple", "pipe-to-ground", 00, false },
		// { "Exemple", "assembling-machine-1", 00, true },
		// { "Exemple", "express-inserter", 00, false },
		// { "Exemple", "express-belt", 00, false },
		// { "Exemple", "express-splitter", 00, true },
		// { "Exemple", "long-handed-inserter", 00, true },
		// { "Exemple", "fast-inserter", 00, false },
		// { "Exemple", "underground-belt", 00, true },
		// { "Exemple", "assembling-machine-2", 00, true },
		// { "Exemple", "steel-furnace", 00, true },
		// { "Exemple", "pumpjack", 00, true },
		// { "Exemple", "oil-refinery", 00, true },
		// { "Exemple", "chemical-plant", 00, true },
		// { "Exemple", "storage-tank", 00, true },
		// { "Exemple", "storage-chest", 00, true },
		// { "Exemple", "passive-provider-chest", 00, true },
		// { "Exemple", "roboport", 00, true },

		{ "Burner City", "stone-furnace", 22, true },
		{ "Burner City", "burner-mining-drill", 35, true },
		{ "Burner City", "iron-chest", 1, true },

		{ "First power", "stone-furnace", 22, true },
		{ "First power", "burner-mining-drill", 35, true },
		{ "First power", "iron-chest", 1, true },
		{ "First power", "offshore-pump", 1, true },
		{ "First power", "boiler", 1, true },
		{ "First power", "steam-engine", 1, true },
		{ "First power", "pump", 6, true },
		{ "First power", "electric-mining-drill", 1, true },
		{ "First power", "small-electric-pole", 14, false },
		{ "First power", "lab", 1, true },
		{ "First power", "pipe", 5, false },

		{ "Green chips", "stone-furnace", 96, true },
		{ "Green chips", "burner-mining-drill", 44, true },
		{ "Green chips", "iron-chest", 15, true },
		{ "Green chips", "offshore-pump", 1, true },
		{ "Green chips", "boiler", 5, true },
		{ "Green chips", "steam-engine", 10, true },
		{ "Green chips", "pump", 6, true },
		{ "Green chips", "electric-mining-drill", 58, true },
		{ "Green chips", "small-electric-pole", 84, false },
		{ "Green chips", "lab", 3, true },
		{ "Green chips", "pipe", 9, false },
		{ "Green chips", "pipe-to-ground", 2, false },
		{ "Green chips", "assembling-machine-1", 34, true },
		{ "Green chips", "express-inserter", 203, false },
		{ "Green chips", "express-belt", 425, false },
		{ "Green chips", "express-splitter", 2, true },
		{ "Green chips", "long-handed-inserter", 9, true },

		{ "36 labs", "stone-furnace", 124, true },
		{ "36 labs", "burner-mining-drill", 44, true },
		{ "36 labs", "iron-chest", 21, true },
		{ "36 labs", "offshore-pump", 1, true },
		{ "36 labs", "boiler", 15, true },
		{ "36 labs", "steam-engine", 30, true },
		{ "36 labs", "pump", 6, true },
		{ "36 labs", "electric-mining-drill", 84, true },
		{ "36 labs", "small-electric-pole", 151, false },
		{ "36 labs", "lab", 36, true },
		{ "36 labs", "pipe", 19, false },
		{ "36 labs", "pipe-to-ground", 4, false },
		{ "36 labs", "assembling-machine-1", 63, true },
		{ "36 labs", "express-inserter", 288, false },
		{ "36 labs", "express-belt", 754, false },
		{ "36 labs", "express-splitter", 4, true },
		{ "36 labs", "long-handed-inserter", 41, true },
		{ "36 labs", "fast-inserter", 56, false },

		{ "Blue Science", "stone-furnace", 103, true },
		{ "Blue Science", "burner-mining-drill", 37, true },
		{ "Blue Science", "iron-chest", 37, true },
		{ "Blue Science", "offshore-pump", 3, true },
		{ "Blue Science", "boiler", 37, true },
		{ "Blue Science", "steam-engine", 74, true },
		{ "Blue Science", "pump", 00, true },
		{ "Blue Science", "electric-mining-drill", 312, true },
		{ "Blue Science", "small-electric-pole", 449, false },
		{ "Blue Science", "lab", 36, true },
		{ "Blue Science", "pipe", 185, false },
		{ "Blue Science", "pipe-to-ground", 71, false },
		{ "Blue Science", "assembling-machine-1", 26, true },
		{ "Blue Science", "express-inserter", 683, false },
		{ "Blue Science", "express-belt", 2600, false },
		{ "Blue Science", "express-splitter", 8, true },
		{ "Blue Science", "long-handed-inserter", 283, true },
		{ "Blue Science", "fast-inserter", 131, false },
		{ "Blue Science", "underground-belt", 63, true },
		{ "Blue Science", "assembling-machine-2", 133, true },
		{ "Blue Science", "steel-furnace", 216, true },
		{ "Blue Science", "pumpjack", 5, true },
		{ "Blue Science", "oil-refinery", 9, true },
		{ "Blue Science", "chemical-plant", 8, true },
		{ "Blue Science", "storage-tank", 10, true },
	};

	settings.Add("BuildingCount",true,"Splits by building count");

	//create a new dictionnary for building count
	vars.BuildingSplit = new Dictionary<string,  Dictionary<string, int>>();
	string splitName = "";
	string toolTip = "";
	for (int i = 0; i < BuildingSplitsConfig.GetLength(0); ++i){
		string 	name = BuildingSplitsConfig[i,1].ToString();
		int 	number = Convert.ToInt32(BuildingSplitsConfig[i,2]);
		bool	defaultSelection	= Convert.ToBoolean(BuildingSplitsConfig[i, 3]);

		if (defaultSelection==true){
			if (splitName!=BuildingSplitsConfig[i,0]){
				splitName = BuildingSplitsConfig[i,0].ToString();
				toolTip=splitName+":\n\t"+name+" ("+number+")\n";
				// settings.Add(id, defaultSelection, description, parent)
				settings.Add(splitName,defaultSelection,splitName,"BuildingCount");
				vars.BuildingSplit[splitName] = new Dictionary<string, int>();
				vars.BuildingSplit[splitName][name] = number;
			}else{
				toolTip = toolTip +"\t"+name+" ("+number+")\n";
				vars.BuildingSplit[splitName][name] = number;
			}
			settings.SetToolTip(splitName,toolTip);
		}
	}

	vars.allConditionsOK = true;
	// create a variable to handle "already done splits"
	vars.splitsDone = new HashSet<string>();
}

start {
	if (current.gamePointer != 0&& old.gamePointer == 0) {
		vars.splitsDone = new HashSet<string>();
		return true;
	}
	return false;
}

split {
	// will split when rocket launched (if selected in the Auto-splitter settings)
	if (settings["rocket"] && !vars.splitsDone.Contains("rocket")) {
		if (current.numRockets == 1 && old.numRockets == 0) { 
			vars.splitsDone.Add("rocket");
			return true;
		}
	}
	
	// will split when searches are completed (for the ones selected in the Auto-splitter settings)
	foreach(var id in vars.searchSplit.Keys){
		if (settings["Research"]) {
			if (!settings[id]) continue;
				foreach(KeyValuePair<string, ulong> entry in vars.searchSplit[id]) {
					if (settings[entry.Key] && !vars.splitsDone.Contains(entry.Key)) { // We want to split on it and it hasn't happened yet.
						if (memory.ReadValue<byte>((System.IntPtr)(current.researchArea + entry.Value)) == 1) {
							vars.splitsDone.Add(entry.Key);
							// print(entry.Key.ToString());
							return true;
						}
					}
				}
		}
	}

	// will split a set of building count (built) are equals (or superior) to the value set in the array BuildingSplitsConfig (for the ones selected in the Auto-splitter settings)
	foreach(var split in vars.BuildingSplit.Keys){
		vars.allConditionsOK = true;
		// print(split);
		if (settings[split] && !vars.splitsDone.Contains(split)) {
			foreach(var building in vars.BuildingSplit[split].Keys){
				print(split+": "+building +" #"+vars.BuildingSplit[split][building]+" - address: "+vars.BuildingList[building]);
				if (memory.ReadValue<byte>((System.IntPtr)(current.buildingNumberArea + vars.BuildingList[building])) >= vars.BuildingSplit[split][building]) {
				}else{
					vars.allConditionsOK=false;
				}
			}
			if (vars.allConditionsOK){
				vars.splitsDone.Add(split);
				return true;
			}else{
				return false;
			}
		}
	}

	///////////////////////////////////////////////
	////////////////////Debug//////////////////////
	///////////////////////////////////////////////

	//print the number of rockets launched
	//print("numRockets: "+current.numRockets.ToString());

	// print 1 if "automation research" split is done
	// print("research automation: "+memory.ReadValue<byte>((System.IntPtr)(current.researchArea + vars.split["red-sci"]["automation"])).ToString());

	//print the number of furnaces
	// print("number of furnaces: "+memory.ReadValue<byte>((System.IntPtr)(current.buildingNumberArea + 0x3A4)).ToString());

	return false;
}

isLoading {
	return current.gamePaused == 1;
}

shutdown {
	vars.splitsDone = new HashSet<string>();
}
reset {
	if(memory.ReadValue<byte>((System.IntPtr)(current.gamePointer)) == 0){
		return true;
	}
}
