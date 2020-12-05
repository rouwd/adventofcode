
<cfscript>

input = listToArray( fileRead( expandPath( "input.txt" ) ) );
stdInput = 5;
try{
/*
For example, here are several programs that take one input, compare it to the value 8, and then produce one output:

3,9,8,9,10,9,4,9,99,-1,8 - Using position mode, consider whether the input is equal to 8; output 1 (if it is) or 0 (if it is not).
3,9,7,9,10,9,4,9,99,-1,8 - Using position mode, consider whether the input is less than 8; output 1 (if it is) or 0 (if it is not).
3,3,1108,-1,8,3,4,3,99 - Using immediate mode, consider whether the input is equal to 8; output 1 (if it is) or 0 (if it is not).
3,3,1107,-1,8,3,4,3,99 - Using immediate mode, consider whether the input is less than 8; output 1 (if it is) or 0 (if it is not).
Here are some jump tests that take an input, then output 0 if the input was zero or 1 if the input was non-zero:

3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9 (using position mode)
3,3,1105,-1,9,1101,0,0,12,4,12,99,1 (using immediate mode)
Here's a larger example:

3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,
1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,
999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99
The above example program uses an input instruction to ask for a single number. The program will then output 999 if the input value is below 8, output 1000 if the input value is equal to 8, or output 1001 if the input value is greater than 8.
*/

// input = [3,9,8,9,10,9,4,9,99,-1,8];
// input = [3,9,7,9,10,9,4,9,99,-1,8];
// input = [3,3,1108,-1,8,3,4,3,99];
// input = [3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99];
for ( i=1; i <= input.len(); i=i++ ) {
// writeDump(input);

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
			// a = input[x+1];
			if ( instruction.param1Mode == 1 ) {
				a = x;
			} else {
				if ( x < 0 ) {
					x = input.len() + x MOD input.len() + 1;
				}
				a = input[x+1];
			}
			y = input[i+2];
			// b = input[y+1];
			if ( instruction.param2Mode == 1 ) {
				b = y;
			} else {
				if ( y < 0 && instruction.param2Mode == 0 ) {
					y = input.len() + y MOD input.len() + 1;
				}

				b = input[y+1];
			}
			p = input[i+3];
			if ( instruction.param3Mode == 1 ) {
				p = p;
			}
			input[p+1] = a * b;
			i = i + 4;
		} else if ( instruction.operator == 3 ) {
			pos = input[i+1];
			input[pos+1] = stdInput;
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
		} else if ( instruction.operator == 5 ) {
			x = input[i+1];
			y = input[i+2];
			if ( instruction.param1Mode == 1 ) {
				val1 = x;
			} else {
				val1 = input[x+1];
			}
			if ( instruction.param2Mode == 1 ) {
				val2 = y + 1;
			} else {
				val2 = input[y+1] + 1;
			}
			if ( val1 != 0 ) {
				i = val2;
			} else {
				i = i+3;
			}

		} else if ( instruction.operator == 6 ) {
			x = input[i+1];
			y = input[i+2];
			if ( instruction.param1Mode == 1 ) {
				val1 = x;
			} else {
				val1 = input[x+1];
			}
			if ( instruction.param2Mode == 1 ) {
				val2 = y + 1;
			} else {
				val2 = input[y+1] + 1;
			}
			if ( val1 == 0 ) {
				i = val2;
			} else {
				i = i+3;
			}
			// writeDump(x);
			// writeDump(y);
			// writeDump(val1);
			// writeDump(val2);
			// abort;
			
		} else if ( instruction.operator == 7 ) {
			x = input[i+1];
			y = input[i+2];
			z = input[i+3];

			if ( instruction.param1Mode == 1 ) {
				val1 = x;
			} else {
				val1 = input[x+1];
			}

			if ( instruction.param2Mode == 1 ) {
				val2 = y;
			} else {
				val2 = input[y+1];
			}

			if ( val1 < val2 ) {
				input[z+1] = 1;
			} else {
				input[z+1] = 0;
			}
			
			i = i + 4;

		} else if ( instruction.operator == 8 ) {
			x = input[i+1];
			y = input[i+2];
			z = input[i+3];

			if ( instruction.param1Mode == 1 ) {
				val1 = x;
			} else {
				val1 = input[x+1];
			}

			if ( instruction.param2Mode == 1 ) {
				val2 = y;
			} else {
				val2 = input[y+1];
			}

			if ( val1 == val2 ) {
				input[z+1] = 1;
			} else {
				input[z+1] = 0;
			}
			
			i = i + 4;
			
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
// writeDump( input );

</cfscript>
