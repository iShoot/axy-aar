/*

Returns stats for the Contact Report on the section.

*/


// Are we actually in contact?  TODO

private ["_stats", "_members"];

// Shots fired, WIA, KIA, Array of Members
_stats= [0,0,0,[]];
_members= [];

// Array Item structure is  name, Identity, Position, shots, hit, killed
{
	_stats set [0, (_stats select 0)+ (_x select 3)];
	// Do KIA first... as they may initially have been wounded
	if ((_x select 5)> 0) then {
		_stats set [2, (_stats select 2)+ 1];
	} else {
		if ((_x select 4)> 0) then {
			_stats set [1, (_stats select 1)+ 1];
		};
	};
	// Grab the section member.
	_members set [count _members, _x select 1];
} forEach axyaar_section;

// Add the members as the 4th array element.
_stats set [3, _members];

// Now return the details.
_stats