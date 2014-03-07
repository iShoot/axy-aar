#include "\userconfig\axy_aar\axy_aar_config.hpp"

// waituntil {alive player};

"AXY_MASS_AAR" callExtension format ["mission:MASS.%1.%2", missionName, worldName];
"AXY_MASS_AAR" callExtension "clear:all";

// Write out the addon version to the file.
if (isClass(configfile >> "cfgPatches" >> "AXY_MASS_AAR")) then
{
	"AXY_MASS_AAR" callExtension format["save:[0,'version',%1]", getArray(configfile >> "cfgPatches" >> "AXY_MASS_AAR" >> "versionar")];
} else {
	"AXY_MASS_AAR" callExtension "save:[0,'version',[0,0,0]]";  // Just text...
};

// How long do we wait at the end of our main loop before starting again with position updates etc?
axymassaar_mainLoopSleep= 5;

// call main program loop.
private ["_mainLoop"];

// Can run this in my mission or as addon...
if isClass(configfile >> "cfgPatches" >> "AXY_MASS_AAR") then
{
	_mainLoop= compile preprocessFileLineNumbers "\AXY_MASS_AAR\mainLoop.sqf";
} else {
	// Otherwise, running in mission code.
	_mainLoop= compile preprocessFileLineNumbers "AXY_MASS_AAR\mainLoop.sqf";
};
[] spawn _mainLoop;