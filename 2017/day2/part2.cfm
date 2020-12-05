
<cfscript>

	input = fileOpen( "#getDirectoryFromPath(getCurrentTemplatePath())#input.txt", "read" );
	//input = fileOpen( "#getDirectoryFromPath(getCurrentTemplatePath())#testInput2.txt", "read" );

	checksum = 0;

	while(NOT FileisEOF(input)) 
	{ 
		line = FileReadLine(input);

		lineValues = listToArray( line, chr(9) );
		arraySort( lineValues, "numeric", "desc" );
		min = 0;
		max = 0;

		for ( i=1; i <= arrayLen( lineValues ); i++ ) {

			currentNumber = lineValues[i];
			remainder = -1;

			for ( j=i+1; j <= arrayLen( lineValues ); j++ ) {

				divisor = lineValues[j];

				remainder = currentNumber % divisor;

				if ( remainder == 0 ) {
					max = currentNumber;
					min = divisor;
					break;
				}

			}

			if ( remainder == 0 ) {
				checksum += ( max / min );
				WriteOutput( min & ":" & max & "<br>");
				break;
			}

		}

	}

	FileClose(input); 

	writeOutput( "checksum: " & checksum );

</cfscript>