<cfscript>

	puzzleInput = fileRead( replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "/" ), "" ) & "day1.txt" );
	frequency = 0;
	knownFrequencies = {};
	found = false;

	inputCount = puzzleInput.listLen( chr( 10 ) );

	while ( !found ) {
		puzzleInput.listEach( function( e, i, l ){
			if ( !found ) {
				if ( left( e, 1 ) == "+" ) {
					frequency += mid( e, 2, e.len() );
				} else {
					frequency -= mid( e, 2, e.len() );
				}

				if ( knownFrequencies.keyExists( frequency ) ) {
					writeOutput( frequency & "<br>" );
					found = true;
					return found;
				} else {
					knownFrequencies[ frequency ] = 1;
				}
			}

		}, chr( 10 ) );
	}

</cfscript>