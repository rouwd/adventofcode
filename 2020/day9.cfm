<cfscript>
	fileName = replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" );
	puzzleInput = fileRead( replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" ) );
//    	puzzleInput = "35
// 20
// 15
// 25
// 47
// 40
// 62
// 55
// 65
// 95
// 102
// 117
// 150
// 182
// 127
// 219
// 299
// 277
// 309
// 576";
	//writeDump(puzzleInput);

/* part 1 
	preambleSize = 25;
	buffer = [];
	maxValue = 0;
	secondToMaxValue = 0;

	puzzleInput.listEach( function( e, i, l ){
		var element = trim(e);
		if ( buffer.len() < preambleSize ) {
			buffer.append( element );
		} else {
			if ( !findMatch( buffer, element, maxValue, secondToMaxValue ) ) {
				writeOutput( "Answer: " & element & "<br>" );
				writeDump(buffer);
				abort;
			}
			buffer.deleteAt(1);
			buffer.append( element );
		}
		if ( element > maxValue ) {
			secondToMaxValue = maxValue;
			maxValue = element;
			writeOutput( "maxValue: " & maxValue & " secondToMaxValue: " & secondToMaxValue & "<br>" );
		}
	}, chr( 10 ), true );

	writeDump( buffer );

	boolean function findMatch( array buffer, numeric element, numeric maxValue, numeric secondToMaxValue ){
		var match = false;
		for ( var i=1; i<=arguments.buffer.len(); i++ ) {
			var a = buffer[i];
			for ( var j=1; j<=arguments.buffer.len(); j++ ) {
				if ( i == j ) continue;
				var b = buffer[j];
				if ( a + b == arguments.element ) {
					match = true;
					break;
				}
			}
			if ( match ) break;
		}
		return match;
	}
*/

/* part 2 */
	preambleSize = 25;
	buffer = [];
	maxValue = 0;
	secondToMaxValue = 0;
	targetNumber = 0;


	puzzleInput.listEach( function( e, i, l ){
		if ( targetNumber == 0 ){
			var element = trim(e);
			if ( buffer.len() < preambleSize ) {
				buffer.append( element );
			} else {
				if ( !findMatch( buffer, element, maxValue, secondToMaxValue ) ) {
					writeOutput( "Answer: " & element & "<br>" );
					targetNumber = element;
				}
				buffer.deleteAt(1);
				buffer.append( element );
			}
			if ( element > maxValue ) {
				secondToMaxValue = maxValue;
				maxValue = element;
				//writeOutput( "maxValue: " & maxValue & " secondToMaxValue: " & secondToMaxValue & "<br>" );
			}
		}
	}, chr( 10 ), true );

	answerBuffer = findContiguousSet( puzzleInput, targetNumber );

	writeDump( answerBuffer );

	boolean function findMatch( array buffer, numeric element, numeric maxValue, numeric secondToMaxValue ){
		var match = false;
		for ( var i=1; i<=arguments.buffer.len(); i++ ) {
			var a = buffer[i];
			for ( var j=1; j<=arguments.buffer.len(); j++ ) {
				if ( i == j ) continue;
				var b = buffer[j];
				if ( a + b == arguments.element ) {
					match = true;
					break;
				}
			}
			if ( match ) break;
		}
		return match;
	}

	function findContiguousSet( string puzzleInput, numeric targetNumber ) {
		var puzzleArray = listToArray(puzzleInput,chr(10));
		var i = 1;
		var total = 0;
		while ( total <= arguments.targetNumber ) {
			var answerBuffer = [];
			var smallest = 999999999;
			var largest = 0;
			//writeOutput("trying i=:" & i & "<br>");
			for ( j=i; j<=puzzleArray.len(); j++ ) {
				total += puzzleArray[j];
				answerBuffer.append(puzzleArray[j]);
				if ( puzzleArray[j] > largest ) largest = puzzleArray[j];
				if ( puzzleArray[j] < smallest ) smallest = puzzleArray[j];

				if ( total == arguments.targetNumber ) {
					writeOutput("found answer on i= " & i & " and j=" & j & " total = " & total & "<br>");
					writeOutput("smallest= " & smallest & " and largest=" & largest & " total = " & smallest + largest & "<br>");
					return answerBuffer;
				} else if ( total > arguments.targetNumber ) {
					//writeOutput("ending on j=:" & j & " total = " & total & "<br>");
					total = 0;
					break;
				}
			}
			i++;
		}
		writeOutput("total: " & total & "<br>");
		writeDump(answerBuffer);
	}

</cfscript>
