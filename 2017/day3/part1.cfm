
<cfscript>

	input = 289326;
	// input = 1;
	// input = 12;
	// input = 23;
	// input = 1024;

	squareSideLength = ceiling( sqr( input ) );
	outerRingSize = squareSideLength ^ 2;
	innerRingSize = (squareSideLength - 1) ^ 2;

	middleX = ceiling( squareSideLength / 2 );
	middleY = middleX;

	if ( squareSideLength % 2 == 0 ) {
		middleY++;
	}
	steps = 0;
	x = 0;
	y = 0;

	topRightCorner = innerRingSize + squareSideLength;
	if ( topRightCorner >= input ) {
		x = squareSideLength;
		y = 1 + ( topRightCorner - input );
	} else if ( middleX != middleY && input > topRightCorner ) {
		// square number is even
		y = 1;
		x = 1 + ( outerRingSize - input );
	} else if ( middleX == middleY ) {
		// square number is odd
		bottomLeftCorner = outerRingSize - squareSideLength + 1;

		if ( bottomLeftCorner >= input ) {
			x = 1;
			y = 5 - ( bottomLeftCorner - input );
		} else {
			y = 5;
			x = 1 + ( input - bottomLeftCorner );
		}
	}

	steps = abs( x - middleX ) + abs( y - middleY );


	//writeDump( variables );


	writeOutput( "steps: " & steps );

</cfscript>