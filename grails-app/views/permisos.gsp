
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="Permisos"/></title>
	</head>
	<body>
		<nav class="navbar navbar-default barra_acciones">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand">Permisos</a>
				</div>
			</div>
		</nav>
		<div class="container-fluid">
			<div class="panel panel-default">
				<div class="panel-heading">
					<sec:ifAllGranted roles="ROLE_SUPERVISOR">
						ROLE_SUPERVISOR
					</sec:ifAllGranted>
					<sec:ifAllGranted roles="ROLE_ENCARGADO">
						ROLE_ENCARGADO
					</sec:ifAllGranted>
					<sec:ifAllGranted roles="ROLE_OPERARIO">
						ROLE_OPERARIO
					</sec:ifAllGranted>
<<<<<<< HEAD
				</div>
				<div class="panel-body">
					<sec:ifAllGranted roles="ROLE_SUPERVISOR">
						Usted est&aacute logueado como SUPERVISOR, lo que le permite dar de alta nuevos usuarios, modificarlos y darlos de baja.
						Podr&aacute realizar seguimiento a dichos usuarios y a los bienes del &aacuterea al que pertenece, pudiendo obtener reportes de los mismos.
						<br><br>
=======

			  </div>
			  <div class="panel-body">
			    <p>
			  		<sec:ifAllGranted roles="ROLE_SUPERVISOR">
				    <pre><H5>Usted est&aacute logueado como SUPERVISOR, lo que le permite dar de alta nuevos usuarios, modificarlos y darlos de baja.
					

					
Podr&aacute realizar seguimiento a dichos usuarios y a los bienes del &aacuterea al que pertenece, pudiendo obtener reportes de los mismos.</H5>
					</sec:ifAllGranted>
					<sec:ifAllGranted roles="ROLE_ENCARGADO">
				    <pre><H5>Usted está logueado como encargado. Como tal, usted tendr&aacute la facultad de realizar los cambios de estados de los bienes evaluados solicitados por sus operarios.



Podr&aacute adem&aacutes realizar las altas, bajas y modificaciones de los bienes con los que cuenta su &aacuterea.
					


Siendo encargado, ser&aacute el responsable de administrar a los usuarios operarios y obtener reportes de sus rendimientos.</H5>
					</sec:ifAllGranted>
					<sec:ifAllGranted roles="ROLE_OPERARIO">
				    <pre><H5>Usted est&aacute logueado como operario. Como tal, usted podr&aacute acceder al listado de bienes con los que cuenta su &aacuterea, pudiendo as&iacute seleccionar los bienes a evaluar y realizar dicha informaci&oacuten.



Una vez evaluados, deber&aacute solicitar el cambio de estado a su encargado a trav&eacutes de la opci&oacuten enviar mail.</H5>
					</sec:ifAllGranted>
			    </p>
			  </div>

			  <!-- List group -->
			  <ul class="list-group">
			  		<sec:ifAllGranted roles="ROLE_SUPERVISOR">
				    <li class="list-group-item">Bienes: crear modificar y eliminar bienes</li>
				    <li class="list-group-item">Estad&iacutesticas: ver gr&aacutefico de bienes cargados</li>
				    <li class="list-group-item">Personas: crear modificar y eliminar personas</li>
				    <li class="list-group-item">&Aacutereas: dar de alta y modificar &aacutereas</li>
				    <li class="list-group-item">Ubicaciones: dar de alta y modificar ubicaciones</li>
>>>>>>> afa574e5a095d9dc940c066eb79768c68c415804
					</sec:ifAllGranted>
					<sec:ifAllGranted roles="ROLE_ENCARGADO">
						Usted está logueado como encargado. Como tal, usted tendr&aacute la facultad de realizar los cambios de estados de los bienes evaluados solicitados por sus operarios.
						Podr&aacute adem&aacutes realizar las altas, bajas y modificaciones de los bienes con los que cuenta su &aacuterea.
						Siendo encargado, ser&aacute el responsable de administrar a los usuarios operarios y obtener reportes de sus rendimientos.
						<br><br>
					</sec:ifAllGranted>
					<sec:ifAllGranted roles="ROLE_OPERARIO">
						Usted est&aacute logueado como operario. Como tal, usted podr&aacute acceder al listado de bienes con los que cuenta su &aacuterea, pudiendo as&iacute seleccionar los bienes a evaluar y realizar dicha informaci&oacuten.
						Una vez evaluados, deber&aacute solicitar el cambio de estado a su encargado a trav&eacutes de la opci&oacuten enviar mail.
						<br><br>
					</sec:ifAllGranted>
					<ul class="list-group">
						<sec:ifAllGranted roles="ROLE_SUPERVISOR">
							<li class="list-group-item">Bienes: crear modificar y eliminar bienes</li>
							<li class="list-group-item">Estad&iacutesticas: ver gr&aacutefico de bienes cargados</li>
							<li class="list-group-item">Personas: crear modificar y eliminar personas</li>
							<li class="list-group-item">&Aacutereas: dar de alta y modificar &aacutereas</li>
							<li class="list-group-item">Ubicaciones: dar de alta y modificar ubicaciones</li>
						</sec:ifAllGranted>
						<sec:ifAllGranted roles="ROLE_ENCARGADO">
							<li class="list-group-item">Bienes: crear modificar y eliminar bienes</li>
							<li class="list-group-item">Estad&iacutesticas: ver gr&aacutefico de bienes cargados</li>
							<li class="list-group-item">&Aacutereas: dar de alta y modificar &aacutereas</li>
							<li class="list-group-item">Ubicaciones: dar de alta y modificar ubicaciones</li>
						</sec:ifAllGranted>
						<sec:ifAllGranted roles="ROLE_OPERARIO">
							<li class="list-group-item">Bienes: modificar bienes</li>
						</sec:ifAllGranted>
					</ul>
				</div>
			</div>
		</div>
	</body>
</html>
