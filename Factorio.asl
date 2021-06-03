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
		{ "boiler", 0xE8 },
		{ "steam-engine", 0x394 },
		{ "lab", 0x25C },
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
	// {split name, building name, number of buildings, default selection (in auto-splitter settings)}
	//////////////////////////////////////////////////////////////////////
	Object [,] BuildingSplitsConfig =
	{
		{"BurnerCity", "stone-furnace", 25, true},
		{"BurnerCity", "burner-mining-drill", 35, true},
		{"Power", "boiler", 1, true},
		{"Power", "steam-engine", 1, true},
		{"Power", "lab", 1, true},
	};

	settings.Add("BuildingCount",true,"Splits by building count");

	//create a new dictionnary for building count
	vars.BuildingSplit = new Dictionary<string,  Dictionary<string, int>>();
	string splitName = "";
	string toolTip = "";
	for (int i = 0; i < BuildingSplitsConfig.GetLength(0); ++i){
		string 	name = BuildingSplitsConfig[i,1].ToString();
		int 	number = Convert.ToInt32(BuildingSplitsConfig[i,2]);
		bool	defaultSelection	= Convert.ToBoolean(Settings[i, 3]);
		if (splitName!=BuildingSplitsConfig[i,0]){
			splitName = BuildingSplitsConfig[i,0].ToString();
			toolTip=splitName+":\n\t"+name+" ("+number+")\n";
			settings.Add(splitName,defaultSelection,splitName,"BuildingCount");
			vars.BuildingSplit[splitName] = new Dictionary<string, int>();
			vars.BuildingSplit[splitName][name] = number;
		}else{
			toolTip = toolTip +"\t"+name+" ("+number+")\n";
			vars.BuildingSplit[splitName][name] = number;
		}
		settings.SetToolTip(splitName,toolTip);
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
