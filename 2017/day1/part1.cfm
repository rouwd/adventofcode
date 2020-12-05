
<cfscript>

	input = fileRead( "#getDirectoryFromPath(getCurrentTemplatePath())#input.txt" );

	// input = 1122;
	// input = 1111;
	// input = 1234;
	// input = 91212129;

	firstChar = left( input, 1 );
	input = input & firstChar;

	inputLen = len( input );

	total = 0;

	for ( charIndex = 1; charIndex < inputLen; charIndex++ ) {

		if ( charIndex LT inputLen ) {

			currentChar = mid( input, charIndex, 1 );
			nextChar = mid( input, charIndex + 1, 1);

			//writeOutput( currentChar & ":" & nextChar & "<br>" );

			if ( currentChar == nextChar ) {
				total = total + currentChar;
			}

		}
	}

	writeOutput( "total: " & total );

</cfscript>