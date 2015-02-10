
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
				    Texto explicativo del rol. Este rol tiene acceso a:
					</sec:ifAllGranted>
					<sec:ifAllGranted roles="ROLE_ENCARGADO">
				    Texto explicativo del rol. Este rol tiene acceso a:
					</sec:ifAllGranted>
					<sec:ifAllGranted roles="ROLE_OPERARIO">
				    Texto explicativo del rol. Este rol tiene acceso a:
					</sec:ifAllGranted>
			    </p>
			  </div>

			  <!-- List group -->
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
			  </ul>
			</div>
		</div>
	</body>
</html>
