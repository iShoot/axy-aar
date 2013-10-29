// get the list of available AARs

private ["_missionsList"];

_missionsList= "AXY_AAR_Extension" callExtension "list:all";
diag_log _missionsList;
if (_missionsList== "nok" ) exitWith {hint "No AAR Missions Found."};
_missionsList= call compile _missionsList;

if (count _missionsList== 0) exitWith {hint "No missions saved."};

{
	player addAction[_x, "loadAAR.sqf", _x];

} forEach _missionsList;
