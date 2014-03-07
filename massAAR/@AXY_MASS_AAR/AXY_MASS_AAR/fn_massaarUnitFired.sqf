/*

Update the unit's shot counter.

*/

private ["_unit", "_shots"];
_unit= ((_this select 0) select 0);
_bullet= ((_this select 0) select 6);

_shots= (_unit getVariable["axymassaar_shotCount", 0])+ 1;
_unit setVariable["axymassaar_shotCount", _shots];
_unit setVariable["axymassaar_shotdir", (direction _bullet)];  // TODO - Average or at least a range between min/max.