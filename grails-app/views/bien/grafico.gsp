<%@ page import="org.grails.plugins.google.visualization.data.Cell; org.grails.plugins.google.visualization.formatter.PatternFormatter; org.grails.plugins.google.visualization.formatter.NumberFormatter; org.grails.plugins.google.visualization.formatter.DateFormatter; org.grails.plugins.google.visualization.formatter.ColorRange; org.grails.plugins.google.visualization.formatter.ColorFormatter; org.grails.plugins.google.visualization.formatter.BarFormatter; org.grails.plugins.google.visualization.formatter.ArrowFormatter; org.grails.plugins.google.visualization.util.DateUtil" %>
<html>
    <head>
        <gvisualization:apiImport/>
    </head> 
   <body>

		<gvisualization:columnCoreChart elementId="barCoreChart" columns="${array0}" data="${array1}" colors="${opt}" title="Bienes por Estado Actual"/>
	
			<div id="barCoreChart"></div>
		</body>
</html>
