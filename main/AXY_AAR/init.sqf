#include "\userconfig\axy_aar\axy_aar_config.hpp"

waituntil {alive player};

"AXY_AAR_Extension" callExtension format ["mission:%1.%2", missionName, worldName];
"AXY_AAR_Extension" callExtension "clear:all";

// Write out the addon version to the file.
if (isClass(configfile >> "cfgPatches" >> "AXY_AAR")) then
{
	"AXY_AAR_Extension" callExtension format["save:[0,'version',%1]", getArray(configfile >> "cfgPatches" >> "AXY_AAR" >> "versionar")];
} else {
	"AXY_AAR_Extension" callExtension "save:[0,'version',[0,0,0]]";  // Just text...
};

// Contains the list of members in our group/section.
axyaar_section= [];

// if we're in contact, is True, time we started and last update.
axyaar_sectionInContact= [false, 0, 0]; 

// while we're in contact, track enemy participation.
// format is name, wounded, killed.
// This should be cleared at the end of each contact.
axyaar_enemyInContact= [];

// How long after the last action do we consider a contact over?
axyaar_contactEnds= AXY_AAR_CONTACT_ENDS;  // defined in axy_aar_config.hpp

// How long do we wait at the end of our main loop before starting again with position updates etc?
axyaar_mainLoopSleep= AXY_AAR_PAUSE_LOOP;

// Should we be tracking the player's position, or the group leaders position?
axyaar_trackLeader= AXY_AAR_TRACK_LEADER;

// call main program loop.
private ["_mainLoop"];

// Can run this in my mission or as addon...
if isClass(configfile >> "cfgPatches" >> "AXY_AAR") then
{
	_mainLoop= compile preprocessFileLineNumbers "\axy_AAR\mainLoop.sqf";
} else {
	// Otherwise, running in mission code.
	_mainLoop= compile preprocessFileLineNumbers "axy_AAR\mainLoop.sqf";
};
[] spawn _mainLoop;