#include "\userconfig\axy_aar\axy_aar_config.hpp"

waituntil {alive player};

"AXY_AAR_Extension" callExtension format ["mission:%1.%2", missionName, worldName];
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
axyaar_contactEnds= AXY_AAR_CONTACT_ENDS;  // defined in axy_aar_config.hpp

// How long do we wait at the end of our main loop before starting again with position updates etc?
axyaar_mainLoopSleep= AXY_AAR_PAUSE_LOOP;

// Should we be tracking the player's position, or the group leaders position?
axyaar_trackLeader= AXY_AAR_TRACK_LEADER;

diag_log format["Contact Ends in: %1", axyaar_contactEnds];
diag_log format["Will be pausing for: %1", axyaar_mainLoopSleep];

// call main program loop.
private ["_mainLoop"];
// *****
_mainLoop= compile preprocessFileLineNumbers "\axy_AAR\mainLoop.sqf";
[] spawn _mainLoop;