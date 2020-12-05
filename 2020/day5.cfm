<cfscript>
	fileName = replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" );
	puzzleInput = fileRead( replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" ) );
//    	puzzleInput = "FBFBBFFRLR
// BFFFBBFRRR
// FFFBBBFRRR
// BBFFBBFRLL";
	//writeDump(puzzleInput);

/* part 1 
	answer = 0;
	passes = [];
	currentPassport = "";
	passportIndex = 1;

	puzzleInput.listEach( function( e, i, l ){
		passes.append( calculateSeat( trim(e) ) );
		if ( passes[-1].seatID > answer ) answer = passes[-1].seatID;
	}, chr( 10 ) );

	writeDump( passes );
	writeDump( answer );
*/

/* part 2 */
	answer = {
		row: 0,
		seat: 0,
		seatID: 0
	};
	seatIDs = [];
	totalSeats = 128*8;
	passes = [];
	currentPassport = "";
	passportIndex = 1;

	for ( i = 1; i < totalSeats; i++ ) {
		seatIDs[i] = "E";
	}

	puzzleInput.listEach( function( e, i, l ){
		passes.append( calculateSeat( trim(e) ) );
		if ( passes[-1].seatID > 0 ) seatIDs[ passes[-1].seatID ] = 1;
	}, chr( 10 ) );

	writeDump( seatIDs );
	writeDump( answer );


	struct function calculateSeat( string pass ) {
		var r = {
			row: 0,
			seat: 0,
			seatID: 0
		}
		var rowLow = 0;
		var rowHigh = 127;
		var seatLow = 0;
		var seatHigh = 7;

		// writeOutput( rowLow & " : " & rowHigh & "<br>" );
		// writeOutput( seatLow & " : " & seatHigh & "<br>" );

		for ( var i=1; i <= arguments.pass.len(); i++ ) {
			var c = mid(arguments.pass, i, 1);
			var halfRow = ( rowHigh - rowLow + 1 ) / 2;
			var halfSeat = ( seatHigh - seatLow + 1 ) / 2;
			//writeDump(c);
			switch (c) {
				case "F":
					rowHigh -= halfRow;
					//writeDump(halfRow);
					// writeOutput( rowLow & " : " & rowHigh & "<br>" );
					break;
				case "B":
					rowLow += halfRow;
					//writeDump(halfRow);
					// writeOutput( rowLow & " : " & rowHigh & "<br>" );
					break;
				case "L":
					seatHigh -= halfSeat;
					//writeDump(halfSeat);
					// writeOutput( seatLow & " : " & seatHigh & "<br>" );
					break;
				case "R":
					seatLow += halfSeat;
					//writeDump(halfSeat);
					// writeOutput( seatLow & " : " & seatHigh & "<br>" );
					break;
			}
		}

		r.row = rowLow;
		r.seat = seatLow;
		r.seatID = ( rowLow * 8 ) + seatLow;
		// writeDump(r);
		return r;

	}



</cfscript>
