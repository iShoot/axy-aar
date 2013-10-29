/*

Makes sure that all units in the world are being tracked for killed/hit...
So we can determine if our section was engaged with them.

*/

// TODO - track civilians.

{
	// Only bother adding event if they're not a civ and not part of the same side as the player.
	if (!(_x getVariable ["axyaar_unittracked", false]) and (side (group _x)!=side (group player)) and (side (group _x)!=Civilian)) then
    {
		// Confirm that it's not a unit from our squad - but then we can't track friendlies?
		_x addMPEventHandler["MPHit", {[_this] spawn axy_fnc_aarEnemyUnitsHit;}];
		_x addMPEventHandler["MPKilled", {[_this] spawn axy_fnc_aarEnemyUnitsKilled;}]; 
		_x setVariable ["axyaar_unittracked", true];
		
		// TODO - We could track each position too...if we really really really want to.
		
		
	};	

} forEach allUnits;

true