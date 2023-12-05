<cfscript>
	fileName = replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" );
	puzzleInput = fileRead( replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" ) );
// 	puzzleInput = "1abc2
// pqr3stu8vwx
// a1b2c3d4e5f
// treb7uchet";
	// puzzleInput = "two1nine
	// eightwothree
	// abcone2threexyz
	// xtwone3four
	// 4nineeightseven2
	// zoneight234
	// 7pqrstsixteen";

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
			var newE = wordsToNumbers( e );
			// writeOutput( "e: " & e & "<br>");
			// writeOutput( "newE: " & newE & "<br>");
			numbers = newE.reduce( closure, initialValue );
			// writeOutput( "numbers[1]: " & numbers[1] & "<br>");
			// writeOutput( "numbers[-1]: " & numbers[-1] & "<br>");
			calibrationValues.append( numbers[1] * 10 + numbers[-1] );
	
		}, chr( 10 ) );
	
		product = calibrationValues.sum();
		writeOutput( product );
		writeDump( calibrationValues );
	}

	function wordsToNumbers( s ){
		var m = ["one","two","three","four","five","six","seven","eight","nine"];
		var re = m.toList( "|" ).listAppend( "\d", "|" );
		// writeOutput( "re: " & re & "<br>");
		var p = reFind( re, s, 1, true );
		var n = "";
		// writedump( p );
		var c = 0;
		while ( p.pos[1] > 0 ) {
			//s = s.replace( p.match[1], m.find( p.match[1] ) );
			if ( m.find( p.match[1] ) ) {
				n &= m.find( p.match[1] );
			} else {
				n &= p.match[1];
			}
			// writeOutput( "s: " & s & "<br>");
			// writeOutput( "n: " & n & "<br>");
			p = reFind( re, s, p.pos[1]+1, true );
			// writedump( p );
			// exit;
			c++;
			if ( c > 10 ) exit;
		}
		// writeOutput( "s final: " & s & "<br>");
		return n;
	}
</cfscript>