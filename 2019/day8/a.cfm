
<cfscript>

input = fileRead( expandPath( "input.txt" ) );
w = 25;
h = 6;

layerSize = w * h;
layerCount = input.len() / layerSize;
layers = [];
zeroCount = layerSize;
pos = 1;
writeDump(layerSize);
// abort;

for ( i = 0; i < layerCount; i++ ) {
	layers[i+1] = mid( input, (i * layerSize) + 1, layerSize );
	onlyZeros = reReplace( layers[i+1], "[^0]", "", "ALL" );
	if ( onlyZeros.len() < zeroCount ) {
		zeroCount = onlyZeros.len();
		pos = i+1;
		writeOutput("pos" & pos & " count: " & zeroCount & "<br>");
	}
	// writeDump( layers[i+1] );
	// writeDump( reReplace( layers[i+1], "[^0]", "", "ALL" ) );
	// abort;
}
writeDump( pos );
writeDump( layers );

</cfscript>
