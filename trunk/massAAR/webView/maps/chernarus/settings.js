
// Coordinates of the Map from 0,0 to 256,256 equiv...
var mapYMax= 16384;   // 
var mapXMax= 16453;   // 
var mapMaxZoom= 6;		// maximum zoom for tiles.
var mapName= "chernarus";

// All of the Y Coordinates for these are wrong.  I think marty inverted them before setting them?

// All the icons are currently in the master file...should move them.
// TODO - These markers should be just arrays of coordinates of types...and then create these markers on the fly.

// Specific Airfields for Altis.
function loadAirfields(airfield, map)
{
    //L.marker(map.unproject([11461.2, 21107.3], map.getMaxZoom()), {icon: iconplaneblack_ca}).bindLabel('AAC Airfield').addTo(airfield);
}

// Specific Military spots.
function loadMilitary(military, map)
{
//		L.marker(map.unproject([12771.6, 16074.7], map.getMaxZoom()), {icon: bordercrossingred_ca}).bindLabel('Military Base').addTo(military);
}

// Infrastructure...fuel stations etc.
function loadInfrastructure(infrastructure, map)
{
//		L.marker(map.unproject([12577.4, 16416.3], map.getMaxZoom()), {icon: xmark_black}).bindLabel('Factory').addTo(infrastructure);
}

function loadPeaks(peaks, map)
{
//    L.marker(map.unproject([9187.74, 21266.5], map.getMaxZoom()), {icon: hill_ca}).bindLabel('Riga').addTo(peaks);
    
}

function loadReligiousMarkers(religious, map)
{
		//L.marker(map.unproject([4146, 15827], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
}
