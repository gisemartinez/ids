<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> -->
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<link href='http://fonts.googleapis.com/css?family=Roboto:300' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
		<g:layoutHead/>
		<style>
			.fieldcontain{
				margin-bottom: 10px;
			}
			.jumbotron{background-color: white;}
			.barra_principal{
				border-radius: 0px;
				background-color:#009688;
			}
			body { padding-top: 120px; }
			.barra_principal .md{color:white}
			.barra_principal a:hover .md{color:#FFD740}
			.barra_acciones{
				position: fixed;
				top: 51px;
				left: 0px;
				border-radius: 0px;
				min-height: 10px;
				width: 100%;
				z-index: 900;
			}
		</style>
	</head>
	<body>
		<nav class="navbar navbar-default navbar-fixed-top barra_principal" >
			<div class="container-fluid">
				<div class="navbar-header">
					<sec:ifLoggedIn>
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</sec:ifLoggedIn>
					<a class="navbar-brand" href="/${grailsApplication.config.nombreAplicacion}" title="Inicio">
						PATRonus
					</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<sec:ifLoggedIn>
						<ul class="nav navbar-nav">
							<li>
								<a href="/${grailsApplication.config.nombreAplicacion}/bien/index" id="ic_bienes" title="Bienes">
									<i class="md md-work"></i>
								</a>
							</li>
							<sec:ifAllGranted roles="ROLE_SUPERVISOR">
								<li>
									<a href="/${grailsApplication.config.nombreAplicacion}/bien/grafico" id="ic_estadisticas" title="Estad&iacutesticas">
										<i class="md md-assessment"></i>
									</a>
								</li>
							
								<li>
									<a href="/${grailsApplication.config.nombreAplicacion}/persona/index" id="ic_personas" title="Usuarios">
										<i class="md md-group"></i>
									</a>
								</li>
								<li>
									<a href="/${grailsApplication.config.nombreAplicacion}/area/index" id="ic_areas" title="Areas">
										<i class="md md-store"></i>
									</a>
								</li>
								<li>
									<a href="/${grailsApplication.config.nombreAplicacion}/ubicacion/index" id="ic_ubicaciones" title="Ubicaciones">
										<i class="md md-place"></i>
									</a>
								</li>
							</sec:ifAllGranted>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown perfil">
								<a href="#"><sec:username/> <i class="md md-person"></i></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="/${grailsApplication.config.nombreAplicacion}/permisos">Permisos</a></li>
									<li><a href="javascript:document.submitForm.submit()">Cerrar sesi&oacuten</a></li>
								</ul>
							</li>
						</ul>
					</sec:ifLoggedIn>
				</div>
			</div>
		</nav>
		<form name="submitForm" method="POST" action="${createLink(controller:'logout')}"></form>
		<g:layoutBody/>
	</body>
</html>
