<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="title" value="Dashboard"/>
		<title>${title}</title>
		<style>
			div.google-visualization-tooltip {
				font-family: 'Roboto'
			}
			.visualization {
			    padding: 15px;
			}
			.graph-title {
				-webkit-user-select: none; -webkit-font-smoothing: antialiased; font-size: 16px;
			}
			.graph-subtitle {
				-webkit-user-select: none; -webkit-font-smoothing: antialiased; font-size: 14px; color: rgb(189, 189, 189);
			}
		</style>
		<script type="text/javascript" src="https://www.google.com/jsapi"></script>
		<script type="text/javascript">
			google.load("visualization", "1.1", {packages:["bar,corechart"]});
			google.setOnLoadCallback(drawCharts);
			$(window).resize(function() {drawCharts()})
			function drawCharts() {
				var data = new google.visualization.arrayToDataTable([
					['Estado','A Evaluar', 'En Uso', 'A Reparar', 'A Donacion', 'A Descarte', 'Baja'],
					['Estado', ${evaluar}, ${usar}, ${reparar}, ${donar}, ${descartar}, ${baja}]
				]);

				var options = {	
					legend: { position: 'right' },
					height: 500,
					axes: { x: { 0: { side: 'bottom', label: ''} } }
				};

				var chart1 = new google.charts.Bar(document.getElementById('div1'));
				
				chart1.draw(data, options);
			
				var data2 = google.visualization.arrayToDataTable([
					['Área','Cantidad de Bienes'],
					['Sistemas',${bienes_sistemas}],
					['Quimica',${bienes_quimica}],
					['Electrica',${bienes_electrica}],
					['Mecanica',${bienes_mecanica}]
				]);

				var options2 = {
					pieHole: 0.4,
					chartArea: {left:20,top:0,width:'90%',height:'90%'},
					slices: {
						4: {offset: 0.2},
						12: {offset: 0.3},
						14: {offset: 0.4},
						15: {offset: 0.5},
					},
				};

				var chart2 = new google.visualization.PieChart(document.getElementById('div2'));

				chart2.draw(data2, options2);
			}
		</script>
	</head> 
	<body>
		<div class="container">
			<div class="row">
				<div class="col s6 l3">
					<div class="card-panel brown white-text hoverable" style="position:relative">
						<p style="margin: 0">
							<span style="font-size:40px;font-weight:700">${bienes_creados}</span><br>
							bienes dados de<br>alta recientemente.
						</p>
						<i class="material-icons" style="position:absolute;bottom:calc(50% - 35px);right:15px;font-size:70px;">add_shopping_cart</i>
					</div>
				</div>
				<div class="col s6 l3">
					<div class="card-panel grey white-text hoverable" style="position:relative">
						<p style="margin: 0">
							<span style="font-size:40px;font-weight:700">${bienes_borrados}</span><br>
							bienes dados de<br>baja recientemente.
						</p>
						<i class="material-icons" style="position:absolute;bottom:calc(50% - 35px);right:15px;font-size:70px;">delete</i>
					</div>
				</div>
				<div class="col s6 l3">
					<div class="card-panel blue white-text hoverable" style="position:relative">
						<p style="margin: 0">
							<span style="font-size:40px;font-weight:700">${personas_creadas}</span><br>
							personas dadas de<br>alta recientemente.
						</p>
						<i class="material-icons" style="position:absolute;bottom:calc(50% - 35px);right:15px;font-size:70px;">person_add</i>
					</div>
				</div>
				<div class="col s6 l3">
					<div class="card-panel red white-text hoverable" style="position:relative">
						<p style="margin: 0">
							<span style="font-size:40px;font-weight:700">${personas_borradas}</span><br>
							personas dadas de<br>baja recientemente.
						</p>
						<i class="material-icons" style="position:absolute;bottom:calc(50% - 35px);right:15px;font-size:70px;">person</i>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col s12 l6">
					<div class="card-panel hoverable visualization" style="margin:0 auto">
						<p>
							<span class="graph-title">Cantidad de Bienes</span><br>
							<span class="graph-subtitle">por Estado</span><br>
						</p>
						
						<div id="div1"></div>
					</div>
				</div>
				<div class="col s12 l6">
					<div class="card-panel hoverable visualization" style="margin:0 auto">
						<p>
							<span class="graph-title">Cantidad de Bienes</span><br>
							<span class="graph-subtitle">por Área</span><br>
						</p>
						<div id="div2"></div>
					</div>
				</div>
			</div>
		</div>
		<script>$('.brand-logo').text('${title}')</script>
	</body>
</html>
