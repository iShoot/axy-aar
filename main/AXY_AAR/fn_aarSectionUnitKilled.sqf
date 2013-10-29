/*

Keep a record...kinda

Array Item structure is  name, Identity, Position, shots, hit, killed, touched

*/

private ["_unit", "_killed"];

_killed= ((_this select 0) select 0);

// TODO - could also track who did it to include them as a participant in the engagement.

// Only update for someone still in our section.  Old members removed will still have their events running..not sure how to remove..politely.
for [{_unit=0}, {_unit< count axyaar_section}, {_unit=_unit+ 1}] do
{
  if (((axyaar_section select _unit) select 0)== _killed) exitWith
  {
    (axyaar_section select _unit) set [5, ((axyaar_section select _unit) select 5)+ 1];
	// Update our in Contact...
	[] call axy_fnc_aarSectionInContact;
  };
};