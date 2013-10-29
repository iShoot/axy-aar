
waituntil {alive player};

//sleep 0.1;

"AXY_AAR_Extension" callExtension format ["mission:%1", missionName];
"AXY_AAR_Extension" callExtension "clear:all";

// Contains the list of members in our group/section.
axyaar_section= [];

// if we're in contact, is True, time we started and last update.
axyaar_sectionInContact= [false, 0, 0]; 

// while we're in contact, track enemy participation.
// format is name, wounded, killed.
// This should be cleared at the end of each contact.
axyaar_enemyInContact= [];

// How long after the last action do we consider a contact over?
axyaar_contactEnds= 30;  // Currently 30 secs.

// call main program loop.
private ["_mainLoop"];
_mainLoop= compile preprocessFileLineNumbers "\axy_AAR\mainLoop.sqf";
[] spawn _mainLoop;