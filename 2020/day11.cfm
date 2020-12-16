<cfscript>
	fileName = replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" );
	puzzleInput = fileRead( replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" ) );
//    	puzzleInput = "L.LL.LL.LL
// LLLLLLL.LL
// L.L.L..L..
// LLLL.LL.LL
// L.LL.LL.LL
// L.LLLLL.LL
// ..L.L.....
// LLLLLLLLLL
// L.LLLLLL.L
// L.LLLLL.LL";
	//writeDump(puzzleInput);

/* part 1 
	seatGrid = createSeatGrid( puzzleInput );
	outputSeatGrid(seatGrid);

	updateResult = updateSeatGrid(seatGrid);
	// writeOutput("Updated " & updateResult.changeCount & " seats<br>There are now " & updateResult.occupiedCount & " seats occupied.<br>");
	// outputSeatGrid(updateResult.seatGrid);

	while ( updateResult.changeCount > 0 ) {		
		updateResult = updateSeatGrid(updateResult.seatGrid);
		//writeOutput("Updated " & updateResult.changeCount & " seats<br>There are now " & updateResult.occupiedCount & " seats occupied.<br>");
		//outputSeatGrid(updateResult.seatGrid);
	}
	writeOutput("Updated " & updateResult.changeCount & " seats<br>There are now " & updateResult.occupiedCount & " seats occupied.<br>");

	function createSeatGrid( string puzzleInput ) {
		var seatGrid = [];

		puzzleInput.listEach( function( e, i, l ){
			seatGrid.append( populateRow( trim( e ) ) );
		}, chr( 10 ), true );

		return seatGrid;
	}

	function populateRow( string row ) {
		var rowItems = [];
		for ( var i = 1; i<= arguments.row.len(); i++ ) {
			rowItems[i] = mid( arguments.row, i, 1 );
		}
		return rowItems;
	}

	function updateSeatGrid( seatGrid ) {
		var originalSeatGrid = duplicate(arguments.seatGrid);
		var updatedSeatGrid = duplicate(arguments.seatGrid);
		var rows = originalSeatGrid.len();
		var seats = originalSeatGrid[1].len();
		var changeCount = 0;
		var occupiedCount = 0;

		for ( var i=1; i <= rows; i++ ) {
			for ( var j=1; j <= seats; j++ ) {
				var currentSeat = originalSeatGrid[i][j];
				if ( currentSeat == "." ) {
					continue;
				} else if ( currentSeat == "L" ) {
					if ( countSeats(originalSeatGrid, i, j, rows, seats, "##" ) == 0 ) {
						updatedSeatGrid[i][j] = "##";
						changeCount++;
						occupiedCount++;
					}
				} else {
					if ( countSeats(originalSeatGrid, i, j, rows, seats, "##" ) >= 4 ) {
						updatedSeatGrid[i][j] = "L";
						changeCount++;
					} else {
						occupiedCount++;
					}
				}
			}
		}

		var response = {
			seatGrid: updatedSeatGrid,
			changeCount: changeCount,
			occupiedCount: occupiedCount
		};

		return response;
	}

	function countSeats( seatGrid, row, seat, rows, seats, status ) {
		var startRow = max(1,row-1);
		var endRow = min(rows, row+1);
		var startSeat = max(1,seat-1);
		var endSeat = min(seats,seat+1);
		var count = 0;

		for ( var i=startRow; i<=endRow; i++ ) {
			for ( var j=startSeat; j<= endSeat; j++ ) {
				if ( i == row && j == seat ) continue;
				if ( seatGrid[i][j] == status ) count++;
			}
		}

		return count;
	}

	function outputSeatGrid( seatGrid ) {
		writeOutput("<pre>");
		for ( var row in arguments.seatGrid ) {
			for ( var seat in row ) {
				writeOutput(seat);
			}
			writeOutput("<br>");
		}
		writeOutput("</pre>");

	}
*/

/* part 2 */
	seatGrid = createSeatGrid( puzzleInput );
	// outputSeatGrid(seatGrid);

	updateResult = updateSeatGrid(seatGrid);
	// writeOutput("Updated " & updateResult.changeCount & " seats<br>There are now " & updateResult.occupiedCount & " seats occupied.<br>");
	// outputSeatGrid(updateResult.seatGrid);

	while ( updateResult.changeCount > 0 ) {		
		updateResult = updateSeatGrid(updateResult.seatGrid);
		// writeOutput("Updated " & updateResult.changeCount & " seats<br>There are now " & updateResult.occupiedCount & " seats occupied.<br>");
		// outputSeatGrid(updateResult.seatGrid);
	}
	writeOutput("Updated " & updateResult.changeCount & " seats<br>There are now " & updateResult.occupiedCount & " seats occupied.<br>");

	function createSeatGrid( string puzzleInput ) {
		var seatGrid = [];

		puzzleInput.listEach( function( e, i, l ){
			seatGrid.append( populateRow( trim( e ) ) );
		}, chr( 10 ), true );

		return seatGrid;
	}

	function populateRow( string row ) {
		var rowItems = [];
		for ( var i = 1; i<= arguments.row.len(); i++ ) {
			rowItems[i] = mid( arguments.row, i, 1 );
		}
		return rowItems;
	}

	function updateSeatGrid( seatGrid ) {
		var originalSeatGrid = duplicate(arguments.seatGrid);
		var updatedSeatGrid = duplicate(arguments.seatGrid);
		var rows = originalSeatGrid.len();
		var seats = originalSeatGrid[1].len();
		var changeCount = 0;
		var occupiedCount = 0;

		for ( var i=1; i <= rows; i++ ) {
			for ( var j=1; j <= seats; j++ ) {
				var currentSeat = originalSeatGrid[i][j];
				if ( currentSeat == "." ) {
					continue;
				} else if ( currentSeat == "L" ) {
					if ( countSeats(originalSeatGrid, i, j, rows, seats, "##" ) == 0 ) {
						updatedSeatGrid[i][j] = "##";
						changeCount++;
						occupiedCount++;
					}
				} else {
					if ( countSeats(originalSeatGrid, i, j, rows, seats, "##" ) >= 5 ) {
						updatedSeatGrid[i][j] = "L";
						changeCount++;
					} else {
						occupiedCount++;
					}
				}
			}
		}

		var response = {
			seatGrid: updatedSeatGrid,
			changeCount: changeCount,
			occupiedCount: occupiedCount
		};

		return response;
	}

	function countSeats( seatGrid, row, seat, rows, seats, status ) {
		// directions: up, down, left, right, up and left, up and right, down and left, down and right
		var directions = [
			[-1,0],
			[1,0],
			[0,-1],
			[0,1],
			[-1,-1],
			[-1,1],
			[1,-1],
			[1,1]
		];
		var count = 0;
		var currentRow = 0;
		var currentSeat = 0;

		if ( seatGrid[row][seat] == "." ) return 0;

		for ( direction in directions ) {
			currentRow = row + direction[1];
			currentSeat = seat + direction[2];

			while ( currentRow > 0 && currentRow <= rows && currentSeat > 0 && currentSeat <= seats ) {
				if ( seatGrid[currentRow][currentSeat] == status ) {
					count++;
					break;
				} else if ( seatGrid[currentRow][currentSeat] == "L" ) {
					break;
				}
				currentRow += direction[1];
				currentSeat += direction[2];
			}
		}

		return count;
	}

	function outputSeatGrid( seatGrid ) {
		writeOutput("<pre>");
		for ( var row in arguments.seatGrid ) {
			for ( var seat in row ) {
				writeOutput(seat);
			}
			writeOutput("<br>");
		}
		writeOutput("</pre>");

	}

</cfscript>
