<cfscript>
	fileName = replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" );
	puzzleInput = fileRead( replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" ) );
//    	puzzleInput = "16
// 10
// 15
// 5
// 1
// 11
// 7
// 19
// 6
// 12
// 4";
// 	puzzleInput = "28
// 33
// 18
// 42
// 31
// 14
// 46
// 20
// 48
// 47
// 24
// 23
// 49
// 45
// 19
// 38
// 39
// 11
// 1
// 32
// 25
// 35
// 8
// 17
// 7
// 9
// 4
// 2
// 34
// 10
// 3";
	//writeDump(puzzleInput);

/* part 1 
	oneJolt = 0;
	threeJolt = 0;
	sortedAdapters = listToArray( puzzleInput, chr(10) );

	sortedAdapters.sort( "numeric" );
	sortedAdapters.prepend(0);
	sortedAdapters.append(sortedAdapters[-1] + 3);
	writeDump(sortedAdapters);

	for( i=1; i<sortedAdapters.len(); i++ ) {
		if ( sortedAdapters[i+1] - sortedAdapters[i] === 1 ) {
			oneJolt++;
		} else if ( sortedAdapters[i+1] - sortedAdapters[i] === 3 ) {
			threeJolt++;
		}
	}

	writeOutput("oneJolt: " & oneJolt & " threeJolt: " & threeJolt & " oneJolt * threeJolt = " & oneJolt*threeJolt & "<br>");
*/

/* part 2 */
	sortedAdapters = listToArray( puzzleInput, chr(10) );

	sortedAdapters.sort( "numeric" );
	sortedAdapters.prepend(0);
	sortedAdapters.append(sortedAdapters[-1] + 3);
	// writeDump(sortedAdapters);

	adapters = structNew("Ordered","numeric");

	for( i=1; i<=sortedAdapters.len(); i++ ) {
		if ( i == 1 ) {
			adapters[ sortedAdapters[i] ] = 1;
			continue;
		}
		adapters[ sortedAdapters[i] ] = sortedAdapters[i] - sortedAdapters[i-1];
	}
	totalPermutations = calcPermutations(adapters, sortedAdapters);

	writeDump(totalPermutations);
	//writeDump(sortedAdapters);
	writeDump(adapters);

	numeric function calcPermutations( struct adapters, array sortedAdapters ) {
		var total = createObject("java", "java.lang.Long").init(1);
		var permutations = [1,1,1,2,4,7];
		var singleJoltCount = 1;
		var factors = [];

		for ( var i=1; i<=arguments.sortedAdapters.len(); i++ ) {
			if ( adapters[ arguments.sortedAdapters[i] ] == 3 ) {
				total = total * permutations[ singleJoltCount ];
				factors.append(permutations[ singleJoltCount ]);
				//writeOutput(  )
				singleJoltCount = 1;
			}
			singleJoltCount++;
		}

		writeDump(factors);

		return total;
	}
</cfscript>
