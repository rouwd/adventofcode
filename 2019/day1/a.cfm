
<cfscript>

input = listToArray( fileRead( expandPath( "input.txt" ) ), chr(10) );
totalFuel = 0;

for ( line in input ) {

	//writeDump( line );
	//writeDump( line \ 3 );
	totalFuel += ( line \ 3 ) -2;
}

writeDump( totalFuel );

</cfscript>
