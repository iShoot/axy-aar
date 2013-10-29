/*

Keep a record...kinda

Array Item structure is  name, Identity, Position, shots, hit, killed

*/

private ["_unit", "_firer", "_weapon"];

_firer= ((_this select 0) select 0);
_weapon= ((_this select 1) select 1);

// Only update for someone still in our section.  Old members removed will still have their events running..not sure how to remove..politely.
for [{_unit=0}, {_unit< count axyaar_section}, {_unit=_unit+ 1}] do
{
  if (((axyaar_section select _unit) select 0)== _firer) exitWith
  {
    (axyaar_section select _unit) set [3, ((axyaar_section select _unit) select 3)+ 1];
	// Update our in Contact...
	[] call axy_fnc_aarSectionInContact;
	// Don't actually return anything.
  };
};