<cffile action="read" file="#getDirectoryFromPath(getCurrentTemplatePath())#day2.txt" variable="input">


<cfscript>
inputArray = listToArray(input, "#chr(13)##chr(10)#");

counter = [ 0,0,0,0,0,0 ];

for ( instruction in inputArray ) {
	
	charCounts = {};
	for ( i = 1; i <= instruction.len(); i++ ) {
		currentCharacter = mid( instruction, i, 1 );
		//writeOutput( currentCharacter & "<br>" );
		if ( charCounts.keyExists( currentCharacter ) ) {
			charCounts[ currentCharacter ]++;
		} else {
			charCounts[ currentCharacter ] = 1;
		}
	}

	foundCounts = [ 0,0,0,0,0,0 ];
	for ( item in charCounts ) {
		if ( charCounts[ item ] > 1 && foundCounts[ charCounts[ item ] ] == 0 ) {
			counter[ charCounts[ item ] ]++;
			foundCounts[ charCounts[ item ] ] = 1;
		}
	}
}
//writeDump(counter);
total = 1;

for ( item in counter ) {
	if ( item > 0 ) {
		total *= item;
	}
}
writeDump(total);

//  part 2

inputArray.sort("text");
inputLen = inputArray[1].len();
answer = [];

for ( i=1; i < inputArray.len(); i++ ) {
	diffCount = 0;
	//writeOutput( inputArray[i] & "<br>" & inputArray[i+1] & "<br><br>" );
	for( j=1; j<= inputLen; j++ ){
		if ( mid( inputArray[i], j, 1 ) != mid( inputArray[i+1], j, 1 ) ){
			diffCount++;

			answer.append( mid( inputArray[i], j, 1 ) );
			answer.append( mid( inputArray[i+1], j, 1 ) );

			if ( diffCount > 1 ){
				//writeDump(answer);
				answer = [];
				break;
			}
		}
	}
	if ( answer.len() == 2 ) {
		writeOutput( inputArray[i] & "<br>" & inputArray[i+1] & "<br><br>" );
		break;
	}
}

writeDump(answer);

</cfscript>


