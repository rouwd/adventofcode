<cfscript>
	fileName = replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" );
	puzzleInput = fileRead( replaceNoCase( getBaseTemplatePath(), listlast( cgi.SCRIPT_NAME, "." ), "txt" ) );
//    	puzzleInput = "ecl:gry pid:860033327 eyr:2020 hcl:##fffffd
// byr:1937 iyr:2017 cid:147 hgt:183cm

// iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
// hcl:##cfa07d byr:1929

// hcl:##ae17e1 iyr:2013
// eyr:2024
// ecl:brn pid:760753108 byr:1931
// hgt:179cm

// hcl:##cfa07d eyr:2025 pid:166559648
// iyr:2011 ecl:brn hgt:59in";
	//writeDump(puzzleInput);

/* part 1 
	answer = 0;
	passports = [];
	currentPassport = "";
	passportIndex = 1;

	puzzleInput.listEach( function( e, i, l ){
		currentLine = trim(e);
		if ( currentLine.len() == 0 ) {
			passports.append( currentPassport );
			currentPassport = "";
		} else {
			currentPassport = currentPassport & " " & currentLine;
		}
	}, chr( 10 ) );
	passports.append( currentPassport );

	for ( passport in passports ) {
		if ( validatePassport( passport ) ) {
			answer++;
		}
	}

	writeDump(passports);

	writeOutput( answer );

	function validatePassport( string passport ) {
		var byr = find( "byr", arguments.passport ) > 0;
		var iyr = find( "iyr", arguments.passport ) > 0;
		var eyr = find( "eyr", arguments.passport ) > 0;
		var hgt = find( "hgt", arguments.passport ) > 0;
		var hcl = find( "hcl", arguments.passport ) > 0;
		var ecl = find( "ecl", arguments.passport ) > 0;
		var pid = find( "pid", arguments.passport ) > 0;

		return byr && iyr && eyr && hgt && hcl && ecl && pid;

	}
*/

 /* part 2 */
/* invalid passports
puzzleInput = "eyr:1972 cid:100
hcl:##18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926

iyr:2019
hcl:##602927 eyr:1967 hgt:170cm
ecl:grn pid:012533040 byr:1946

hcl:dab227 iyr:2012
ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277

hgt:59cm ecl:zzz
eyr:2038 hcl:74454a iyr:2023
pid:3556412378 byr:2007";*/

/* valid passports 
puzzleInput = "pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980
hcl:##623a2f

eyr:2029 ecl:blu cid:129 byr:1989
iyr:2014 pid:896056539 hcl:##a97842 hgt:165cm

hcl:##888785
hgt:164cm byr:2001 iyr:2015 cid:88
pid:545766238 ecl:hzl
eyr:2022

iyr:2010 hgt:158cm hcl:##b6652a ecl:blu byr:1944 eyr:2021 pid:093154719";*/

	answer = 0;
	passports = [];
	currentPassport = "";
	passportIndex = 1;

	puzzleInput.listEach( function( e, i, l ){
		currentLine = trim(e);
		if ( currentLine.len() == 0 ) {
			passports.append( currentPassport );
			currentPassport = "";
		} else {
			currentPassport = currentPassport & " " & currentLine;
		}
	}, chr( 10 ) );
	passports.append( currentPassport );

	for ( passport in passports ) {
		if ( validatePassport( passport ) ) {
			answer++;
		}
	}

	// writeDump(passports);

	writeOutput( answer );

	function validatePassport( string passport ) {
		var byr = find( "byr", arguments.passport ) > 0;
		var iyr = find( "iyr", arguments.passport ) > 0;
		var eyr = find( "eyr", arguments.passport ) > 0;
		var hgt = find( "hgt", arguments.passport ) > 0;
		var hcl = find( "hcl", arguments.passport ) > 0;
		var ecl = find( "ecl", arguments.passport ) > 0;
		var pid = find( "pid", arguments.passport ) > 0;

		if ( byr && iyr && eyr && hgt && hcl && ecl && pid ) {
			var passportFields = {};
			var fields = listToArray( arguments.passport, " " );
			for ( var field in fields ) {
				var type = listFirst(field,":");
				var value = listLast(field,":");
				switch (type) {
					case "byr":
						byr = validateRange( value, 1920, 2002 );
						break;
					case "iyr":
						iyr = validateRange( value, 2010, 2020 );
						break;
					case "eyr":
						eyr = validateRange( value, 2020, 2030 );
						break;
					case "hgt":
						hgt = validateHeight( value );
						break;
					case "hcl":
						hcl = refind( "##[0-9a-f]{6}", value ) > 0;
						break;
					case "ecl":
						ecl = validateEyeColor( value );
						break;
					case "pid":
						pid = value.len() == 9 && refind( "[0-9]{9}", value ) > 0;
						break;
				}
			}
			return byr && iyr && eyr && hgt && hcl && ecl && pid;
		} else {
			return false;
		}

	}

	function validateRange( numeric target, numeric low, numeric high ) {
		return arguments.target >= arguments.low && arguments.target <= arguments.high;
	}

	function validateHeight( string target ) {
		var height = val(arguments.target);
		var measurement = right(arguments.target, 2);

		if ( measurement == "cm" ) {
			return height >= 150 && height <= 193;
		} else {
			return height >= 59 && height <= 76;
		}
	}

	function validateEyeColor( string target ) {
		var color = listlast(arguments.target, ":");
		var colors = ["amb","blu","brn","gry","grn","hzl","oth"];

		return color.len() == 3 && arrayFind( colors, color ) > 0;
	}


</cfscript>
