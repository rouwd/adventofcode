
<cfscript>

	input = fileRead( "#getDirectoryFromPath(getCurrentTemplatePath())#input.txt" );

	// input = 1212;
	// input = 1221;
	// input = 123425;
	// input = 123123;
	// input = 12131415;

	inputLen = len( input );
	compareStep = inputLen / 2;

	//writeOutput( compareStep & "<br>" );

	total = 0;

	for ( charIndex = 1; charIndex <= inputLen; charIndex++ ) {

		currentChar = mid( input, charIndex, 1 );
		nextCharIndex = charIndex + compareStep;
		if ( nextCharIndex > inputLen ) {
			nextCharIndex = nextCharIndex - inputLen;
		}
		nextChar = mid( input, nextCharIndex, 1);

		//writeOutput( currentChar & ":" & nextChar & ":" & nextCharIndex & "<br>" );

		if ( currentChar == nextChar ) {
			total = total + currentChar;
		}
	}

	writeOutput( "total: " & total );

</cfscript>