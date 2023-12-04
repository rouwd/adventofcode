<cfscript>
	fileName = replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" );
	puzzleInput = fileRead( replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" ) );
// 	puzzleInput = "1abc2
// pqr3stu8vwx
// a1b2c3d4e5f
// treb7uchet";
	puzzleInput = "two1nine
	eightwothree
	abcone2threexyz
	xtwone3four
	4nineeightseven2
	zoneight234
	7pqrstsixteen";

	product = 0;
	calibrationValues = [];

	// aSolution( puzzleInput );
	bSolution( puzzleInput );

	function aSolution( puzzleInput ){
		puzzleInput.listEach( function( e, i, l ){
			var numbers = [];
			var initialValue = [];
			var closure = function( iv, str, pos, fullStr ) {
				if ( reFind( "\d", str ) ) {
					return iv.append( val(str) );
				} else {
					return iv;
				}
			}
			numbers = e.reduce( closure, initialValue );
			calibrationValues.append( numbers[1] * 10 + numbers[-1] );
	
		}, chr( 10 ) );
	
		product = calibrationValues.sum();
		writeOutput( product );
		writeDump( calibrationValues );
	}
	
	function bSolution( puzzleInput ){
		puzzleInput.listEach( function( e, i, l ){
			var numbers = [];
			var initialValue = [];
			var closure = function( iv, str, pos, fullStr ) {
				if ( reFind( "\d", str ) ) {
					return iv.append( val(str) );
				} else {
					return iv;
				}
			}
			var newE = replaceList( e, "one,two,three,four,five,six,seven,eight,nine", "1,2,3,4,5,6,7,8,9" );
			numbers = newE.reduce( closure, initialValue );
			calibrationValues.append( numbers[1] * 10 + numbers[-1] );
	
		}, chr( 10 ) );
	
		product = calibrationValues.sum();
		writeOutput( product );
		writeDump( calibrationValues );
	}
</cfscript>