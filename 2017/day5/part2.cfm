
<cfscript>

	input = fileOpen( "#getDirectoryFromPath(getCurrentTemplatePath())#input.txt", "read" );
	//input = fileOpen( "#getDirectoryFromPath(getCurrentTemplatePath())#testInput.txt", "read" );

	moves = [];

	while(NOT FileisEOF(input)) 
	{ 
		line = FileReadLine(input);

		arrayAppend( moves, line );

	}

	steps = 0;
	pos = 1;
	len = arrayLen( moves );

		writeOutput( pos & "<br>" );
	while ( pos <= len ) {
		currentMove = moves[pos];

		if ( currentMove > 2 ) {
			moves[pos]--;
		} else {
			moves[pos]++;
		}
		pos += currentMove;
		steps++;

		//writeOutput( pos & "<br>" );
	}

	FileClose(input); 

	writeOutput( steps );
	//writeDump( moves );

</cfscript>