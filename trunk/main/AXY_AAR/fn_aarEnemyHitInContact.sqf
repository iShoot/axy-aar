/*

Records that an enemy has been either wounded or killed.

parameters:
Unit
True/False if killed or just wounded.

Search the axyaar_enemyInContact array...
Format for axyaar_enemyInContact is name, wounded, killed.

*/

private ["_hit", "_killed", "_loopUnits", "_foundUnit"];

_hit= _this select 0;
_killed= _this select 1;
_foundUnit= false;

{
  if (_x select 0==_hit) exitWith
  {
    if (_killed) then 
	{ 
	  // set wounded to false, killed to true.
	  _x set [1, false];	  
	  _x set [2, true];
	} else {
	  _x set [1, true];
	};
	
	_foundUnit= true;
  };	
} forEach axyaar_enemyInContact;

// Did we find a unit?
if !(_foundUnit) then
{
  // Create a new record!
  private ["_newEnemyUnit"];
  if (_killed) then
  {
    _newEnemyUnit= [_hit, false, true];
  } else 
  {
    _newEnemyUnit= [_hit, true, false]; 
  };
  
  axyaar_enemyInContact set [count axyaar_enemyInContact, _newEnemyUnit];
};

// Done
true
