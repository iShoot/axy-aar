/*

Update the unit's hit counter.

*/

private ["_unit", "_hits"];
_unit= ((_this select 0) select 0);

_hits= (_unit getVariable["axymassaar_hitCount", 0])+ 1;
_unit setVariable["axymassaar_hitCount", _hits];