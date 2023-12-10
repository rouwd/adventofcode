<cfscript>
	fileName = replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" );
	puzzleInput = fileRead( replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" ) );
	puzzleInput = "467..114..
	...*......
	..35..633.
	......##...
	617*......
	.....+.58.
	..592.....
	......755.
	...$.*....
	.664.598..";

	try {
	
		numbers = [];
		puzzleInput.listEach( function( e, i, l ){
			e = trimCRLF( e );
			writeOutput( "line" & i & ": " & e & "<br>" );
			getNumbers( e );
		}, chr( 10 ) );
	
		
	} catch( any e ) {
		writedump( e );
	}

	function getNumbers( line ){
		var m = rematch( "\d+", line );
		writeDump( m );
	}

	function trimCRLF( s ){
		var CRLF = chr( 10 ) & "," & chr( 13 );
		return replaceList( s, CRLF, "" )
	}
	
</cfscript>