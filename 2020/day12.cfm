<cfscript>
	fileName = replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" );
	puzzleInput = fileRead( replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" ) );
//    	puzzleInput = "F10
// N3
// F7
// R90
// F11";
	//writeDump(puzzleInput);

/* part 1 
	coordinates = {
		facing: "E",
		x: 0,
		y: 0
	}

	puzzleInput.listEach( function( e, i, l ){
		moveShip( coordinates, trim( e ) );
		//writeDump(coordinates);
	}, chr( 10 ), true );

	writeDump( coordinates );
	writeDump( calculateDistance( coordinates ) );

	function moveShip( struct coordinates, string instruction ) {
		var action = left( instruction, 1 );
		var distance = right( instruction, instruction.len()-1 );
		var directions = [ "N", "E", "S", "W" ];
		var pivot = 0;
		var facingIndex = 0;
		var newFacingIndex = 0;

		if ( action == "F" ) action = coordinates.facing;

		switch ( action ) {
			case "N":
				coordinates.y += distance;
				break;
			case "S":
				coordinates.y -= distance;
				break;
			case "E":
				coordinates.x += distance;
				break;
			case "W":
				coordinates.x -= distance;
				break;
			case "L":
				pivot = distance / 90;
				facingIndex = directions.find(coordinates.facing);
				newFacingIndex = facingIndex - pivot;
				if ( newFacingIndex < 1 ) newFacingIndex += 4;
				coordinates.facing = directions[ newFacingIndex ];
				break;
			case "R":
				pivot = distance / 90;
				facingIndex = directions.find(coordinates.facing);
				newFacingIndex = facingIndex + pivot;
				if ( newFacingIndex > 4 ) newFacingIndex -= 4;
				coordinates.facing = directions[ newFacingIndex ];
				break;
		}

	}

	function calculateDistance( struct coordinates ) {
		return abs( coordinates.x ) + abs( coordinates.y );
	}
*/

/* part 2 */
	coordinates = {
		facing: "E",
		x: 0,
		y: 0,
		wFacing: "E",
		wx: 10,
		wy: 1
	};
	// writeDump( coordinates );

	puzzleInput.listEach( function( e, i, l ){
		moveShip( coordinates, trim( e ) );
		// writeDump(coordinates);
	}, chr( 10 ), true );

	writeDump( coordinates );
	writeDump( calculateDistance( coordinates ) );

	function moveShip( struct coordinates, string instruction ) {
		var action = left( instruction, 1 );
		var distance = right( instruction, instruction.len()-1 );

		switch ( action ) {
			case "N":
				coordinates.wy += distance;
				break;
			case "S":
				coordinates.wy -= distance;
				break;
			case "E":
				coordinates.wx += distance;
				break;
			case "W":
				coordinates.wx -= distance;
				break;
			case "F":
				coordinates.x += coordinates.wx * distance;
				coordinates.y += coordinates.wy * distance;
				break;
			case "L": case "R":
				rotate( coordinates, action, distance );
				break;
		}

	}

	function rotate( struct coordinates, string action, numeric distance ) {
		var pivot = distance / 90;
		var directions = [ "N", "E", "S", "W" ];
		var facingIndex = directions.find(coordinates.facing);
		var temp = 0;

		// make everything a right turn
		if ( action == "L" ) {
			pivot = 4 - pivot;
		}
		newFacingIndex = facingIndex + pivot;
		if ( newFacingIndex > 4 ) newFacingIndex -= 4;

		if ( pivot == 1 ) {
			temp = coordinates.wx;
			coordinates.wx = coordinates.wy;
			coordinates.wy = -temp;
		} else if ( pivot == 2 ) {
			coordinates.wx = -coordinates.wx;
			coordinates.wy = -coordinates.wy;
		} else if ( pivot == 3 ) {
			temp = coordinates.wx;
			coordinates.wx = -coordinates.wy;
			coordinates.wy = temp;
		}

		coordinates.facing = directions[ newFacingIndex ];
		coordinates.wfacing = directions[ newFacingIndex ];
	}

	function calculateDistance( struct coordinates ) {
		return abs( coordinates.x ) + abs( coordinates.y );
	}


</cfscript>
