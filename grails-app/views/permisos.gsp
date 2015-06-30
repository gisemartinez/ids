<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="Permisos"/></title>
		<style>
			p {text-align: justify}
			.list-group .list-group-item .row-content {width: 100%}
		</style>
	</head>
	<body>
		<div class="container-fluid">
			<legend>Permisos</legend>
			<div class="panel panel-default">
				<div class="panel-body">
					<ul class="list-group">
						<sec:ifAllGranted roles="ROLE_SUPERVISOR">
							<div class="list-group">
								<div class="list-group-item">
									<div class="row-content">
										<h4 class="list-group-item-heading">SUPERVISOR</h4>
										<p>Usted est&aacute logueado como supervisor, lo que le permite dar de alta nuevos usuarios, modificarlos y darlos de baja.<br>Podr&aacute realizar seguimiento a dichos usuarios y a los bienes del &aacuterea al que pertenece, pudiendo obtener reportes de los mismos.</p>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row-content">
										<h4 class="list-group-item-heading">Bienes</h4>
										<p class="list-group-item-text">Crear, modificar y eliminar bienes.</p>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row-content">
										<h4 class="list-group-item-heading">Estadísticas</h4>
										<p class="list-group-item-text">Ver gráfico de bienes cargados.</p>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row-content">
										<h4 class="list-group-item-heading">Personas</h4>
										<p class="list-group-item-text">Crear, modificar y eliminar personas.</p>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row-content">
										<h4 class="list-group-item-heading">Áreas</h4>
										<p class="list-group-item-text">Dar de alta y modificar áreas.</p>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row-content">
										<h4 class="list-group-item-heading">Ubicaciones</h4>
										<p class="list-group-item-text">Dar de alta y modificar ubicaciones.</p>
									</div>
								</div>
							</div>
						</sec:ifAllGranted>
						<sec:ifAllGranted roles="ROLE_ENCARGADO">
							<div class="list-group">
								<div class="list-group-item">
									<div class="row-content">
										<h4 class="list-group-item-heading">ENCARGADO</h4>
										<p>Usted está logueado como encargado. Como tal, usted tendr&aacute la facultad de realizar los cambios de estados de los bienes evaluados solicitados por sus operarios.<br>Podr&aacute adem&aacutes realizar las altas, bajas y modificaciones de los bienes con los que cuenta su &aacuterea.<br>Siendo encargado, ser&aacute el responsable de administrar a los usuarios operarios y obtener reportes de sus rendimientos.</p>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row-content">
										<h4 class="list-group-item-heading">Bienes</h4>
										<p class="list-group-item-text">Crear, modificar y eliminar bienes.</p>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row-content">
										<h4 class="list-group-item-heading">Estadísticas</h4>
										<p class="list-group-item-text">Ver gráfico de bienes cargados.</p>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row-content">
										<h4 class="list-group-item-heading">Áreas</h4>
										<p class="list-group-item-text">Dar de alta y modificar áreas.</p>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row-content">
										<h4 class="list-group-item-heading">Ubicaciones</h4>
										<p class="list-group-item-text">Dar de alta y modificar ubicaciones.</p>
									</div>
								</div>
							</div>
						</sec:ifAllGranted>
						<sec:ifAllGranted roles="ROLE_OPERARIO">
							<div class="list-group">
								<div class="list-group-item">
									<div class="row-content">
										<h4 class="list-group-item-heading">OPERARIO</h4>
										<p>Usted est&aacute logueado como operario. Como tal, usted podr&aacute acceder al listado de bienes con los que cuenta su &aacuterea, pudiendo as&iacute seleccionar los bienes a evaluar y realizar dicha informaci&oacuten.<br>Una vez evaluados, deber&aacute solicitar el cambio de estado a su encargado a trav&eacutes de la opci&oacuten enviar mail.</p>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row-content">
										<h4 class="list-group-item-heading">Bienes</h4>
										<p class="list-group-item-text">Crear, modificar y eliminar bienes.</p>
									</div>
								</div>
							</div>
						</sec:ifAllGranted>
					</ul>
				</div>
			</div>
		</div>
	</body>
</html>
