/*



GKB_fnc_arrowToMap = compile preprocessFile "functions\GKB_fnc_arrowToMap.sqf";
GKB_fnc_drawToMap = compile preprocessFile "functions\GKB_fnc_drawToMap.sqf";
GKB_fnc_writeToMap = compile preprocessFile "functions\GKB_fnc_writeToMap.sqf";
GKB_fnc_writeToMapFont = compile preprocessFile "functions\GKB_fnc_writeToMapFont.sqf";

*/

fn_drawLine = compile preprocessFileLineNumbers "fn_drawLine.sqf";
fn_r2Dis = compile preprocessFileLineNumbers "fn_R2Dis.sqf";
fn_r2Ang = compile preprocessFileLineNumbers "fn_R2Ang.sqf";
fn_p2R = compile preprocessFileLineNumbers "fn_P2R.sqf";

player createDiarySubject["AARContacts", "Contact Reports"];
