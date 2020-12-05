
<cfscript>

input = listToArray( fileRead( expandPath( "input.txt" ) ) );

try{
/*

1,0,0,0,99 becomes 2,0,0,0,99 (1 + 1 = 2).
2,3,0,3,99 becomes 2,3,0,6,99 (3 * 2 = 6).
2,4,4,5,99,0 becomes 2,4,4,5,99,9801 (99 * 99 = 9801).
1,1,1,4,99,5,6,0,99 becomes 30,1,1,4,2,5,6,0,99.

*/

// input = [1002,4,3,4,33];
// input = [2,3,0,3,99];
// input = [2,4,4,5,99,0];
// input = [1,1,1,4,99,5,6,0,99];
for ( i=1; i <= input.len(); i=i++ ) {

	command = numberFormat( input[i], "00000" );
	// writeDump(command);

	instruction = {
		operator: int(command.right(2)),
		param1Mode: mid( command, 3, 1),
		param2Mode: mid( command, 2, 1),
		param3Mode: mid( command, 1, 1)
	};
	// writeDump(i);
	// writeDump(instruction);

	if ( instruction.operator == 99 ) {
		break;
	} else {
		if( instruction.operator == 1 ) {
			x = input[i+1];
			// writeOutput("x: " & x & "<br>");
			if ( instruction.param1Mode == 1 ) {
				a = x;
			} else {
				if ( x < 0 ) {
					x = input.len() + x MOD input.len() + 1;
				}
				a = input[x+1];
			}
			// writeOutput("a: " & a & "<br>");
			y = input[i+2];
			if ( instruction.param2Mode == 1 ) {
				b = y;
			} else {
				if ( y < 0 && instruction.param2Mode == 0 ) {
					y = input.len() + y MOD input.len() + 1;
				}

				b = input[y+1];
			}
			// writeOutput("b: " & b & "<br>");
			p = input[i+3];
			if ( instruction.param3Mode == 1 ) {
				p = p;
			}
			input[p+1] = a + b;
			i = i + 4;
		} else if ( instruction.operator == 2 ) {
			x = input[i+1];
			a = input[x+1];
			if ( instruction.param1Mode == 1 ) {
				a = x;
			}
			y = input[i+2];
			b = input[y+1];
			if ( instruction.param2Mode == 1 ) {
				b = y;
			}
			p = input[i+3];
			if ( instruction.param3Mode == 1 ) {
				p = p;
			}
			input[p+1] = a * b;
			i = i + 4;
		} else if ( instruction.operator == 3 ) {
			pos = input[i+1];
			input[pos+1] = 1;
			i = i + 2;
		} else if ( instruction.operator == 4 ) {
			pos = input[i+1];
			if ( instruction.param1Mode == 1 ) {
				writeOutput( "Output: " & pos );
				// if ( pos != 0 ) {
				// 	throw( "wrong answer" );
				// }
			} else {
				writeOutput( "Output: " & input[pos+1] );
				// if ( input[pos+1] != 0 ) {
				// 	throw( "wrong answer" );
				// }
			}
			i = i + 2;
		}
	}

	// if ( i > 1 ) {
	// 	break;
	// }
	// writeDump( i & ": " & input[i] );
}
} catch( any e ) {
	// writeDump(i);
	// writeDump(instruction);
	writeOutput("y: " & y & "input len: " & input.len() & "diff: " & input.len() + y + 1 );
	writeDump(e);
	
}
writeDump( input );

</cfscript>
