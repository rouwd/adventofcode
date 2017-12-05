
<cfscript>

	input = fileOpen( "#getDirectoryFromPath(getCurrentTemplatePath())#input.txt", "read" );
	//input = fileOpen( "#getDirectoryFromPath(getCurrentTemplatePath())#testInput.txt", "read" );

	count = 0;
	dupRegex = "\b(\S+)\b.*\b\1\b";

	while(NOT FileisEOF(input)) 
	{ 
		line = FileReadLine(input);

		test = REFindNoCase( dupRegex , line);

		if ( test == 0 ) {
			count++;
		}

	}

	FileClose(input); 

	writeOutput( "count: " & count );

</cfscript>