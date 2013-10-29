/*

Returns stats for the Contact Report on the enemies engaged.

*/


// Are we actually in contact?  TODO

private ["_stats"];

// WIA, KIA
_stats=[0,0];

// Array Item structure is  // format is name, wounded, killed.  Wounded and killed are boolean, not a count.
{
	// Do KIA first... as they may initially have been wounded
	if (_x select 2) then {
		_stats set[1, (_stats select 1)+ 1];
	} else {
		if (_x select 1) then {
			_stats set[0, (_stats select 0)+ 1];
		};
	};
} forEach axyaar_enemyInContact;

// Now return the details.
_stats