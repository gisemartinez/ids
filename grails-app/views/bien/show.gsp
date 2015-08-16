<%@ page import="abm.Bien" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bien.label', default: 'Bien')}" />
		<title><g:message code="Bien creado"/></title>
		<script type="text/javascript" src="https://www.google.com/jsapi"></script>
		<script type="text/javascript">
			var cant = "${cant}"
			if (cant) {
				google.load("visualization", "1.1", {packages:["timeline"]});
				google.setOnLoadCallback(drawChart);

				var actores = quitarEspacios("${actores}").replace("[","").replace("]","").split(","),
				fechas = quitarEspacios("${fechas}").replace("[","").replace("]","").split(","),
				valoresNuevos = quitarEspacios("${valoresNuevos}").replace("[","").replace("]","").split(",")

				$(window).resize(function() {drawChart()})

				function quitarEspacios(string){
					var exit = 0
					while (exit != 1) {
					if (string == string.replace(", ",",")) exit = 1
						else string = string.replace(", ",",")
					}
					return string
				}

				function cantidadEstados(){
					for (aux=[],i=0;i<valoresNuevos.length;i++) {
						if (aux.indexOf(valoresNuevos[i]) < 0) aux.push(valoresNuevos[i])
					}
					return aux.length
				}

				function anio(fecha) {return parseInt(fecha.substr(0,4))}

				function mes(fecha) {return parseInt(fecha.substr(5,2))}

				function dia(fecha) {return parseInt(fecha.substr(8,2))}

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
								valoresNuevos[i],
								actores[i],
								new Date(anio(fechas[i]), mes(fechas[i]), dia(fechas[i])),
								new Date(anio(fechas[i+1]), mes(fechas[i+1]), dia(fechas[i+1]))
							])
						else {
							var today = new Date()
							dataTable.addRow([
								valoresNuevos[i],
								actores[i],
								new Date(anio(fechas[i]), mes(fechas[i]), dia(fechas[i])),
								new Date(today.getFullYear(), today.getMonth() + 1, today.getDate())
							])
						}
					};

					var options = {
						timeline: {
							rowLabelStyle: { fontName: 'Roboto', fontSize: 14, color: 'black' },
							barLabelStyle: { fontName: 'Roboto', fontSize: 14 }

						},height: 47*cantidadEstados()+55
					}
					chart.draw(dataTable,options);
					$('#visualization').css('height',47*cantidadEstados()+30)
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
		<g:link action="index" class="btn-floating btn-large waves-effect waves-light red" style="position: fixed; bottom: 15px; right: 15px;">
			<i class="material-icons">list</i>
		</g:link>
		<div class="container">
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
				<div class="col s12 offset-m1 m10 offset-l2 l8">
					<div class="card">
						<img src='https://chart.googleapis.com/chart?chs=250x250&cht=qr&chl="+window.location.href' alt="qrcode" id="qrcode" class="materialboxed">
						<div class="card-image">
							<asset:image src="sample-1.jpg"/>
							<span class="card-title">Detalle de Bien</span>
							<!-- <i class="material-icons" style="
								left: calc((100% - 80px)/2);
								top: calc((100% - 80px)/2);
								height: 80px;
								width: 80px;
								font-size: 50px;
								line-height: 80px;
								position: absolute;
								margin: 15px;
								color: white;
								text-align: center;
								cursor: pointer;
								border: 1px solid white;
								border-radius: 50px;
								background-color: rgba(255, 255, 255, 0.25);
							">photo_camera</i> -->
						</div>
						<div class="card-content">
							<div class="row">
								<div class="col s6 l6">
									<g:if test="${bienInstance?.codigoDeSerie}">
										<label><g:message code="bien.codigoDeSerie.label" default="Id Bien"/></label>
										<p><g:fieldValue bean="${bienInstance}" field="codigoDeSerie"/></p>
									</g:if>
								</div>
								<div class="col s6 l6">
									<g:if test="${bienInstance?.nombreBien}">
										<label><g:message code="bien.nombreBien.label" default="Denominaci&oacuten"/></label>
										<p><g:fieldValue bean="${bienInstance}" field="nombreBien"/></p>
									</g:if>
								</div>
							</div>
							<div class="row">
								<div class="col s12 l12">
									<g:if test="${bienInstance?.descripcion}">
										<label><g:message code="bien.descripcion.label" default="Descripci&oacuten"/></label>
										<p><g:fieldValue bean="${bienInstance}" field="descripcion"/></p>
									</g:if>
								</div>
							</div>
							<div class="row">
								<div class="col s6 l6">
									<g:if test="${bienInstance?.tipo}">
										<label><g:message code="bien.tipo.label" default="Tipo"/></label>
										<p>
											<g:link controller="tipo" action="show" id="${bienInstance?.tipo?.id}">${bienInstance?.tipo?.encodeAsHTML()}</g:link>
										</p>
									</g:if>
								</div>
								<div class="col s6 l6">
									<g:if test="${bienInstance?.estado}">
										<label><g:message code="bien.estado.label" default="Estado"/></label>
										<p>
											<g:link controller="estado" action="show" id="${bienInstance?.estado?.id}">${bienInstance?.estado?.encodeAsHTML()}</g:link>
										</p>
									</g:if>
								</div>
							</div>
							<div class="row">
								<div class="col s6 l6">
									<g:if test="${bienInstance?.ubicacion}">
										<label><g:message code="bien.ubicacion.label" default="Ubicaci&oacuten"/></label>
										<p>
											<g:link controller="ubicacion" action="show" id="${bienInstance?.ubicacion?.id}">${bienInstance?.ubicacion?.encodeAsHTML()}</g:link>
										</p>
									</g:if>
								</div>
								<div class="col s6 l6">
									<g:if test="${bienInstance?.area}">
										<label><g:message code="bien.area.label" default="Area"/></label>
										<p>
											<g:link controller="area" action="show" id="${bienInstance?.area?.id}">${bienInstance?.area?.encodeAsHTML()}</g:link>
										</p>
									</g:if>
								</div>
							</div>
							<div class="row">
								<div class="col s12 l6">
									<g:if test="${bienInstance?.responsableBien}">
										<label><g:message code="bien.responsableBien.label" default="Responsable"/></label>
										<p>
											<g:link controller="Persona" action="show" id="${bienInstance?.responsableBien?.id}">${bienInstance?.responsableBien?.encodeAsHTML()}</g:link>
										</p>
									</g:if>
								</div>
								<div class="col s12 l6"></div>
							</div>
							<div class="row">
								<div class="col s12 l12">
									<g:if test="${cant}">
										<label>Historial de Cambios</label>
										<div id="visualization"></div>
									</g:if>
								</div>
							</div>
						</div>
						<div class="card-action">
							<g:submitButton form="form_delete" name="delete" value="Borrar" class="btn-flat white delete"/>
							<g:link action="edit" id="${bienInstance.id}">Editar</g:link>
							<g:form url="[resource:bienInstance, action:'delete']" method="DELETE" id='form_delete'></g:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
