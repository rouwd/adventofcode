<cfscript>
	fileName = replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" );
	puzzleInput = fileRead( replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" ) );
//   	puzzleInput = "..@@.......
// @...@...@..
// .@....@..@.
// ..@.@...@.@
// .@...@@..@.
// ..@.@@.....
// .@.@.@....@
// .@........@
// @.@@...@...
// @...@@....@
// .@..@...@.@";
	//writeDump(puzzleInput);

/* part 1 
	answer = 0;
	xPos = 1;
	yPos = 1;
	field = [];
	fieldWidth = 0;
	fieldHeight = 0;

	puzzleInput.listEach( function( e, i, l ){
		field.append(trim(e));
	}, chr( 10 ) );

	fieldWidth = field[1].len();
	fieldHeight = field.len();

	// right 3, down 1
	for ( i = 1; i < fieldHeight; i++ ) {
		xPos += 3;
		if ( xPos > fieldWidth ) xPos -= fieldWidth;
		yPos += 1;
		if ( mid( field[yPos], xPos, 1) == "@" ) {
			answer++;
		}

	}

	writeOutput( answer );
*/

 /* part 2 */
	field = [];
	tests = [];
	answer = 0;

	puzzleInput.listEach( function( e, i, l ){
		field.append(trim(e));
	}, chr( 10 ) );

	tests.append( countTrees( field, 1, 1 ) );
	tests.append( countTrees( field, 3, 1 ) );
	tests.append( countTrees( field, 5, 1 ) );
	tests.append( countTrees( field, 7, 1 ) );
	tests.append( countTrees( field, 1, 2 ) );

	answer = tests.reduce( function( previous, next) {
		return previous * next;
	},1);

	writeDump(tests);
	writeDump(answer)

	function countTrees( array field, numeric xStep, numeric yStep ) {
		var answer = 0;
		var xPos = 1;
		var yPos = 1;
		var fieldWidth = arguments.field[1].len();
		var fieldHeight = arguments.field.len();

		for ( i = 1; i < fieldHeight; i = i = i + arguments.yStep ) {
			xPos += arguments.xStep;
			if ( xPos > fieldWidth ) xPos -= fieldWidth;
			yPos += arguments.yStep;
			//if ( yPos > fieldHeight ) yPos -= fieldHeight;
			if ( mid( arguments.field[yPos], xPos, 1) == "@" ) {
				answer++;
			}

		}

		return answer;
	}
</cfscript>
