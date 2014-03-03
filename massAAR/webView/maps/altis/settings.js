
// Coordinates of the Map from 0,0 to....
var mapYMax= 32769;
var mapXMax= 30718;

// All of the Y Coordinates for these are wrong.  I think marty inverted them before setting them?

// All the icons are currently in the master file...should move them.
// TODO - These markers should be just arrays of coordinates of types...and then create these markers on the fly.

// Specific Airfields for Altis.
function loadAirfields(airfield, map)
{
    L.marker(map.unproject([11461.2, 21107.3], map.getMaxZoom()), {icon: iconplaneblack_ca}).bindLabel('AAC Airfield').addTo(airfield);
	L.marker(map.unproject([26939.8, 8025.19], map.getMaxZoom()), {icon: iconplaneblack_ca}).bindLabel('Molos Airfield').addTo(airfield);
	L.marker(map.unproject([14037.6, 16625.7], map.getMaxZoom()), {icon: iconplaneblack_ca}).bindLabel('Altis Airbase').addTo(airfield);
}

// Specific Military spots.
function loadMilitary(military, map)
{
		L.marker(map.unproject([12771.6, 16074.7], map.getMaxZoom()), {icon: bordercrossingred_ca}).bindLabel('Military Base').addTo(military);
		L.marker(map.unproject([15137.2, 15471.2], map.getMaxZoom()), {icon: bordercrossingred_ca}).bindLabel('Military Base').addTo(military);
		L.marker(map.unproject([16030.4, 15764.2], map.getMaxZoom()), {icon: bordercrossingred_ca}).bindLabel('Military Base').addTo(military);
		L.marker(map.unproject([23533.2, 11661], map.getMaxZoom()), {icon: bordercrossingred_ca}).bindLabel('Military Base').addTo(military);
		L.marker(map.unproject([25350.6, 10978.1], map.getMaxZoom()), {icon: bordercrossingred_ca}).bindLabel('Military Base').addTo(military);
}

// Infrastructure...fuel stations etc.
function loadInfrastructure(infrastructure, map)
{
		L.marker(map.unproject([12577.4, 16416.3], map.getMaxZoom()), {icon: xmark_black}).bindLabel('Factory').addTo(infrastructure);
		L.marker(map.unproject([5307.12, 18268.9], map.getMaxZoom()), {icon: xmark_black}).bindLabel('Factory').addTo(infrastructure);
		L.marker(map.unproject([6109.49, 16522.8], map.getMaxZoom()), {icon: xmark_black}).bindLabel('Factory').addTo(infrastructure);
		L.marker(map.unproject([14294.6, 13840.5], map.getMaxZoom()), {icon: xmark_black}).bindLabel('Factory').addTo(infrastructure);
		L.marker(map.unproject([15420.8, 16545.4], map.getMaxZoom()), {icon: powersolar_ca}).bindLabel('Power Plant').addTo(infrastructure);
		L.marker(map.unproject([4163.6, 17721.8], map.getMaxZoom()), {icon: power_ca}).bindLabel('Power Plant').addTo(infrastructure);
		L.marker(map.unproject([25462.6, 12411.3], map.getMaxZoom()), {icon: power_ca}).bindLabel('Power Plant').addTo(infrastructure);
		L.marker(map.unproject([5900.47, 20314.6], map.getMaxZoom()), {icon: xmark_black}).bindLabel('Dump').addTo(infrastructure);
		L.marker(map.unproject([5887.13, 12532.5], map.getMaxZoom()), {icon: xmark_black}).bindLabel('Dump').addTo(infrastructure);
		L.marker(map.unproject([9115.22, 18809.2], map.getMaxZoom()), {icon: xmark_black}).bindLabel('Xirolimni Dam').addTo(infrastructure);
		L.marker(map.unproject([5429.69, 17772.3], map.getMaxZoom()), {icon: xmark_black}).bindLabel('Stadium').addTo(infrastructure);
		L.marker(map.unproject([18435.1, 18467.2], map.getMaxZoom()), {icon: xmark_black}).bindLabel('Mine').addTo(infrastructure);
		L.marker(map.unproject([17060.5, 21429.9], map.getMaxZoom()), {icon: xmark_black}).bindLabel('Quarry').addTo(infrastructure);
		L.marker(map.unproject([4379.15, 20174.6], map.getMaxZoom()), {icon: xmark_black}).bindLabel('Quarry').addTo(infrastructure);
		L.marker(map.unproject([19566.4, 17151.7], map.getMaxZoom()), {icon: xmark_black}).bindLabel('Quarry').addTo(infrastructure);
		L.marker(map.unproject([14522.4, 15935.1], map.getMaxZoom()), {icon: xmark_black}).bindLabel('Terminal').addTo(infrastructure);
		L.marker(map.unproject([18260.6, 17217.8], map.getMaxZoom()), {icon: xmark_black}).bindLabel('Storage').addTo(infrastructure);

		// servos - manual

		L.marker(map.unproject([5770, 12701], map.getMaxZoom()), {icon: fuelstation_ca}).bindLabel('Gas Station').addTo(infrastructure);
		L.marker(map.unproject([6794, 17202], map.getMaxZoom()), {icon: fuelstation_ca}).bindLabel('Gas Station').addTo(infrastructure);
		L.marker(map.unproject([6191, 17687], map.getMaxZoom()), {icon: fuelstation_ca}).bindLabel('Gas Station').addTo(infrastructure);
		L.marker(map.unproject([5021, 18336], map.getMaxZoom()), {icon: fuelstation_ca}).bindLabel('Gas Station').addTo(infrastructure);
		L.marker(map.unproject([3760, 19288], map.getMaxZoom()), {icon: fuelstation_ca}).bindLabel('Gas Station').addTo(infrastructure);
		L.marker(map.unproject([4013, 20187], map.getMaxZoom()), {icon: fuelstation_ca}).bindLabel('Gas Station').addTo(infrastructure);
		L.marker(map.unproject([9027, 17045], map.getMaxZoom()), {icon: fuelstation_ca}).bindLabel('Gas Station').addTo(infrastructure);
		L.marker(map.unproject([12028, 16943], map.getMaxZoom()), {icon: fuelstation_ca}).bindLabel('Gas Station').addTo(infrastructure);
		L.marker(map.unproject([14173, 16235], map.getMaxZoom()), {icon: fuelstation_ca}).bindLabel('Gas Station').addTo(infrastructure);
		L.marker(map.unproject([15300, 15199], map.getMaxZoom()), {icon: fuelstation_ca}).bindLabel('Gas Station').addTo(infrastructure);
		L.marker(map.unproject([15795, 15311], map.getMaxZoom()), {icon: fuelstation_ca}).bindLabel('Gas Station').addTo(infrastructure);
		L.marker(map.unproject([16865, 17300], map.getMaxZoom()), {icon: fuelstation_ca}).bindLabel('Gas Station').addTo(infrastructure);
		L.marker(map.unproject([17418, 18834], map.getMaxZoom()), {icon: fuelstation_ca}).bindLabel('Gas Station').addTo(infrastructure);
		L.marker(map.unproject([21230, 25661], map.getMaxZoom()), {icon: fuelstation_ca}).bindLabel('Gas Station').addTo(infrastructure);
		L.marker(map.unproject([19962, 21328], map.getMaxZoom()), {icon: fuelstation_ca}).bindLabel('Gas Station').addTo(infrastructure);
		L.marker(map.unproject([20771, 16106], map.getMaxZoom()), {icon: fuelstation_ca}).bindLabel('Gas Station').addTo(infrastructure);
		L.marker(map.unproject([23365, 12964], map.getMaxZoom()), {icon: fuelstation_ca}).bindLabel('Gas Station').addTo(infrastructure);
		L.marker(map.unproject([25682, 11376], map.getMaxZoom()), {icon: fuelstation_ca}).bindLabel('Gas Station').addTo(infrastructure);
		L.marker(map.unproject([14231, 14465], map.getMaxZoom()), {icon: fuelstation_ca}).bindLabel('Gas Station').addTo(infrastructure);
		L.marker(map.unproject([8489, 14507], map.getMaxZoom()), {icon: fuelstation_ca}).bindLabel('Gas Station').addTo(infrastructure);
		L.marker(map.unproject([9207, 20661], map.getMaxZoom()), {icon: fuelstation_ca}).bindLabel('Gas Station').addTo(infrastructure);
		L.marker(map.unproject([16754, 20259], map.getMaxZoom()), {icon: fuelstation_ca}).bindLabel('Gas Station').addTo(infrastructure);
}

function loadPeaks(peaks, map)
{
    L.marker(map.unproject([9187.74, 21266.5], map.getMaxZoom()), {icon: hill_ca}).bindLabel('Riga').addTo(peaks);
    L.marker(map.unproject([9186.34, 24380.6], map.getMaxZoom()), {icon: hill_ca}).bindLabel('Agela').addTo(peaks);
    L.marker(map.unproject([11669, 25189.1], map.getMaxZoom()), {icon: hill_ca}).bindLabel('Skopos').addTo(peaks);
    L.marker(map.unproject([10729.8, 25153.3], map.getMaxZoom()), {icon: hill_ca}).bindLabel('Hill 243').addTo(peaks);
    L.marker(map.unproject([7883.58, 18142.6], map.getMaxZoom()), {icon: hill_ca}).bindLabel('Agia Stemma').addTo(peaks);
    L.marker(map.unproject([7048.1, 18698.6], map.getMaxZoom()), {icon: hill_ca}).bindLabel('Hill 224').addTo(peaks);
    L.marker(map.unproject([16536, 21981.8], map.getMaxZoom()), {icon: hill_ca}).bindLabel('Hill 110').addTo(peaks);
    L.marker(map.unproject([6405.69, 20403.4], map.getMaxZoom()), {icon: hill_ca}).bindLabel('Hill 234').addTo(peaks);
    L.marker(map.unproject([5588.86, 21019.3], map.getMaxZoom()), {icon: hill_ca}).bindLabel('Tafos').addTo(peaks);
    L.marker(map.unproject([7859.98, 16095.4], map.getMaxZoom()), {icon: hill_ca}).bindLabel('Amoni').addTo(peaks);
    L.marker(map.unproject([5320.31, 22453], map.getMaxZoom()), {icon: hill_ca}).bindLabel('Hill 129').addTo(peaks);
    L.marker(map.unproject([17768.9, 22854.6], map.getMaxZoom()), {icon: hill_ca}).bindLabel('Didymos').addTo(peaks);
    L.marker(map.unproject([7846.96, 14763.6], map.getMaxZoom()), {icon: hill_ca}).bindLabel('Agios Minas').addTo(peaks);
    L.marker(map.unproject([4188.99, 22014.1], map.getMaxZoom()), {icon: hill_ca}).bindLabel('Hill 166').addTo(peaks);
    L.marker(map.unproject([18832.1, 22547], map.getMaxZoom()), {icon: hill_ca}).bindLabel('Hill 216').addTo(peaks);
    L.marker(map.unproject([4564.72, 17375.8], map.getMaxZoom()), {icon: hill_ca}).bindLabel('Magos').addTo(peaks);
    L.marker(map.unproject([9127.1, 13497.3], map.getMaxZoom()), {icon: hill_ca}).bindLabel('Pyrsos').addTo(peaks);
    L.marker(map.unproject([10748.9, 12368], map.getMaxZoom()), {icon: hill_ca}).bindLabel('Hill 213').addTo(peaks);
    L.marker(map.unproject([4808.18, 15074.7], map.getMaxZoom()), {icon: hill_ca}).bindLabel('Kira').addTo(peaks);
    L.marker(map.unproject([4162.73, 13313.5], map.getMaxZoom()), {icon: hill_ca}).bindLabel('Hill 312').addTo(peaks);
    L.marker(map.unproject([14574.4, 10774.2], map.getMaxZoom()), {icon: hill_ca}).bindLabel('Hill 115').addTo(peaks);
    L.marker(map.unproject([6513.79, 11164.3], map.getMaxZoom()), {icon: hill_ca}).bindLabel('Synneforos').addTo(peaks);
    L.marker(map.unproject([4919.32, 10817.3], map.getMaxZoom()), {icon: hill_ca}).bindLabel('Thronos').addTo(peaks);
    L.marker(map.unproject([24833.9, 10966.9], map.getMaxZoom()), {icon: hill_ca}).bindLabel('Skiptro').addTo(peaks);
    L.marker(map.unproject([23682.9, 8529.74], map.getMaxZoom()), {icon: hill_ca}).bindLabel('Agios Andreas').addTo(peaks);
}

function loadReligiousMarkers(religious, map)
{
		L.marker(map.unproject([4146, 15827], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([4749, 16584], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([3954, 18913], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([3651, 19441], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([3295, 19602], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([3683, 19987], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([3013, 20240], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([3887, 20768], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([4162, 20947], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([3590, 22076], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([5048, 21536], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([7630, 21560], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([9173, 20753], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([10650, 20460], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([8924, 25276], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([10974, 19137], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([12700, 18519], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([12383, 18169], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([13011, 17679], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([12379, 17123], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([9497, 16864], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([4551, 11275], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([7170, 16390], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([8643, 14400], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([9404, 12544], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([10301, 13603], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([14594, 15102], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([14059, 14132], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([14601, 11989], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([16030, 11497], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([16706, 12299], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([17947, 14569], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([17997, 15093], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([16111, 15372], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([16539, 15585], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([16666, 16643], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([16870, 16567], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([18128, 17592], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([17895, 17723], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([16824, 20104], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([18876, 16110], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([19448, 19607], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([21666, 25202], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([20251, 21222], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([20373, 21057], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([23982, 17321], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([20888, 15872], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([20321, 14104], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([25692, 11449], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([26993, 9494], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([26196, 8587], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);
		L.marker(map.unproject([21353, 16360], map.getMaxZoom()), {icon: church_ca}).bindLabel('Church').addTo(religious);

		L.marker(map.unproject([4260, 16975], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([3415, 18628], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([3977, 20135], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([3900, 20757], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([4113, 21417], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([5195, 21832], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([5369, 21882], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([10090, 21423], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([10954, 20742], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([8532, 25443], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([9307, 19321], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([12841, 17943], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([12773, 17591], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([13003, 17508], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([9669, 16922], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([7855, 14751], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([8129, 15475], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([10460, 15560], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([9340, 11933], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([9295, 11449], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([7962, 11459], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([9450, 9650], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([10038, 11443], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([10053, 13039], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([14436, 14102], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([12840, 13149], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([11842, 11940], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([11543, 11950], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([11646, 11232], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([14331, 10940], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([13908, 11891], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([14753, 11901], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([15171, 11853], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([14428, 12484], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([14415, 13473], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([15031, 10005], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([15525, 11119], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([15563, 12267], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([17449, 13884], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([15954, 16562], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([17947, 17567], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([17745, 17608], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([17728, 17769], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([18341, 17964], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([18210, 18942], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([17463, 18429], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([17325, 20169], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([17192, 21008], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([15566, 21349], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([18801, 16003], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([18871, 15913], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([18791, 16574], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([19329, 19455], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([19297, 19748], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([18790, 20005], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([18508, 20624], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([16374, 22666], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([17624, 22254], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([17270, 22692], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([20675, 23896], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([21214, 23946], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([22158, 24826], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([21597, 24156], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([21774, 25347], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([19695, 25536], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([18607, 26011], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([19795, 26656], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([18519, 26514], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([22282, 27662], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([20720, 26175], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([22719, 25861], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([22018, 24127], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([21403, 23411], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([19347, 21435], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([19502, 20659], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([21160, 19764], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([21614, 19511], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([20537, 19193], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([20519, 18667], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([21724, 18675], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([19998, 17879], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([20613, 17221], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([21558, 17328], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([21984, 17343], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([22446, 17295], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([20092, 15768], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([20639, 15526], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([21061, 15887], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([21521, 15555], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([21223, 15240], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([22501, 15749], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([21554, 14404], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([20784, 14306], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([19376, 15143], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([21886, 13387], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([21963, 13754], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([22609, 12937], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([23194, 12777], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([23941, 12570], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([23414, 12168], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([21840, 11374], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([22420, 10844], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([23211, 10902], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([24213, 10131], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([23350, 8582], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([25655, 9888], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([25279, 10799], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([24771, 12177], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([25142, 11871], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([25783, 11664], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([26764, 11411], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([27117, 11385], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([26905, 11022], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([26115, 10967], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([27180, 9546], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([25994, 9291], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([27044, 8571], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([28063, 7559], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([24378, 11752], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([24602, 11581], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([21364, 15004], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
		L.marker(map.unproject([13336, 12589], map.getMaxZoom()), {icon: chapel_ca}).bindLabel('Chapel').addTo(religious);
}
