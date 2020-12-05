
<cfscript>

input = listToArray( fileRead( expandPath( "input.txt" ) ), "-" );

writeDump(input);

// writeDump( validNumber(111111) );
// writeDump( validNumber(223450) );
// writeDump( validNumber(123789) );

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
	
	for ( var j=1; j<=numberAsText.len(); j++ ) {
		currentNumber = mid( numberAsText, j, 1 );
		//writeDump(currentNumber);
		if ( currentNumber < priorNumber ) {
			return false;
		} else if ( currentNumber == priorNumber ) {
			foundDouble = true;
		}
		priorNumber = currentNumber;
	}
	return foundDouble;
}
</cfscript>
