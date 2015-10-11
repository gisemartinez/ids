<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="title" value="Permisos"/>
		<title>${title}</title>
		<style>
			p {text-align: justify}
			.list-group .list-group-item .row-content {width: 100%}
			table .material-icons{font-size: 14px}
		</style>
	</head>
	<body>
		<sec:ifLoggedIn>
			<div class="container">
				<div class="row">
					<div class="col s12 offset-m1 m10 offset-l2 l8">
						<div class="card-panel">
							<p>Usted esta logueado como 
							<sec:ifAllGranted roles="ROLE_SUPERVISOR">
								<b class="blue-text">supervisor</b>, lo que le permite dar de alta nuevos usuarios, modificarlos y darlos de baja.<br>Podr&aacute realizar seguimiento a dichos usuarios y a los bienes del &aacuterea al que pertenece, pudiendo obtener reportes de los mismos.
							</sec:ifAllGranted>
							<sec:ifAllGranted roles="ROLE_ENCARGADO">
								<b class="blue-text">encargado</b>. Como tal, usted tendr&aacute la facultad de realizar los cambios de estados de los bienes evaluados solicitados por sus operarios.<br>Podr&aacute adem&aacutes realizar las altas, bajas y modificaciones de los bienes con los que cuenta su &aacuterea.<br>Siendo encargado, ser&aacute el responsable de administrar a los usuarios operarios y obtener reportes de sus rendimientos.
							</sec:ifAllGranted>
							<sec:ifAllGranted roles="ROLE_OPERARIO">
								<b class="blue-text">operario</b>. Como tal, usted podr&aacute acceder al listado de bienes con los que cuenta su &aacuterea, pudiendo as&iacute seleccionar los bienes a evaluar y realizar dicha informaci&oacuten.<br>Una vez evaluados, deber&aacute solicitar el cambio de estado a su encargado a trav&eacutes de la opci&oacuten enviar mail.
							</sec:ifAllGranted>
							</p>
							<p>Sus permisos son detallados a continuación:</p>
							<table class="centered responsive-table">
								<thead>
									<tr>
										<th>Bienes</th>
										<th>Dashboard</th>
										<th>Personas</th>
										<th>Áreas</th>
										<th>Ubicaciones</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><i class="material-icons">
											<sec:ifAnyGranted roles="ROLE_SUPERVISOR,ROLE_ENCARGADO,ROLE_OPERARIO">add remove create</sec:ifAnyGranted>
										</i></td>
										<td><i class="material-icons">
											<sec:ifAnyGranted roles="ROLE_SUPERVISOR,ROLE_ENCARGADO">remove_red_eye</sec:ifAnyGranted>
										</i></td>
										<td><i class="material-icons">
											<sec:ifAnyGranted roles="ROLE_SUPERVISOR,ROLE_ENCARGADO">add remove create</sec:ifAnyGranted>
										</i></td>
										<td><i class="material-icons">
											<sec:ifAllGranted roles="ROLE_SUPERVISOR">add create</sec:ifAllGranted>
										</i></td>
										<td><i class="material-icons">
											<sec:ifAllGranted roles="ROLE_SUPERVISOR">add create</sec:ifAllGranted>
										</i></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<script>$('.brand-logo').text('${title}')</script>
		</sec:ifLoggedIn>
	</body>
</html>
