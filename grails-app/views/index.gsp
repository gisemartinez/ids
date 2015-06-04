<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Patronus</title>
	</head>
	<body>
		<div class="row container-fluid">
			<div class="col-md-12">
				<h2 style="text-align:center">UTN-FRD: PATRonus</h2><br>
				<sec:ifLoggedIn>
					<div style="text-align:center">
						<p>Es un sistema orientado a la administraci&oacuten de bienes de los distintos departamentos de la Facultad Regional Delta de la Universidad Tecnol&oacutegica Nacional.<p>
						<p>Con PATRonus se podr&aacute llevar el control de los bienes, conociendo y modificando el estado de cada uno.</p>
					</div>
				</sec:ifLoggedIn>
				<g:include controller="login" action="auth"/>
			</div>
		</div>
	</body>
</html>
