<cfscript>
	fileName = replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" );
	puzzleInput = fileRead( replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" ) );
   	puzzleInput = "nop +0
acc +1
jmp +4
acc +3
jmp -3
acc -99
acc +1
jmp -4
acc +6";
	//writeDump(puzzleInput);

/* part 1 */
	answer = 0;
	commands = [];

	puzzleInput.listEach( function( e, i, l ){
		commands.append( newCommand(e) );
	}, chr( 10 ), true );

	dupeFound = false;

	while ( !dupeFound ) {
		
	}

	writeDump( commands );
	writeDump( answer );

	function newCommand( string input ) {
		return {
			command: listFirst(input," "),
			parameter: listLast(input," "),
			hitCount: 0
		}
	}

/* part 2 */

</cfscript>
