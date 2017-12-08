
<cfscript>

	input = fileOpen( "#getDirectoryFromPath(getCurrentTemplatePath())#input.txt", "read" );
	//input = fileOpen( "#getDirectoryFromPath(getCurrentTemplatePath())#testInput.txt", "read" );

	programs = {};

	while(NOT FileisEOF(input)) 
	{ 
		line = FileReadLine(input);

		mainProgram = trim( listFirst( line, "(" ) );
		mainProgramNumber = listFirst( listLast( line, "(" ) , ")");

		if ( !structKeyExists( programs, mainProgram ) ) {
			programs[ mainProgram ] = {
				weight = mainProgramNumber,
				count = 1
			}
		} else {
			programs[ mainProgram ].weight = mainProgramNumber;
			programs[ mainProgram ].count++;
		}

		if ( find( ">", line ) > 0 ) {
			linkedPrograms = listLast( line, ">" );

			for ( item in linkedPrograms ) {
				item = trim( item );
				if ( !structKeyExists( programs, item) ) {
					programs[ item ] = {
						weight = 0,
						count = 1
					}
				} else {
					programs[ item ].count++;
				}
			}
		}

		//writeOutput( mainProgram & ":" & mainProgramNumber & "<br>" )

	}

	base = structFindValue( programs , 1 );

	writeDump( base );
	//writeDump( programs );

</cfscript>