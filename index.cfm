<cfdirectory action="list" directory="C:\CommandBox\aoc" listinfo="name" type="file" filter="*.cfm" recurse="true" name="files">

<cfdump var="#getBaseTemplatePath()#">

<cfoutput query="files">
<ul>
	<li><a href="#files.name#" target="_blank">#files.name#</a>
</ul>
</cfoutput>
