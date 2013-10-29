/*

Updates our array of members of our own section..

Array Item structure is  name, Identity, Position, shots, hit, killed, touched

*/

private ["_newSection"];
_newSection= [];

{
  private ["_newPlayer"];
 
  _newPlayer= [_x, name _x, position _x, 0, 0, 0, false];
  
  // set up events, if this is a new member.
  if !(_x getVariable ["axyaar_eventstracked", false]) then
  {
    _x addEventHandler ["Fired", {[_this] spawn axy_fnc_aarSectionUnitFired;}];
    _x addMPEventHandler ["MPHit", {[_this] spawn axy_fnc_aarSectionUnitHit;}];
	_x addMPEventHandler ["MPKilled", {[_this] spawn axy_fnc_aarSectionUnitKilled;}];
	_x setVariable ["axyaar_eventstracked", true];
	// Set the touched to true...so we know it's a new member.
	_newPlayer set [6, true];
  };
  
  // add to array.
  _newSection set [count _newSection, _newPlayer];   
  
} foreach units group player;

// TODO -  is there anyone in the old group who's not in the new one?  use Touched for this detection.

_newSection