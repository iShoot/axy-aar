/*

Triggered by every enemy unit in the world.

We want to check to see if one of our section was the killer..if so, record that as a WIA for the contact report.

Multiple kills on the same object should only count as one kia. Hmrm?
*/

// Only do this if we're in contact already.
if (axyaar_sectionInContact select 0) then
{
  private ["_killedBy", "_killed", "_sectionUnit"];

  _killed= ((_this select 0) select 0);
  _killedBy= ((_this select 0) select 1);
  

  for [{_sectionUnit=0}, {_sectionUnit< count axyaar_section}, {_sectionUnit=_sectionUnit+ 1}] do
  {
    if (((axyaar_section select _sectionUnit) select 0)== _killedBy) exitWith
    {
	
      // They were killed by one of our section...
      // Are they already in the axyaar_enemyInContact array?
	  // Who the fuck knows, so this will sort that out.
	  [_killed, true] call axy_fnc_aarEnemyHitInContact;
    };
  };

};  // end of if we're in contact.

true