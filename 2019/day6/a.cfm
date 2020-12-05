
<cfscript>
try{
input = listToArray( fileRead( expandPath( "input.txt" ) ), chr(10) & chr(13) );
map = {};

/*

*/

// input =[ "COM)B","B)C","C)D","D)E","E)F","B)G","G)H","D)I","E)J","J)K","K)L"];


// writeDump(input);
// abort;

for ( line in input ) {
	populate( map, line );
}
totalOrbits = countOrbits( map );
writeDump(totalOrbits);
writeDump(map);

function populate( map, item ) {
	var first = listFirst( item, ")" );
	var last = listLast( item, ")" );
	// writeOutput( "first :" & first & ": last :" & last & ":<br>" );
	// abort;

	if ( !map.keyExists( first ) ) {
		map[ first ] = newItem();
	}

	if ( !map.keyExists( last ) ) {
		map[ last ] = newItem();
	}

	map[ first ].satellites.push( last );
}

function newItem() {
	return {
		satellites: []
	}
}

function countOrbits( map ) {
	return countItemOrbits( map, "COM", 0 );
}

function countItemOrbits( map, mapItem, orbitCount ) {
	// writeDump(mapItem);
	var thisItem = map[ mapItem ];
	var count = orbitCount;
	for ( var satellite in thisItem.satellites ) {
		count = count + countItemOrbits( map, satellite, orbitCount + 1 );
	}
	// writeOutput( "item: " & mapItem & " orbits " & orbitCount & " items. Total orbits: " & count & "<br>" );
	return count;
}
} catch ( any e ) {
	writeDump(e);
}
</cfscript>
