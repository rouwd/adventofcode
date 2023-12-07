<cfscript>
	fileName = replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" );
	puzzleInput = fileRead( replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" ) );
	puzzleInput = "467..114..
	...*......
	..35..633.
	......#...
	617*......
	.....+.58.
	..592.....
	......755.
	...$.*....
	.664.598..";

	try {
	
		puzzleInput.listEach( function( e, i, l ){
			var max = getMax();
			e = trimCRLF( e );
			
		}, chr( 10 ) );
	
		
	} catch( any e ) {
		writedump( e );
	}
	
</cfscript>