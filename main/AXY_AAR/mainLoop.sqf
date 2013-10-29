/*

Main Execution loop for AAR system.

Every 30 seconds, grab the location of the section...

tracking the group leader.

*/

sleep 0.1;

while {true} do
{

  // Update our group Membership...if we're not in contact.
  // We don't do this while in contact, in case people die and the game deletes them from the group...
  // Would be nice to add new members during the contact though.
  if !(axyaar_sectionInContact select 0) then
  {
    axyaar_section= [] call axy_fnc_aarUpdateSection;
    //TODO - Record group membership changes?
  };
  
  // Update positions.
  {
    _x set [2, position (_x select 0)];
	// Store it..  
  } forEach axyaar_section;
  
  // Ensure that all world units are tracked for hits/killed.
  [] call axy_fnc_aarUpdateAllUnits;
  
  // Storing the leader position.
  "AXY_AAR_Extension" callExtension format ["save:[%1,'SectionLocation',%2]", time, position leader player];

  // are we still in contact?
  if (axyaar_sectionInContact select 0) then
  {
    if (((axyaar_sectionInContact select 2)+ axyaar_contactEnds)< time) then
	{
	  // Contact has ended....record it bitches.
	  private ["_sectionStats", "_enemyStats"];
	  _sectionStats= [] call axy_fnc_aarContactSectionStats;
	  _enemyStats= [] call axy_fnc_aarContactEnemyStats;
	  "AXY_AAR_Extension" callExtension "save:# Format of Contact Report is Current Time, Contact Start Time, Contact Duration, SectionShotsFired, SectionWIA, SectionKIA, EnemyWIA, EnemyKIA";
      "AXY_AAR_Extension" callExtension format ["save:[%1,'ContactReport',%2,%3,%4,%5]", time, (axyaar_sectionInContact select 1), (axyaar_sectionInContact select 2)- (axyaar_sectionInContact select 1), _sectionStats, _enemyStats];
	  
	  // Reset Section stats.  Array Item structure is  name, Identity, Position, shots, hit, killed
	  {
	     _x set [3, 0];	// Shots
		 _x set [4, 0];  // Wounded/Hits
		 _x set [5, 0];  // killed  {TODO : Take out someone killed?  So they're not part of the next contact? }
	  } forEach axyaar_section;
	  
	  // Reset the enemy in contact stuff.
	  axyaar_enemyInContact= [];
	  
	  // Reset Contact.
	  axyaar_sectionInContact set [0, false];
	  axyaar_sectionInContact set [1, -0];
	  axyaar_sectionInContact set [2, -0];
    };
  };
  sleep 30;
};

