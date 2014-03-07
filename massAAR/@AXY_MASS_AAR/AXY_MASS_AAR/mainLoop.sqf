/*

Main Execution loop for MASS AAR system.

Every 10 seconds, grab the location of the section...

tracking the group leader.

*/

private ["_sectionLeader"];

_sectionLeader= "";

// Start of our main loop
while {true} do
{

	// Only log when player count is greater than 2.
	if (count playableUnits> 2) then
	{
	
		private ["_missionTime"];
		_missionTime= time;
		
		// We could track hits/fired during the loop.
		
		// Grab everyone's locations, based on their groups?
		{
			private ["_unitDetail"];
			
			// Does the unit have variables for hit/shot?  Being tracked?
			if !(_x getVariable["axymassaar_tracked", false]) then
			{
				_x setVariable["axymassaar_tracked", true];
				_x setVariable["axymassaar_shotCount", 0];
				_x setVariable["axymassaar_hitCount", 0];
				_x setVariable["axymassaar_shotdir", 0];
				
				_x addEventHandler["Fired", {[_this] spawn axy_fnc_massaarUnitFired;}];
				_x addMPEventHandler["MPHit", {[_this] spawn axy_fnc_massaarUnitHit;}];
			};
			
			if !(vehicle _x== _x) then
			{
				_unitDetail= [name _x, netId _x, position _x, groupID (group _x), true, damage _x, side _x, assignedTeam _x ,_x getVariable "axymassaar_shotCount", _x getVariable "axymassaar_hitCount", _x getVariable "axymassaar_shotdir"];
			} else
			{
				_unitDetail= [name _x, netId _x, position _x, groupID (group _x), false, damage _x, side _x, assignedTeam _x, _x getVariable "axymassaar_shotCount", _x getVariable "axymassaar_hitCount", _x getVariable "axymassaar_shotdir"];
			};
			"AXY_MASS_AAR" callExtension format["save:[%1,'unitpos',%2]", _missionTime, _unitDetail];  // Just text...
			// Reset the hit stats.
			_x setVariable["axymassaar_shotCount", 0];
			_x setVariable["axymassaar_hitCount", 0];
			_x setVariable["axymassaar_shotdir", 0];
		} forEach allUnits;
		
		// Grab all dead units.
		{
			private ["_unitDetail"];
			_unitDetail= [name _x, netId _x, position _x, groupID (group _x), false, 1, side (group _x), assignedTeam _x];
			"AXY_MASS_AAR" callExtension format["save:[%1,'deadunitpos',%2]", _missionTime, _unitDetail];  // Just text...
		} forEach allDead;
		
		// Grab all vehicles.
		{
			private ["_vehicleDetail"];
			_vehicleDetail= [configName(inheritsFrom(configFile >> "CfgVehicles" >> typeOf _x)), netId _x, position _x, '', damage _x, side _x];
			"AXY_MASS_AAR" callExtension format["save:[%1,'vehiclepos',%2]", _missionTime, _vehicleDetail];  // Just text...
		} forEach vehicles;
		
	};	// End of playerCount needing to be 2 or more.
	
  
	// Now let's just wait...
	sleep axymassaar_mainLoopSleep;			
};

