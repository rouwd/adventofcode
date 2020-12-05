
<cfscript>

input = listToArray( fileRead( expandPath( "input.txt" ) ), chr(10) );

/*

R75,D30,R83,U83,L12,D49,R71,U7,L72
U62,R66,U55,R34,D71,R55,D58,R83 = 610 steps
R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51
U98,R91,D20,R16,D67,R40,U7,R15,U6,R7 = 410 steps

*/
// input = ["R8,U5,L5,D3","U7,R6,D4,L4"];
// input = ["R75,D30,R83,U83,L12,D49,R71,U7,L72","U62,R66,U55,R34,D71,R55,D58,R83"];
// input = ["R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51","U98,R91,D20,R16,D67,R40,U7,R15,U6,R7"];

wires = [];

for ( i=1; i <= input.len(); i++ ) {

	wire = listToArray( input[i] );
	// writeDump( wire );
	wires[i] = [];
	//writeDump(wires);

	currentPos = {
		x: 0,
		y: 0
	}
	wirePos = [0,0];
	for ( j=1; j<=wire.len(); j++ ) {
		node = {
			letter: left( wire[j], 1),
			number: mid( wire[j], 2, wire[j].len() )
		};

		switch ( node.letter ) {
			case "L":
				wires[i].append( addLine( currentPos.x, currentPos.y, currentPos.x - node.number, currentPos.y, node.number ) );
				currentPos.x -= node.number;
				break;
			case "R":
				wires[i].append( addLine( currentPos.x, currentPos.y, currentPos.x + node.number, currentPos.y, node.number ) );
				currentPos.x += node.number;
				break;
			case "U":
				wires[i].append( addLine( currentPos.x, currentPos.y, currentPos.x, currentPos.y + node.number, node.number ) );
				currentPos.y += node.number;
				break;
			case "D":
				wires[i].append( addLine( currentPos.x, currentPos.y, currentPos.x, currentPos.y - node.number, node.number ) );
				currentPos.y -= node.number;
				break;
		}

	}

	// writeDump(wires);
	//abort;
}

distance = 999999999;
wireADistance = 0;
for ( lineA in wires[1] ) {
	wireADistance += lineA.length;
	// writeOutput("A: " & wireADistance & "<br>");
	wireBDistance = 0;
	for ( lineB in wires[2] ) {
		wireBDistance += lineB.length;
		// writeOutput("B: " & wireBDistance & "<br>");
		if ( lineA.start.x == lineA.end.x ) {
			if ( numberIsBetween( lineA.start.x, lineB.start.x, lineB.end.x ) && numberIsBetween( lineB.start.y, lineA.start.y, lineA.end.y ) ) {
				if ( lineA.start.x != 0 && lineB.start.y != 0 ){
					writeOutput( "x " & lineA.start.x & " is between " & lineB.start.x & ' and ' & lineB.end.x & ": (" & lineA.start.x & "," & lineB.start.y & ")<br>" );
					distance = min( distance, wireADistance - lineA.length + abs( lineA.start.y - lineB.start.y ) + wireBDistance - lineB.length + abs( lineB.start.x - lineA.start.x ) );
					writeOutput(distance & "<br>");
				}
			}
		} else {

			if ( numberIsBetween( lineA.start.y, lineB.start.y, lineB.end.y )  && numberIsBetween( lineB.start.x, lineA.start.x, lineA.end.x ) ) {
				if ( lineB.start.x != 0 && lineA.start.y != 0 ){
					writeOutput( "y " & lineA.start.y & " is between " & lineB.start.y & ' and ' & lineB.end.y & ": (" & lineB.start.x & "," & lineA.start.y & ")<br>" );
					distance = min( distance, wireADistance - lineA.length + abs( lineA.start.x - lineB.start.x ) + wireBDistance - lineB.length + abs( lineB.start.y - lineA.start.y ) );
					writeOutput(distance & "<br>");
				}
			}
		}
	}
}
// writeDump( wires );

writeDump( distance );

function addLine( startX, startY, endX, endY, length ) {
	return {
		start: {
			x: startX,
			y: startY
		},
		end: {
			x: endX,
			y: endY
		},
		length: length
	}
}

function numberIsBetween( n, a, b ) {
	if ( a < b ) {
		return a <= n && n <= b;
	} else {
		return b <= n && n <= a;
	}
}
</cfscript>
