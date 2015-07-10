<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Patronus</title>
		<style>
			html, body { 
				height: 100%;
				text-align: center;
			}
			span.centrador { 
				height: 100%;
				vertical-align: middle;
				display: inline-block
			}
			#centrado { 
				text-align: left;
				vertical-align: middle;
				display: inline-block;
				width: 99%;
			}
		</style>
	</head>
	<body>
		<span class="centrador"></span>
		<div class="col-md-12" id="centrado">
			<h2 style="text-align:center">UTN-FRD</h2>
			<sec:ifLoggedIn>
				<div style="text-align:center">
					<p>Es un sistema orientado a la administraci&oacuten de bienes de los distintos departamentos de la Facultad Regional Delta de la Universidad Tecnol&oacutegica Nacional.<p>
					<p>Con PATRonus se podr&aacute llevar el control de los bienes, conociendo y modificando el estado de cada uno.</p>
				</div>
			</sec:ifLoggedIn>
			<g:include controller="login" action="auth"/>
		</div>
	</body>
</html>
