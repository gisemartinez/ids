<%@ page import="org.grails.plugins.google.visualization.data.Cell; org.grails.plugins.google.visualization.util.DateUtil" %>
<html>
    <head>
        <title>Google Visualization API plugin</title>
        <meta name="layout" content="main" />
        <gvisualization:apiImport/>
    </head>
   <body>
   		<h2>Este es un barCoreChart</h2>

		<gvisualization:barCoreChart elementId="barCoreChart" columns="${array0}" data="${array1}" />
		<fieldset>
			<div id="barCoreChart"></div>
		</fieldset>
		</body>
</html>
