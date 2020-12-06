<cfdirectory action="list" directory="#getDirectoryFromPath(getBaseTemplatePath())#" listinfo="name" type="file" filter="*.cfm" recurse="true" name="files">

<cfoutput query="files">
<ul>
	<li><a href="#files.name#" target="_blank">#files.name#</a>
</ul>
</cfoutput>
