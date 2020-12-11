<cfscript>
	fileName = replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" );
	puzzleInput = fileRead( replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" ) );
//     	puzzleInput = "light red bags contain 1 bright white bag, 2 muted yellow bags.
// dark orange bags contain 3 bright white bags, 4 muted yellow bags.
// bright white bags contain 1 shiny gold bag.
// muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
// shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
// dark olive bags contain 3 faded blue bags, 4 dotted black bags.
// vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
// faded blue bags contain no other bags.
// dotted black bags contain no other bags.";
//     	puzzleInput = "shiny gold bags contain 2 dark red bags.
// dark red bags contain 2 dark orange bags.
// dark orange bags contain 2 dark yellow bags.
// dark yellow bags contain 2 dark green bags.
// dark green bags contain 2 dark blue bags.
// dark blue bags contain 2 dark violet bags.
// dark violet bags contain no other bags.";
	//writeDump(puzzleInput);

/* part 1 
	answer = 0;
	answers = [];
	bags = {};
	targetBag = "shiny gold bag";

	puzzleInput.listEach( function( e, i, l ){
		var trigger = "contain";
		var input = trim(replace(replace(e,".",""),"bags","bag","all"));
		var pos = findNoCase( trigger, input );
		var bag = trim(mid( input, 1, pos-1 ));
		var bagList = right( input, input.len() - pos - trigger.len() );
		var childBags = listToArray(bagList);

		updateBag( bags, bag, childBags );
		
	}, chr( 10 ), true );

	answers = checkBags(answers,bags,targetBag,targetBag);
	answer = answers.len();

	//writeDump( bags );
	writeDump( answers );
	writeDump( answer );

	void function updateBag( struct bags, string bag, array childBags ) {
		if ( !bags.keyExists( bag ) ) {
			bags[bag] = newBag();
		}

		for ( var childBag in childBags ) {
			childBag = trim(childBag);
			var countPos = find( " ", childBag );
			childBag = mid( childBag, countPos+1, childBag.len() );
			if ( bags[bag].children.find( childBag ) == 0 ) {
				bags[bag].children.append( childBag );
			}

			if ( !bags.keyExists( childBag ) ) {
				bags[childBag] = newBag();
			}

			if ( bags[childBag].parents.find( bag ) == 0 ) {
				bags[childBag].parents.append( bag );
			}
		}

		//writeDump(bags);

	}

	struct function newBag(){
		return {
			parents: [],
			children: []
		};
	}

	array function checkBags( array answers, struct bags, string targetBag, string currentBag ) {
		//writeOutput("currentBag: " & currentBag & "<br>");
		// if ( arguments.bags[arguments.currentBag].children.find(targetBag) && arguments.answers.find(arguments.currentBag) == 0 ) {
		// 	arguments.answers.append(arguments.currentBag);
		// }

		for ( var parent in arguments.bags[arguments.currentBag].parents ) {
			if ( arguments.answers.find(parent) == 0 )  arguments.answers.append(parent);
			arguments.answers = checkBags(arguments.answers, arguments.bags, arguments.targetBag, parent );
		}

		return arguments.answers;
	}
*/

/* part 2 */
	answer = 0;
	answers = {};
	bags = {};
	targetBag = "shiny gold bag";

	puzzleInput.listEach( function( e, i, l ){
		var trigger = "contain";
		var input = trim(replace(replace(e,".",""),"bags","bag","all"));
		var pos = findNoCase( trigger, input );
		var bag = trim(mid( input, 1, pos-1 ));
		var bagList = right( input, input.len() - pos - trigger.len() );
		var childBags = listToArray(bagList);
		
		updateBag( bags, bag, childBags );
		
	}, chr( 10 ), true );

	answer = countBags(bags,targetBag) - 1;

	// writeDump( bags );
	//writeDump( answers );
	writeDump( answer );


	void function updateBag( struct bags, string bag, array childBags ) {
		if ( !bags.keyExists( bag ) ) {
			bags[bag] = newBag();
		}

		for ( var childBag in childBags ) {
			childBag = trim(childBag);
			var countPos = find( " ", childBag );
			var bagCount = mid( childBag, 1, countPos-1 );
			childBag = mid( childBag, countPos+1, childBag.len() );
			if ( bags[bag].children.keyExists( childBag ) == 0 ) {
				bags[bag].children[childBag] = bagCount;
			// writeOutput("bagCount: " & bagCount & "<br>");
			// writeOutput("childBag: " & childBag & "<br>");
			}

			if ( !bags.keyExists( childBag ) ) {
				bags[childBag] = newBag();
			}

			if ( bags[childBag].parents.find( bag ) == 0 ) {
				bags[childBag].parents.append( bag );
			}
		}

		//writeDump(bags);

	}

	struct function newBag(){
		return {
			parents: [],
			children: {}
		};
	}

	numeric function countBags( struct bags, string currentBag ) {
		var childbagCount = 0;
		var count = 1;
		writeOutput("currentBag: " & arguments.currentBag & "<br>");
		for ( var child in arguments.bags[arguments.currentBag].children ) {
			writeOutput("child: " & child & " x " & arguments.bags[arguments.currentBag].children[child] & "<br>");
			//arguments.answer += 
			count += arguments.bags[arguments.currentBag].children[child] * countBags( arguments.bags, child );
		}

		return count;
	}


</cfscript>
