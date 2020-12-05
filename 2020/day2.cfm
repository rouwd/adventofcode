<cfscript>
	fileName = replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" );
	puzzleInput = fileRead( replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" ) );
//  	puzzleInput = "1-3 a: abcde
// 1-3 b: cdefg
// 2-9 c: ccccccccc";
	//writeDump(puzzleInput);

/* part 1 answer
	answer = 0;

	puzzleInput.listEach( function( e, i, l ){
		colonPos = find( ":", e );
		dashPos = find( "-", e );
		letter = mid(e,colonPos-1,1);
		min = mid( e, 1, dashPos-1);
		max = mid( e, dashPos+1, colonPos - dashPos - 3 );
		regex = mid(e,colonPos-1,1) & "{" & replace(mid(e,1,colonPos-3),"-",",") & "}";
		// writeDump(min);
		// writeDump(max);
		password = trim(listlast( e, ":" ));
		testString = reReplace( password, "[^"&letter&"]", "", "all" );
		// writeDump(password);
		// writeDump(testString);
		if ( len(testString) >= min && len(testString) <= max ) answer++;

	}, chr( 10 ) );

	writeOutput( answer );
 */

 /* part 2 */
	answer = 0;

	puzzleInput.listEach( function( e, i, l ){
		colonPos = find( ":", e );
		dashPos = find( "-", e );
		letter = mid(e,colonPos-1,1);
		min = mid( e, 1, dashPos-1);
		max = mid( e, dashPos+1, colonPos - dashPos - 3 );
		// writeDump(min);
		// writeDump(max);
		password = trim(listlast( e, ":" ));
		matches = 0;
		// writeDump(password);
		if ( mid(password, min, 1) == letter ) matches++;
		if ( mid(password, max, 1) == letter ) matches++;
		// writeDump(matches);
		if (matches == 1 ) answer++;

	}, chr( 10 ) );

	writeOutput( answer );
</cfscript>