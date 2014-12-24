	<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Patronus</title>
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
		<style type="text/css">
			.col-md-3{
				padding: 0 10% 10% 0;
				box-shadow: 0 0 30px black;
			}
		</style>
	</head>
	<body>
		<div class="jumbotron">
			<div class="container">
				<div class="row">
					<div class="col-md-9">
						<h1><asset:image src="favicon.ico"width="150" height="150"/>ATRONUS</h1>
					 	<p>Es un sistema orientado a la administraci&oacuten de bienes de los distintos departamentos de la Facultad Regional Delta de la Universidad Tecnol&oacutegica Nacional.<p>
					 	<p>Usted podr&aacute llevar el control de sus bienes, conociendo y modificando el estado de cada uno.</p>
					</div>
					<div class="col-md-3">
						<div>
							<g:include controller="login" action="auth" />
						</div>
					
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
