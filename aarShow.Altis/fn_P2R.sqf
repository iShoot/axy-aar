/*POLAR TO RECTANGULAR FUNCTION
  By Twirl(NZ-2005)

  Returns a set of rectangular coords (x,y) for given polar coords (angle,distance). Example:
     [distance,direction] call p2r    OR    [100,45] call p2r
     returns array [x,y]
*/

private ["_ang","_dis","_dx","_dy","_rect"];

_dis = _this select 0;
_ang = _this select 1;

_dx = sin(_ang)*_dis;
_dy = cos(_ang)*_dis;

_rect = [_dx,_dy];
_rect