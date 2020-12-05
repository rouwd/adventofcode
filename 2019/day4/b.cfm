
<cfscript>

input = listToArray( fileRead( expandPath( "input.txt" ) ), "-" );

writeDump(input);

/*
112233 meets these criteria because the digits never decrease and all repeated digits are exactly two digits long.
123444 no longer meets the criteria (the repeated 44 is part of a larger group of 444).
111122 meets the criteria (even though 1 is repeated more than twice, it still contains a double 22).
*/

// writeDump( validNumber(112233) );
// writeDump( validNumber(123444) );
// writeDump( validNumber(111122) );

count = 0;
for ( i=input[1]; i <= input[2]; i++ ) {

	if ( validNumber( int(i) ) ) {
		count++;
	}

	// writeOutput( i & "<br>" );
	//abort;
}
writeDump(count);

function validNumber( n ) {
	var numberAsText = n.toString();
	// writeDump(numberAsText);

	var priorNumber = 0;
	var currentNumber = 0;
	var foundDouble = false;
	var charCount = 0;
	
	for ( var j=1; j<=numberAsText.len(); j++ ) {
		currentNumber = mid( numberAsText, j, 1 );
		//writeDump(currentNumber);
		if ( currentNumber < priorNumber ) {
			return false;
		} else if ( currentNumber == priorNumber ) {
			charCount++;
			// writeDump(charCount);
			// foundDouble = true;
		} else {
			// writeOutput(charCount & " reset<br>");
			if ( charCount == 2 ) {
				foundDouble = true;
			}
			charCount = 1;
		}
		// writeOutput(charCount & " end number<br>");
		priorNumber = currentNumber;
	}
	// writeOutput(charCount & " end loop<br>");
	if ( charCount == 2 ) {
		foundDouble = true;
	}

	return foundDouble;
}
</cfscript>
