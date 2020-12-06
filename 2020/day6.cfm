<cfscript>
	fileName = replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" );
	puzzleInput = fileRead( replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" ) );
//    	puzzleInput = "abc

// a
// b
// c

// ab
// ac

// a
// a
// a
// a

// b";
	//writeDump(puzzleInput);

/* part 1
	answer = 0;
	groups = [];

	groups.append( newGroup() );
	puzzleInput.listEach( function( e, i, l ){
		var answers = trim(e);
		// writeOutput(answers & " : " & answers.len() & "<br>");
		if ( answers.len() == 0 ) {
			groups.append( newGroup() );
		} else {
			updateGroup( groups[-1], answers );
		}
		
	}, chr( 10 ), true );

	for ( group in groups ) {
		answer += listLen(structKeyList(group)) - 1;
	}

	writeDump( groups );
	writeDump( answer );
 */

/* part 2 */
	answer = 0;
	groups = [];

	groups.append( newGroup() );
	puzzleInput.listEach( function( e, i, l ){
		var answers = trim(e);
		// writeOutput(answers & " : " & answers.len() & "<br>");
		if ( answers.len() == 0 ) {
			groups.append( newGroup() );
		} else {
			updateGroup( groups[-1], answers );
		}
		
	}, chr( 10 ), true );

	for ( group in groups ) {
		keys = listToArray(structKeyList(group));
		target = group.members;
		for ( key in keys ) {
			if ( key == "members" ) {
				continue;
			} else {
				if ( group[key] == target ) {
					answer++;
				}
			}
		}
	}

	//writeDump( groups );
	writeDump( answer );


	void function updateGroup( struct group, string answers ) {
		arguments.group.members++;
		var question = "";

		for ( var i = 1; i <= arguments.answers.len(); i++ )  {
			question = mid( arguments.answers, i, 1 );
			if ( ! arguments.group.keyExists( question ) ) {
				arguments.group[ question ] = 1;
			} else {
				arguments.group[ question ]++;
			}
		}

	}

	struct function newGroup(){
		return {
			members: 0
		};
	}



</cfscript>
