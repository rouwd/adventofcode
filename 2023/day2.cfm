<cfscript>
	fileName = replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" );
	puzzleInput = fileRead( replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" ) );
	// puzzleInput = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
	// Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
	// Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
	// Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
	// Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green";

	try {
		games = [];
	
		puzzleInput.listEach( function( e, i, l ){
			var max = getMax();
			e = trimCRLF( e );
			var currentGame = {
				number: getGameNumber( e ),
				valid: isGameValid( max, e ),
				power: getGamePower( e )
			}
			games.append( currentGame );
		}, chr( 10 ) );
	
		gameIDSum = getGameIDSum( games );
		writeOutput( "gameIDSum: " & gameIDSum & "<br>" );
		gamePowerSum = getGamePowerSum( games );
		writeOutput( "gamePowerSum: " & gamePowerSum & "<br>" );
		writeDump( games );
	} catch( any e ) {
		writedump( e );
	}

	function isGameValid( max, game ) {
		var sets = getSets( game );
		for ( var set in sets ) {
			if ( !isSetValid( set, max ) ){
				return false;
			}
		}
		// writedump( sets );
		return true;
	}

	function getMax() {
		return {
			"red": 12,
			"green": 13,
			"blue": 14
		}
	}

	function getGameNumber( s ) {
		return listLast( listFirst( s, ":" ), " ");
	}

	function getSets( s ){
		return listLast( s, ":").listToArray( ";" );
	}

	function isSetValid( s, max ){
		var cubes = s.listToArray();
		var color = "";
		var count = 0;
		// writeDump(max);
		for (var cube in cubes) {
			// writeOutput( "cube: " & cube & "<br>" );
			color = listLast( cube, " " );
			count = listFirst( cube, " " );
			// writeOutput( "color: " & color & " " & asc(right(color,1)) & " count: " & count & "<br>" );
			if ( count > max[ color ] ){
				// writeOutput( "Too many " & color & " count: " & count & "<br>" );
				return false;
			}
		}
		return true;
		
	}

	function getGameIDSum( games ) {
		var a = 0;
		for (var game in games ) {
			if( game.valid ) a += game.number;
		}
		return a;
	}

	function trimCRLF( s ){
		var CRLF = chr( 10 ) & "," & chr( 13 );
		return replaceList( s, CRLF, "" )
	}

	function getGamePower( game ) {
		var sets = getSets( game );
		var min = {
			"red": 1,
			"green": 1,
			"blue": 1
		}
		for ( var set in sets ) {
			var cubes = set.listToArray();
			for ( var cube in cubes ){
				color = listLast( cube, " " );
				count = listFirst( cube, " " );
				if ( count > min[ color ] ) {
					min[ color ] = count;
				}
			}
			// writeDump(cubes);
		}
		// writeDump(min);
		// writedump( sets );
		return min.red * min.green * min.blue;
	}
	function getGamePowerSum( games ) {
		var a = 0;
		for (var game in games ) {
			a += game.power;
		}
		return a;
	}
	
</cfscript>