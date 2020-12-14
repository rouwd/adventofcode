<cfscript>
	fileName = replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" );
	puzzleInput = fileRead( replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" ) );
//    	puzzleInput = "nop +0
// acc +1
// jmp +4
// acc +3
// jmp -3
// acc -99
// acc +1
// jmp -4
// acc +6";
	//writeDump(puzzleInput);

/* part 1 
	accumulator = 0;
	commands = [];

	puzzleInput.listEach( function( e, i, l ){
		commands.append( newCommand(e) );
	}, chr( 10 ), true );

	dupeFound = false;
	commandIndex = 1;
	minIndex = 1;
	maxIndex = commands.len();

	while ( !dupeFound ) {
		command = commands[commandIndex].command;
		parameter = commands[commandIndex].parameter;
		commands[commandIndex].hitCount++;

		if ( commands[commandIndex].hitCount > 1 ) {
			dupeFound = true;
		} else {
			switch ( command )	 {
			case "nop":
				// no action, move to the next command
				commandIndex++;
				break;
			case "acc":
				// update accumulator per perameter, then move to the next command
				accumulator += parameter;
				commandIndex++;
				break;
			case "jmp":
				// jump to the command based on the parameter
				commandIndex += parameter;
				break;
			}
		}

		if ( commandIndex > maxIndex ) commandIndex -= maxIndex;
		if ( commandIndex < minIndex ) commandIndex += maxIndex;
	}

	// writeDump( commands );
	writeDump( accumulator );

	function newCommand( string input ) {
		return {
			command: listFirst(input," "),
			parameter: listLast(input," "),
			hitCount: 0
		}
	}
*/

/* part 2 */
	accumulator = 0;
	commands = [];

	puzzleInput.listEach( function( e, i, l ){
		commands.append( newCommand(e) );
	}, chr( 10 ), true );

	minIndex = 1;
	maxIndex = commands.len();
	commandCopy = duplicate(commands);

	for ( i=1; i<=maxIndex; i++ ) {
		commands = duplicate(commandCopy);

		if ( commands[i].command == "acc" ) continue;
		if ( commands[i].command == "nop" && commands[i].parameter == "+0" ) continue;
		if ( commands[i].command == "nop" ) {
			commands[i].command = "jmp";
			writeOutput("nop to jmp: " & i & "<br>");
		} else if ( commands[i].command == "jmp" ) {
			commands[i].command = "nop";
			writeOutput("jmp to nop: " & i & "<br>");
		}

		commandIndex = 1;
		dupeFound = false;
		eof = false;
		accumulator = 0;
		accs = [];

		while ( !dupeFound and !eof ) {
			command = commands[commandIndex].command;
			parameter = commands[commandIndex].parameter;
			commands[commandIndex].hitCount++;

			if ( commandIndex == maxIndex ){
				eof = true;
			}

			if ( commands[commandIndex].hitCount > 1 ) {
				dupeFound = true;
			} else {
				switch ( command )	 {
				case "nop":
					// If the parameter would put us 1 spot afer
					if ( commandIndex + parameter == maxIndex + 1 ) {
						commandIndex += parameter;
					}
					// no action, move to the next command
					commandIndex++;
					break;
				case "acc":
					// update accumulator per perameter, then move to the next command
					temp = duplicate(commands[commandIndex]);
					temp.commandIndex = commandIndex;
					temp.accumulator = accumulator;
					accs.append(temp);
					accumulator += parameter;
					commandIndex++;
					break;
				case "jmp":
					// jump to the command based on the parameter
					commandIndex += parameter;
					break;
				}
			}

			//if ( commandIndex > maxIndex ) commandIndex -= maxIndex;
			//if ( commandIndex < minIndex ) commandIndex += maxIndex;

		}

		if ( !dupeFound ) {
			break;
		}
	}

	writeDump(i);
	//writeDump( accs );
	writeDump( accumulator );

	function newCommand( string input ) {
		return {
			command: listFirst(input," "),
			parameter: listLast(input," "),
			hitCount: 0
		}
	}

</cfscript>
