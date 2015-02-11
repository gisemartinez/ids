
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
				    <pre><FONT FACE="arial" SIZE=4 COLOR="black">Usted está logueado como SUPERVISOR, lo que le permite dar de alta nuevos usuarios, modificarlos y darlos de baja.
					

					
Podrá realizar seguimiento a dichos usuarios y a los bienes del área al que pertenece, pudiendo obtener reportes de los mismos.</FONT>
					</sec:ifAllGranted>
					<sec:ifAllGranted roles="ROLE_ENCARGADO">
				    <pre><FONT FACE="arial" SIZE=4 COLOR="black">Usted está logueado como encargado. Como tal, usted tendrá la facultad de realizar los cambios de estados de los bienes evaluados solicitados por sus operarios.



Podrá además realizar las altas, bajas y modificaciones de los bienes con los que cuenta su área.
					


Siendo encargado, será el responsable de administrar a los usuarios operarios y obtener reportes de sus rendimientos.</FONT>
					</sec:ifAllGranted>
					<sec:ifAllGranted roles="ROLE_OPERARIO">
				    <pre><FONT FACE="arial" SIZE=4 COLOR="black">Usted está logueado como operario. Como tal, usted podrá acceder al listado de bienes con los que cuenta su área, pudiendo así seleccionar los bienes a evaluar y realizar dicha información.



Una vez evaluados, deberá solicitar el cambio de estado a su encargado a través de la opción enviar mail.</FONT>
					</sec:ifAllGranted>
			    </p>
			  </div>

			  <!-- List group 
			  <ul class="list-group">
			  		<sec:ifAllGranted roles="ROLE_SUPERVISOR">
				    <li class="list-group-item">Cras justo odio</li>
				    <li class="list-group-item">Dapibus ac facilisis in</li>
				    <li class="list-group-item">Morbi leo risus</li>
				    <li class="list-group-item">Porta ac consectetur ac</li>
				    <li class="list-group-item">Vestibulum at eros</li>
					</sec:ifAllGranted>
					<sec:ifAllGranted roles="ROLE_ENCARGADO">
				    <li class="list-group-item">Cras justo odio</li>
				    <li class="list-group-item">Dapibus ac facilisis in</li>
				    <li class="list-group-item">Morbi leo risus</li>
				    <li class="list-group-item">Porta ac consectetur ac</li>
				    <li class="list-group-item">Vestibulum at eros</li> 
					</sec:ifAllGranted>
					<sec:ifAllGranted roles="ROLE_OPERARIO">
				    <li class="list-group-item">Cras justo odio</li>
				    <li class="list-group-item">Dapibus ac facilisis in</li>
				    <li class="list-group-item">Morbi leo risus</li>
				    <li class="list-group-item">Porta ac consectetur ac</li>
				    <li class="list-group-item">Vestibulum at eros</li>
					</sec:ifAllGranted>
			  </ul> -->
			</div>
		</div>
	</body>
</html>
