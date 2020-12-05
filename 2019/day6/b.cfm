
<cfscript>
try{
input = listToArray( fileRead( expandPath( "input.txt" ) ), chr(10) & chr(13) );
map = {};

/*

*/

// input =[ "COM)B","B)C","C)D","D)E","E)F","B)G","G)H","D)I","E)J","J)K","K)L","K)YOU","I)SAN"];


// writeDump(input);
// abort;

for ( line in input ) {
	populate( map, line );
}
// totalOrbits = countOrbits( map );
// writeDump(totalOrbits);

youParents = listParents( map, "YOU" );
writeDump( youParents );
sanParents = listParents( map, "SAN" );
writeDump( sanParents );
orbitChangeCount = countOrbitChanges( youParents, sanParents );
writeDump( orbitChangeCount );
// writeDump(map);

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
	map[ last ].parent = first;

}

function newItem() {
	return {
		satellites: [],
		parent: ""
	}
}

function listParents( map, mapItem ) {
	var thisItem = map[ mapItem ];
	var thisItemParents = [];

	if ( thisItem.parent.len() > 0 ) {
		thisItemParents.append( thisItem.parent );
		thisItemParents.append( listParents( map, thisItem.parent ), true );
	}

	return thisItemParents;
}

function countOrbitChanges( you, san ) {
	var youIndex = 2;
	var sanPos = san.find( you[youIndex] );
	var orbits = [];
	//writeDump(you[youIndex]);
	// writeDump(sanPos);
	while( sanPos == 0 ) {
		orbits.push( you[youIndex] );
		youIndex++;
		sanPos = san.find( you[youIndex] );
	}
	// writeDump( sanPos );
	// writeDump(orbits);
	return orbits.len() + sanPos;
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
