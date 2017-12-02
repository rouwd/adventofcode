
<cfscript>

	input = fileOpen( "#getDirectoryFromPath(getCurrentTemplatePath())#input.txt", "read" );
	//input = fileOpen( "#getDirectoryFromPath(getCurrentTemplatePath())#testInput.txt", "read" );

	checksum = 0;

	while(NOT FileisEOF(input)) 
	{ 
		line = FileReadLine(input);

		lineValues = listToArray( line, chr(9) );
		min = 0;
		max = 0;

		for ( value in lineValues ) {

			if ( min == 0 || min > value ) {
				min = value;
			}

			if ( max == 0 || max < value ) {
				max = value;
			}
		}

		checksum += ( max - min );

		WriteOutput( min & ":" & max & "<br>"); 
	}

	FileClose(input); 

	writeOutput( "checksum: " & checksum );

</cfscript>