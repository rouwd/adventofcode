<cfscript>

	puzzleInput = fileRead( replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "/" ), "" ) & "day1.txt" );
	frequency = 0;

	inputCount = puzzleInput.listLen( chr( 10 ) );

	puzzleInput.listEach( function( e, i, l ){
		if ( left( e, 1 ) == "+" ) {
			frequency += mid( e, 2, e.len() );
		} else {
			frequency -= mid( e, 2, e.len() );
		}

	}, chr( 10 ) );

	writeOutput( frequency );
</cfscript>