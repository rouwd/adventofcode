
<cfscript>

	input = fileOpen( "#getDirectoryFromPath(getCurrentTemplatePath())#input.txt", "read" );
	//input = fileOpen( "#getDirectoryFromPath(getCurrentTemplatePath())#testInput2.txt", "read" );

	count = 0;

	while(NOT FileisEOF(input)) 
	{ 
		line = FileReadLine(input);
		sortedWords = [];

		isValid = 1;
		words = listToArray( line, " " );

		for ( word in words ) {
			sortedWord = rematch( ".?", word );

			arraySort( sortedWord, "text" );

			//writeOutput( word & "<br>" );
			//writeDump( sortedWord );

			if ( arrayContains( sortedWords, sortedWord ) ) {
				isValid = 0;
				break;
			} else {
				arrayAppend( sortedWords, sortedWord );
			}
			
		}

		if ( isValid ) {
			count++;
		}

	}


	FileClose(input); 

	writeOutput( "count: " & count );

</cfscript>