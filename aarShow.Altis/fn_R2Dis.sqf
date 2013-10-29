/*RECTANGULAR TO DISTANCE FUNCTION
  By Twirl(NZ-2005)

  Returns distance for given rectangular coords (x,y). Example:
     [x,y] call r2dis    OR    [45,45] call r2dis
*/

private ["_ang","_dis","_dx","_dy"];

_dx = _this select 0;
_dy = _this select 1;

_dis = sqrt(_dx^2+_dy^2);

_dis