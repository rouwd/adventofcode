
<cfscript>

input = listToArray( fileRead( expandPath( "input.txt" ) ), chr(10) );
totalFuel = 0;

// input = [ 1969 ];
// input = [ 100756 ];

for ( line in input ) {

	fuelToAdd = getFuel( line );
	totalFuel += fuelToAdd;

}

writeDump( "total fuel: " & totalFuel );

function getFuel( currentFuel ){
	var newFuel = ( currentFuel \ 3 ) - 2;
	var totalFuel = 0;

	if ( newFuel > 0 ) {
		totalFuel += newFuel + getFuel( newFuel );
	}
	//writeDump( newFuel );
	//writeDump( currentFuel );
	//writeDump( totalFuel );
	return totalFuel;
}

</cfscript>
