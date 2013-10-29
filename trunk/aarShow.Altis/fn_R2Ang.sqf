/*RECTANGULAR TO ANGLE FUNCTION
  By Twirl(NZ-2005)

  Returns angle for given rectangular coords (x,y). Example:
     [x,y] call r2ang    OR    [45,45] call r2ang
*/

private ["_ang","_dis","_dx","_dy"];

_dx = _this select 0;
_dy = _this select 1;

_ang = _dx atan2 _dy;
if (_ang < 0) then {_ang = _ang + 360};

_ang