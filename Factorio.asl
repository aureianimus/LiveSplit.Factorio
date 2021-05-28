/** 
 * Factorio.asl - An ASL script for the auto-splitter of LiveSplit for the game Factorio (x64, steam version, English localization)
 * @author  AureiAnimus and MrHug (inspired by original autosplitter by Ekelbatzen)
 * @version 1.1 on May 1st 2021 
 */
state("Factorio", "1.1.33.58442-steam") {
	//Check whether we are in a game and whether or not the game is paused"
	ulong 	 gamePointer : 0x1c1c6e0, 0x68;
	ulong	 researchArea: 0x1c1c6e0, 0x68, 0x68, 0x2C8, 0x70, 0x8, 0x0;
	byte	 gamePaused:   0x1c1c6e0, 0x68, 0x68, 0x270;
	byte 	 numRockets: 0x1c1c6e0, 0x68, 0x68, 0x2A8, 0x0, 0x5d8;
}

state("Factorio", "1.1.30.58304-steam") {
	//Check whether we are in a game and whether or not the game is paused"
	ulong 	 gamePointer : 0x1C1AAE0, 0x68;
	ulong	 researchArea: 0x1C1AAE0, 0x68, 0x68, 0x2C8, 0x70, 0x8, 0x0;
	byte	 gamePaused:   0x1C1AAE0, 0x68, 0x68, 0x270;
	byte 	 numRockets: 0x1c1aae0, 0x68, 0x68, 0x2A8, 0x0, 0x5d8;
}

state("Factorio", "1.1.32.58364-steam") {
	//Check whether we are in a game and start of the research table.
	ulong 	 gamePointer : 0x1c199e0, 0x68;
	ulong	 researchArea: 0x1c199e0, 0x68, 0x68, 0x2C8, 0x70, 0x8, 0x0;
	
	byte	 gamePaused:   0x1c199e0, 0x68, 0x68, 0x270;
	byte 	 numRockets: 0x1c199e0, 0x68, 0x68, 0x2A8, 0x0, 0x5d8;
}

state("Factorio", "1.1.30-standalone") {
	//Check whether we are in a game and whether or not the game is paused"
	ulong 	 gamePointer : 0x1C1FD40, 0x68;
	ulong	 researchArea: 0x1C1FD40, 0x68, 0x68, 0x2C8, 0x70, 0x8, 0x0;
	byte	 gamePaused:   0x1C1FD40, 0x68, 0x68, 0x270;
	byte 	 numRockets: 0x1C1FD40, 0x68, 0x68, 0x2A8, 0x0, 0x5d8;
}
state("Factorio", "1.1.34-standalone-gog") {
	//Check whether we are in a game and whether or not the game is paused"
	ulong 	 gamePointer : 0x1C21B00, 0x68;
	ulong	 researchArea: 0x1C21B00, 0x68, 0x68, 0x2C8, 0x70, 0x8, 0x0;
	byte	 gamePaused:   0x1C21B00, 0x68, 0x68, 0x270;
	byte 	 numRockets: 0x1C21B00, 0x68, 0x68, 0x2A8, 0x0, 0x5d8;
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
        version = "1.1.34-standalone-gog";
	else
		print("No known version MemorySize " + modules.First().ModuleMemorySize);
}	

startup {
	print("startup");
	
	settings.Add("rocket", true, "First rocket launch");
	
	vars.researches = new Dictionary<string, Dictionary<string, ulong>>();
	vars.researches["red-sci"] = new Dictionary<string, ulong>();
	vars.researches["red-sci"]["automation"] = 0xf4;
	vars.researches["red-sci"]["logistics"] = 0x604;
	vars.researches["red-sci"]["electronics"] = 0x2a4;
	vars.researches["red-sci"]["fast-inserter"] = 0x334;
	vars.researches["red-sci"]["steel-processing"] = 0x1534;
	vars.researches["red-sci"]["steel-axe"] = 0x16e4;
	vars.researches["red-sci"]["logistic-science"] = 0x1321;
	
	vars.researches["green-sci"] = new Dictionary<string, ulong>();
	vars.researches["green-sci"]["automation2"] = 0x184;
	
	vars.researches["blue-sci"] = new Dictionary<string, ulong>();
	vars.researches["blue-sci"]["advanced-oil-proc"] = 0x30c4;

	vars.researches["purple-sci"] = new Dictionary<string, ulong>();
	vars.researches["purple-sci"]["prod-3-module"] = 0x6754;
	
	vars.researches["yellow-sci"] = new Dictionary<string, ulong>();
	vars.researches["yellow-sci"]["rocket-silo"] = 0x6bd4;

	
	vars.defaults = new Dictionary<string, HashSet<string>>();
	vars.defaults["red-sci"] = new HashSet<string>();
	vars.defaults["red-sci"].Add("automation");
	vars.defaults["red-sci"].Add("electronics");
	vars.defaults["red-sci"].Add("steel-axe");
	
	vars.defaults["green-sci"] = new HashSet<string>();
	vars.defaults["green-sci"].Add("automation2");
	
	vars.defaults["blue-sci"] = new HashSet<string>();
	vars.defaults["blue-sci"].Add("advanced-oil-proc");
	
	vars.defaults["purple-sci"] = new HashSet<string>();
	vars.defaults["purple-sci"].Add("prod-3-module");
	
	vars.defaults["yellow-sci"] = new HashSet<string>();
	vars.defaults["yellow-sci"].Add("rocket-silo");
	
	settings.Add("research",true,"Researched Technologies");	
		
	foreach(var science in vars.researches.Keys){
		settings.Add(science, true, science, "research");
		foreach(KeyValuePair<string, ulong> entry in vars.researches[science]) {
			settings.Add(entry.Key, vars.defaults[science].Contains(entry.Key), entry.Key, science);	
		}
	}
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
	if (settings["rocket"] && !vars.splitsDone.Contains("rocket")) {
		if (current.numRockets == 1 && old.numRockets == 0) { 
			vars.splitsDone.Add("rocket");
			return true;
		}
	}
	if (settings["research"]) {
		foreach(var science in vars.researches.Keys){
			if (!settings[science]) continue;
			foreach(KeyValuePair<string, ulong> entry in vars.researches[science]) {
				if (settings[entry.Key] && !vars.splitsDone.Contains(entry.Key)) { // We want to split on it and it hasn't happened yet.
					if (memory.ReadValue<byte>((System.IntPtr)(current.researchArea + entry.Value)) == 1) {
						vars.splitsDone.Add(entry.Key);
						return true;
					}
				}
			}
		}
	}
	return false;
}

isLoading {
	return current.gamePaused == 1;
}

shutdown {
	vars.splitsDone = new HashSet<string>();
}
