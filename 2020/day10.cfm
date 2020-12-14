<cfscript>
	fileName = replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" );
	puzzleInput = fileRead( replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" ) );
//    	puzzleInput = "16
// 10
// 15
// 5
// 1
// 11
// 7
// 19
// 6
// 12
// 4";
// 	puzzleInput = "28
// 33
// 18
// 42
// 31
// 14
// 46
// 20
// 48
// 47
// 24
// 23
// 49
// 45
// 19
// 38
// 39
// 11
// 1
// 32
// 25
// 35
// 8
// 17
// 7
// 9
// 4
// 2
// 34
// 10
// 3";
	//writeDump(puzzleInput);

/* part 1 */
	oneJolt = 0;
	threeJolt = 0;
	sortedAdapters = listToArray( puzzleInput, chr(10) );

	sortedAdapters.sort( "numeric" );
	sortedAdapters.prepend(0);
	sortedAdapters.append(sortedAdapters[-1] + 3);
	writeDump(sortedAdapters);

	for( i=1; i<sortedAdapters.len(); i++ ) {
		if ( sortedAdapters[i+1] - sortedAdapters[i] === 1 ) {
			oneJolt++;
		} else if ( sortedAdapters[i+1] - sortedAdapters[i] === 3 ) {
			threeJolt++;
		}
	}

	writeOutput("oneJolt: " & oneJolt & " threeJolt: " & threeJolt & " oneJolt * threeJolt = " & oneJolt*threeJolt & "<br>");

	// puzzleInput.listEach( function( e, i, l ){
	// 	var element = trim(e);
	// 	if ( buffer.len() < preambleSize ) {
	// 		buffer.append( element );
	// 	} else {
	// 		if ( !findMatch( buffer, element, maxValue, secondToMaxValue ) ) {
	// 			writeOutput( "Answer: " & element & "<br>" );
	// 			writeDump(buffer);
	// 			abort;
	// 		}
	// 		buffer.deleteAt(1);
	// 		buffer.append( element );
	// 	}
	// 	if ( element > maxValue ) {
	// 		secondToMaxValue = maxValue;
	// 		maxValue = element;
	// 		writeOutput( "maxValue: " & maxValue & " secondToMaxValue: " & secondToMaxValue & "<br>" );
	// 	}
	// }, chr( 10 ), true );


/* part 2 */

</cfscript>
