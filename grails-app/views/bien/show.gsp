<%@ page import="abm.Bien" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bien.label', default: 'Bien')}" />
		<title><g:message code="Bien creado"/></title>
		<style>
			div.google-visualization-tooltip {
				font-family: 'Roboto'
			}
			#visualization {
			    width:100%;
			    height:100%;
			}
		</style>		
		<script type="text/javascript" src="https://www.google.com/jsapi"></script>
		<script type="text/javascript">
			var cant = "${cant}"
			if (cant) {
				google.load("visualization", "1.1", {packages:["timeline"]});
				google.setOnLoadCallback(drawChart);

				$(window).resize(function() {drawChart()})
				
				var actores = "${actores}"
					var exit = 0;
					while (exit != 1) {
						if (actores == actores.replace(", ",",")) exit = 1
						else actores = actores.replace(", ",",")
					}
				
				var fechas = "${fechas}"
					var exit = 0;
					while (exit != 1) {
						if (fechas == fechas.replace(", ",",")) exit = 1
						else fechas = fechas.replace(", ",",")
					}

				var valoresNuevos = "${valoresNuevos}"
					var exit = 0;
					while (exit != 1) {						
						if (valoresNuevos == valoresNuevos.replace(", ",",")) exit = 1
						else valoresNuevos = valoresNuevos.replace(", ",",")
					}

				var fech = [""], newvals = [""], act = [""]; 
				for (var i = 0; i < cant; i++) {
					fech[i] = [""];	act[i] = [""]; newvals[i] = [""];
				}

				for (var i = 0, x = 0; i < fechas.length; i++) {
					switch (fechas[i]) {
						case "[":
							//Comienzo del string.
							break;
						case "]":
							//Fin del string.
							break;
						case ",":
							//Separador de fechas.
							x++;
							break;
						default:
							fech[x] += fechas[i];
							break;
					}
				}
				
				for (var i = 0, x = 0; i < actores.length; i++) {
					switch (actores[i]) {
						case "[":
							break;
						case "]":
							break;
						case ",":
							x++;
							break;
						default:
							act[x] += actores[i];
							break;
					}
				}
				
				for (var i = 0, x = 0; i < valoresNuevos.length; i++) {
					switch (valoresNuevos[i]) {
						case "[":
							break;
						case "]":
							break;
						case ",":
							x++;
							break;
						default:
							newvals[x] += valoresNuevos[i];
							break;
					}
				}

				function anio(fecha) {return parseInt(moment(fecha).format("YYYY"))}
				function mes(fecha) {return parseInt(moment(fecha).format("M"))}
				function dia(fecha) {return parseInt(moment(fecha).format("D"))}

				function drawChart() {
					var container = document.getElementById('visualization');
					var chart = new google.visualization.Timeline(container);
					var dataTable = new google.visualization.DataTable();

					dataTable.addColumn({ type: 'string', id: 'Estado' });
					dataTable.addColumn({ type: 'string', id: 'Actor' });
					dataTable.addColumn({ type: 'date', id: 'Comienzo' });
					dataTable.addColumn({ type: 'date', id: 'Fin' });
					//Añado los filas con los datos.
					for (var i = 0; i < cant; i++) {
						if (i < (cant - 1) )
							dataTable.addRow([
								newvals[i],
								act[i],
								new Date(anio(fech[i]), mes(fech[i]), dia(fech[i])),
								new Date(anio(fech[i+1]), mes(fech[i+1]), dia(fech[i+1]))
							])
						else {
							var today = new Date()
							dataTable.addRow([
								newvals[i],
								act[i],
								new Date(anio(fech[i]), mes(fech[i]), dia(fech[i])),
								new Date(today.getFullYear(), today.getMonth() + 1, today.getDate())
							])
						}
					};

					var options = {
						timeline: {
							rowLabelStyle: { fontName: 'Roboto', fontSize: 14, color: 'black' },
							barLabelStyle: { fontName: 'Roboto', fontSize: 14 }
						}
					}
					chart.draw(dataTable,options);
				}				
			}			
		</script>
		<script>
			function showQR() {
				window.open("https://chart.googleapis.com/chart?chs=250x250&cht=qr&chl="+window.location.href,"","width=300,height=300");
			}
		</script>
	</head>
	<body onload="drawChart()">
		<!--Volver al listado-->
		<ul class="mfb-component--br" data-mfb-toggle="hover">
			<li class="mfb-component__wrap">
				<g:link action="index" class="mfb-component__button--main">
					<i class="mfb-component__main-icon--resting mdi-action-list"></i>
					<i class="mfb-component__main-icon--active mdi-action-list"></i>
				</g:link>
			</li>
		</ul>
		<div class="container-fluid">
			<!--Alertas-->
			<g:if test="${flash.message}">
				<div class="alert alert-dismissible alert-success" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</i></span>
					</button>
					${flash.message}
				</div>
			</g:if>
			<div class="row">
				<div class="col-lg-6">
					<legend>Detalle de Bien</legend>
					<div class="panel panel-default" style="margin:0 auto 20px">
						<div class="panel-body">
							<div class="list-group">
								<img src='https://chart.googleapis.com/chart?chs=250x250&cht=qr&chl="+window.location.href' alt="qrcode" 
								onclick="showQR()" class="pull-right" width="50px">
								<div class="list-group-item">
									<div class="row-content">
										<g:if test="${bienInstance?.codigoDeSerie}">
											<h4 class="list-group-item-heading"><g:message code="bien.codigoDeSerie.label" default="Id Bien"/></h4>
											<p class="list-group-item-text"><g:fieldValue bean="${bienInstance}" field="codigoDeSerie"/></p>
										</g:if>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row-content">
										<g:if test="${bienInstance?.nombreBien}">
											<h4 class="list-group-item-heading"><g:message code="bien.nombreBien.label" default="Denominaci&oacuten"/></h4>
											<p class="list-group-item-text"><g:fieldValue bean="${bienInstance}" field="nombreBien"/></p>
										</g:if>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row-content">
										<g:if test="${bienInstance?.descripcion}">
											<h4 class="list-group-item-heading"><g:message code="bien.descripcion.label" default="Descripci&oacuten"/></h4>
											<p class="list-group-item-text"><g:fieldValue bean="${bienInstance}" field="descripcion"/></p>
										</g:if>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row-content">
										<g:if test="${bienInstance?.responsableBien}">
											<h4 class="list-group-item-heading"><g:message code="bien.responsableBien.label" default="Responsable"/></h4>
											<p class="list-group-item-text">
												<g:link controller="Persona" action="show" id="${bienInstance?.responsableBien?.id}">${bienInstance?.responsableBien?.encodeAsHTML()}</g:link>
											</p>
										</g:if>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row-content">
										<g:if test="${bienInstance?.tipo}">
											<h4 class="list-group-item-heading"><g:message code="bien.tipo.label" default="Tipo"/></h4>
											<p class="list-group-item-text">
												<g:link controller="tipo" action="show" id="${bienInstance?.tipo?.id}">${bienInstance?.tipo?.encodeAsHTML()}</g:link>
											</p>
										</g:if>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row-content">
										<g:if test="${bienInstance?.estado}">
											<h4 class="list-group-item-heading"><g:message code="bien.estado.label" default="Estado"/></h4>
											<p class="list-group-item-text">
												<g:link controller="estado" action="show" id="${bienInstance?.estado?.id}">${bienInstance?.estado?.encodeAsHTML()}</g:link>
											</p>
										</g:if>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row-content">
										<g:if test="${bienInstance?.ubicacion}">
											<h4 class="list-group-item-heading"><g:message code="bien.ubicacion.label" default="Ubicaci&oacuten"/></h4>
											<p class="list-group-item-text">
												<g:link controller="ubicacion" action="show" id="${bienInstance?.ubicacion?.id}">${bienInstance?.ubicacion?.encodeAsHTML()}</g:link>
											</p>
										</g:if>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row-content">
										<g:if test="${bienInstance?.area}">
											<h4 class="list-group-item-heading"><g:message code="bien.area.label" default="Area"/></h4>
											<p class="list-group-item-text">
												<g:link controller="area" action="show" id="${bienInstance?.area?.id}">${bienInstance?.area?.encodeAsHTML()}</g:link>
											</p>
										</g:if>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-footer">
							<g:submitButton form="form_delete" name="delete" value="Borrar" class="btn btn-default delete"/>
							<g:link action="edit" id="${bienInstance.id}" class="btn btn-primary">Editar</g:link>
							<g:form url="[resource:bienInstance, action:'delete']" method="DELETE" id='form_delete'></g:form>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<g:if test="${cant}">
						<legend>Historial de Cambios</legend>
						<div id="visualization"></div>
					</g:if>
				</div>
			</div>
		</div>
	</body>
</html>
