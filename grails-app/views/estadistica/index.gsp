<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Estadisticas</title>
		<style>
			div.google-visualization-tooltip {
				font-family: 'Roboto'
			}
			.visualization {
			    padding: 15px;
			}
		</style>
		<script type="text/javascript" src="https://www.google.com/jsapi"></script>
		<script type="text/javascript">
			google.load("visualization", "1.1", {packages:["bar"]});
			google.setOnLoadCallback(drawChart);
			$(window).resize(function() {drawChart()})
			function drawChart() {
				var data = new google.visualization.arrayToDataTable([
					['Estado','A Evaluar', 'En Uso', 'A Reparar', 'A Donacion', 'A Descarte', 'Baja'],
					['Estado', ${a}, ${b}, ${c}, ${d}, ${e}, ${f}]
				]);
				var options = {	
					legend: { position: 'right' },
					chart: { title: 'Cantidad de Bienes', subtitle: 'por Estado' },
					height: 500,
					axes: { x: { 0: { side: 'bottom', label: ''} } }
				};
				var chart1 = new google.charts.Bar(document.getElementById('div1'));
				var chart2 = new google.charts.Bar(document.getElementById('div2'));
				var chart3 = new google.charts.Bar(document.getElementById('div3'));
				// Convert the Classic options to Material options.
				chart1.draw(data, options);
				chart2.draw(data, google.charts.Bar.convertOptions(options));
				chart3.draw(data, google.charts.Bar.convertOptions(options));
			};
		</script>
	</head> 
	<body>
		<div class="container-fluid">
			<legend>Estadísticas</legend>
			<div class="row">
				<div class="col-lg-4">
					<div class="panel visualization" id="div1" style="margin:0 auto"></div>
				</div>
				<div class="col-lg-4">
					<div class="panel visualization" id="div2" style="margin:0 auto"></div>
				</div>
				<div class="col-lg-4">
					<div class="panel visualization" id="div3" style="margin:0 auto"></div>
				</div>
			</div>
		</div>		
	</body>
</html>
