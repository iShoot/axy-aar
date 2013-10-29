#include "\userconfig\axy_aar\axy_aar_config.hpp"

// Loads up the aar data...

private ["_aarMission", "_aarLine", "_keepLoading"];

_aarMission= _this select 3;

hint format ["Loading %1", _aarMission];

"AXY_AAR_Extension" callExtension format ["mission:%1", _aarMission];

_aarLine= "AXY_AAR_Extension" callExtension "load:";

if ((_aarLine=="nok") or (_aarLine=="end")) exitWith
{
	hint "AAR is empty";
};


_keepLoading= true;
_aarLine= call compile _aarLine;

private ["_lastPos", "_firstPos", "_inContact"];

_lastPos= [0,0,0];
_firstPos= true;
_inContact= False;

while {(_keepLoading)} do
{
	switch (_aarLine select 1) do
	{
		case "SectionLocation":
		{
			if !(_firstPos) then
			{
				// are we too far away from the prior position update?
				if (_lastPos distance (_aarLine select 2)< AXY_AAR_aarShow_DISTANCE_IGNORE) then
				{
					if (_inContact) then
					{
						nul=[_lastPos, (_aarLine select 2), "colorRED", AXY_AAR_aarShow_LINE_THICKNESS, 1] call fn_drawLine;
						// Draw a marker here too?
					} else {
						nul=[_lastPos, (_aarLine select 2), "colorGREEN", AXY_AAR_aarShow_LINE_THICKNESS, 1] call fn_drawLine;
					};
				};
				sleep 0.01;
			} else 
			{
				_firstPos= False;
			};
			_lastPos= (_aarLine select 2);
		
		
		};  // end of case SectionLocation.
		case "InContact":
		{
			_inContact= true;
		};
		case "SectionLeader":
		{
			player createDiaryRecord["AARContacts", [format["+%1 New Section Leader", (_aarLine select 0)],format["Section Leader now %1.", (_aarLine select 2)]]];
		
		};
		case "ContactReport":
		{
			private ["_enemyBit", "_sectionBit", "_contactMarker", "_markerLink"];
			_enemyBit= format["<font size=20>Enemy Stats</font><br />Enemy KIA: %1<br/>Enemy WIA: %2<br/>", ((_aarLine select 5) select 1), ((_aarLine select 5) select 0)];
			_sectionBit= format["<font size=20>Section Stats</font><br />Section Shots Fired: %1<br />KIA: %2<br />WIA: %3<br />", ((_aarLine select 4) select 0), ((_aarLine select 4) select 2), ((_aarLine select 4) select 1)];
			
			// Create the marker for the location
			_contactMarker= createMarker[format["m%1", (_aarLine select 2)], _lastPos];
			_contactMarker setMarkerShape "ICON";
			_contactMarker setMarkerType "Empty";
			_contactMarker setMarkerColor "ColorRed";
			
			_markerLink= format["Contact Location: %1<br /><marker name=""%2"">Clickable Link</marker>", _lastPos, format["m%1", (_aarLine select 2)]];
			
			player createDiaryRecord["AARContacts", [format["+%1", (_aarLine select 2)], format["Contact Duration: %1<br/><br/>%2<br />%3<br />%4", (_aarLine select 3), _enemyBit, _sectionBit, _markerLink]]];
			_inContact= False;
		
		};
		
	
	};  // End of the switch
	_aarLine= "AXY_AAR_Extension" callExtension "load:";
	if (_aarLine=="end" or _aarLine=="") then
	{
		_keepLoading= false;
	} else 
	{
		_aarLine= call compile _aarLine;
	};
	
};  // end of while statement

hint "AAR Loaded, check your map and briefing entries.  Taking you to last position.";
openMap true;
mapAnimAdd [0.1, 0.05, _lastPos];
mapAnimCommit;

