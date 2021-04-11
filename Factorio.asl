/** 
 * Factorio.asl - An ASL script for the auto-splitter of LiveSplit for the game Factorio (x64, steam version, English localization)
 * @author  AureiAnimus and MrHug (inspired by original autosplitter by Ekelbatzen)
 * @version 1 on April 11th 2021 
 */
state("Factorio", "1.1.30.58304") {
	//Check whether we are in a game and whether or not the game is paused"
	ulong 	 gamePointer : 0x1c1aae0, 0x68;
	byte	 gamePaused:   0x1c1aae0, 0x68, 0x68, 0x270;
	
	// split memory addresses
	byte	 automationResearch: 0x1c1aae0, 0x68, 0x68, 0x2C8, 0x70, 0x8, 0x0, 0xf4;
	byte	 logisticsResearch: 0x1c1aae0, 0x68, 0x68, 0x2C8, 0x70, 0x8, 0x0, 0x604;
	byte	 steelAxeResearch: 0x1c1aae0, 0x68, 0x68, 0x2C8, 0x70, 0x8, 0x0, 0x16e4;
	byte	 automation2Research: 0x1c1aae0, 0x68, 0x68, 0x2C8, 0x70, 0x8, 0x0, 0x184;
	byte	 advancedOilProcResearch: 0x1c1aae0, 0x68, 0x68, 0x2C8, 0x70, 0x8, 0x0, 0x30c4;
	byte	 prod3ModuleResearch: 0x1c1aae0, 0x68, 0x68, 0x2C8, 0x70, 0x8, 0x0, 0x6754;
	byte	 rocketSiloResearch: 0x1c1aae0, 0x68, 0x68, 0x2C8, 0x70, 0x8, 0x0, 0x6bd4;
	byte 	 numRockets: 0x1c1aae0, 0x68, 0x68, 0x2A8, 0x0, 0x5d8;
}

init{

}

startup {

}

start {
	return current.gamePointer != 0&& old.gamePointer == 0;
}

split {
	if (old.automationResearch == 0) {
		return current.automationResearch == 1;
	}
	if (old.logisticsResearch == 0) {
		return current.logisticsResearch == 1;
	}
	if (old.steelAxeResearch == 0) {
		return current.steelAxeResearch == 1;
	}
	if (old.automation2Research == 0) {
		return current.automation2Research == 1;
	}
	if (old.advancedOilProcResearch == 0) {
		return current.advancedOilProcResearch == 1;
	}
	if (old.prod3ModuleResearch == 0) {
		return current.prod3ModuleResearch == 1;
	}
	if (old.rocketSiloResearch == 0) {
		return current.rocketSiloResearch == 1;
	}
	return current.numRockets == 1 && old.numRockets == 0;
}

isLoading {
	return current.gamePaused == 1;
}

gameTime {
}