<%@ page import="org.grails.plugins.google.visualization.data.Cell; org.grails.plugins.google.visualization.formatter.PatternFormatter; org.grails.plugins.google.visualization.formatter.NumberFormatter; org.grails.plugins.google.visualization.formatter.DateFormatter; org.grails.plugins.google.visualization.formatter.ColorRange; org.grails.plugins.google.visualization.formatter.ColorFormatter; org.grails.plugins.google.visualization.formatter.BarFormatter; org.grails.plugins.google.visualization.formatter.ArrowFormatter; org.grails.plugins.google.visualization.util.DateUtil" %>
<html>
	<head>
		<meta name="layout" content="main">
		<script type="text/javascript" src="https://www.google.com/jsapi"></script>
		<script type="text/javascript">
			google.load("visualization", "1.1", {packages:["bar"]});
			google.setOnLoadCallback(drawChart);
			function drawChart() {
				var data = new google.visualization.arrayToDataTable([
					['Estado Actual de Bienes','Cantidad por Estado'],
					["A Evaluar", ${a}],
					["En Uso", ${b}],
					["A Reparar", ${c}],
					["A Donacion", ${d}],
					["A Descarte", ${e}],
					["Baja",${f}]
				]);
				var options = {
					title: 'Cantidad de Bienes por Estado',
					legend: { position: 'none' },
					chart: { subtitle: '' },
					axes: {
						x: {
							0: { side: 'top', label: ''} // Top x-axis.
						}
					},
					bar: { groupWidth: "90%" }
				};
				var chart = new google.charts.Bar(document.getElementById('top_x_div'));
				// Convert the Classic options to Material options.
				chart.draw(data, google.charts.Bar.convertOptions(options));
			};
		</script>
	</head> 
	<body>
		<nav class="navbar navbar-default barra_acciones">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand">Estadísticas</a>
				</div>
			</div>
		</nav>	
		<div class="container-fluid" id="top_x_div" style="height: 500px; margin: 0 auto"></div>
	</body>
</html>
