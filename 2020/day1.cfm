<cfscript>
	fileName = replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" );
	puzzleInput = fileRead( replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" ) );
// 	puzzleInput = "1721
// 979
// 366
// 299
// 675
// 1456";

	product = 0;
	priorNumbers = [];

	puzzleInput.listEach( function( e, i, l ){
		for ( number in priorNumbers ) {
			for ( anotherNumber in priorNumbers ) {
				if ( anotherNumber + number + e == 2020 ) {
					writeOutput( "answer: " & anotherNumber & " * "  & number & " * " & e & " = " & anotherNumber * number * e );
					abort;
				}				
			}
		}
		priorNumbers.append(e);

	}, chr( 10 ) );

	writeOutput( product );
</cfscript>