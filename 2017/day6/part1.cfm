
<cfscript>

	input = fileOpen( "#getDirectoryFromPath(getCurrentTemplatePath())#input.txt", "read" );
	//input = fileOpen( "#getDirectoryFromPath(getCurrentTemplatePath())#testInput.txt", "read" );

	line = FileReadLine(input);

	banks = listToArray( line, chr(9) );
	bankText = arrayToList( banks, " " );
	slots = arrayLen( banks );

	steps = 0;

	bankHistory = [];

	while ( !arrayContains( bankHistory, bankText ) ) {

		arrayAppend( bankHistory, bankText );

		maxVal = arrayMax( banks );
		maxValPos = arrayFind( banks, maxVal );
		
		banks[ maxValPos ] = 0;

		for ( x=1; x<=maxVal; x++ ){
			curIndex = maxValPos + ( x % slots );

			if ( curIndex > slots ) {
				curIndex = curIndex - slots;
			}

			banks[ curIndex ]++;
		}

		bankText = arrayToList( banks, " " );
		steps++;

	}

	FileClose(input); 

	writeOutput( steps );
	writeDump( bankHistory );

</cfscript>