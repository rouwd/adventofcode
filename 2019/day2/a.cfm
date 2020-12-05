
<cfscript>

input = listToArray( fileRead( expandPath( "input.txt" ) ) );

/*

1,0,0,0,99 becomes 2,0,0,0,99 (1 + 1 = 2).
2,3,0,3,99 becomes 2,3,0,6,99 (3 * 2 = 6).
2,4,4,5,99,0 becomes 2,4,4,5,99,9801 (99 * 99 = 9801).
1,1,1,4,99,5,6,0,99 becomes 30,1,1,4,2,5,6,0,99.

*/

// input = [1,0,0,0,99];
// input = [2,3,0,3,99];
// input = [2,4,4,5,99,0];
// input = [1,1,1,4,99,5,6,0,99];

for ( i=1; i <= input.len(); i=i+4 ) {

	operator = input[i];

	if ( operator == 99 ) {
		break;
	} else {
		x = input[i+1];
		y = input[i+2];
		p = input[i+3];
		if( operator == 1 ) {
			input[p+1] = input[x+1] + input[y+1];
		} else if ( operator == 2 ) {		
			input[p+1] = input[x+1] * input[y+1];
		}	
	}
	// writeDump( i & ": " & input[i] );
}

writeDump( input );

</cfscript>
