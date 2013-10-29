/*

*/

private ["_pos1","_pos2","_colr","_width","_deltax","_deltay","_dis","_ang","_cen",
		 "_newx","_newy","_mkr","_m"];

_pos1 = _this select 0;
_pos2 = _this select 1;
_colr = _this select 2;
_width = _this select 3;
_alpha = _this select 4;

_deltax = (_pos2 select 0) - (_pos1 select 0);
_deltay = (_pos2 select 1) - (_pos1 select 1);

_dis = [_deltax, _deltay] call fn_r2dis;
_ang = [_deltax, _deltay] call fn_r2ang;

//_cen = [];
_cen = [(_dis/2),_ang] call fn_p2r;

_newx = (_pos1 select 0) + (_cen select 0);
_newy = (_pos1 select 1) + (_cen select 1);

//draw the line
_mkr = format ["mkrLine_%1",diag_ticktime];

_m = createMarkerLocal [_mkr, [_newx,_newy]];
_mkr setMarkerColorLocal _colr;
_mkr setMarkerShapeLocal "RECTANGLE";
_mkr setMarkerBrushLocal "SOLID";
_mkr setMarkerAlphaLocal _alpha;
_mkr setMarkerSizeLocal [_width, _dis/2];
_mkr setMarkerDirLocal _ang;

_mkr





