
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="Permisos"/></title>
	</head>
	<body>
		<div class="row">
			<div class="panel panel-default">
			  <!-- Default panel contents -->
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

			  </div>
			  <div class="panel-body">
			    <p>
			  		<sec:ifAllGranted roles="ROLE_SUPERVISOR">
				    <pre><H3>Usted est&aacute logueado como SUPERVISOR, lo que le permite dar de alta nuevos usuarios, modificarlos y darlos de baja.
					

Podr&aacute realizar seguimiento a dichos usuarios y a los bienes del &aacuterea al que pertenece, pudiendo obtener reportes de los mismos.</H3>
					</sec:ifAllGranted>
					<sec:ifAllGranted roles="ROLE_ENCARGADO">
				    <pre><H3>Usted está logueado como encargado. Como tal, usted tendr&aacute la facultad de realizar los cambios de estados de los bienes evaluados solicitados por sus operarios.


Podr&aacute adem&aacutes realizar las altas, bajas y modificaciones de los bienes con los que cuenta su &aacuterea.
					


Siendo encargado, ser&aacute el responsable de administrar a los usuarios operarios y obtener reportes de sus rendimientos.</H3>
					</sec:ifAllGranted>
					<sec:ifAllGranted roles="ROLE_OPERARIO">
				    <pre><H3>Usted est&aacute logueado como operario. Como tal, usted podr&aacute acceder al listado de bienes con los que cuenta su &aacuterea, pudiendo as&iacute seleccionar los bienes a evaluar y realizar dicha informaci&oacuten.


Una vez evaluados, deber&aacute solicitar el cambio de estado a su encargado a trav&eacutes de la opci&oacuten enviar mail.</H3>
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
					</sec:ifAllGranted>
					<sec:ifAllGranted roles="ROLE_ENCARGADO">
				    <li class="list-group-item">Bienes: crear modificar y eliminar bienes</li>
				    <li class="list-group-item">Estad&iacutesticas: ver gr&aacutefico de bienes cargados</li>
				    <li class="list-group-item">&Aacutereas: dar de alta y modificar &aacutereas</li>
				    <li class="list-group-item">Ubicaciones: dar de alta y modificar ubicaciones</li>
				   <!-- <li class="list-group-item">Vestibulum at eros</li> -->
					</sec:ifAllGranted>
					<sec:ifAllGranted roles="ROLE_OPERARIO">
				    <li class="list-group-item">Bienes: modificar bienes</li>
				  <!--  <li class="list-group-item">Dapibus ac facilisis in</li>
				    <li class="list-group-item">Morbi leo risus</li>
				    <li class="list-group-item">Porta ac consectetur ac</li>
				    <li class="list-group-item">Vestibulum at eros</li> -->
					</sec:ifAllGranted>
			  </ul> -->
			</div>
		</div>
	</body>
</html>
