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

		<link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
		<asset:stylesheet src="application.css"/>

		<asset:javascript src="application.js"/>
		<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

		<link rel="stylesheet" href="../../../assets/material-design-iconic-font/css/material-design-iconic-font.min.css">

		<g:layoutHead/>
		<style>

			.fieldcontain{
				margin-bottom: 10px;
			}
			button.save{
				float: right;				
				margin: 5px;
			}
			button.delete{
				float: right;
				margin: 5px;				
			}
			a.edit{
				float: right;
				margin: 5px;
			}
			a.cancel{
				float: right;
				margin: 5px;
			}
			.cerrarsesion{
				display: block;
				padding: 3px 20px;
				clear: both;
				font-weight: 400;
				line-height: 1.42857143;
				color: #333;
				white-space: nowrap;
			}
			a.cerrarsesion:hover{
				color: #262626;
				text-decoration: none;
				background-color: #f5f5f5;
			}
			
			.jumbotron{background-color: white;}

			.barra_principal{
				border-radius: 0px;
				background-color:#009688;
			}

			.ic_bienes:hover{
				color: #FFEB3B;
			}

			body { padding-top: 70px; }
			
			.barra_principal .md{color:white}

			.barra_principal a:hover .md{color:#FFEB3B}


		</style>
	</head>
	<body>
		<nav class="navbar navbar-default navbar-fixed-top barra_principal" >
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/${grailsApplication.config.nombreAplicacion}" title="Inicio">
						PATRonus
					</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<sec:ifLoggedIn>
						<ul class="nav navbar-nav">
							<li class="dropdown bienes">
								<a href="/${grailsApplication.config.nombreAplicacion}/bien/index" title="Bienes">
									<i class="md md-work"></i>
								</a>
								
							</li>
							<sec:ifAllGranted roles="ROLE_SUPERVISOR">
								<li class="dropdown persona">
									<a href="/${grailsApplication.config.nombreAplicacion}/persona/index" title="Usuarios">
										<i class="md md-group"></i>
									</a>
									
								</li>
								<li class="dropdown areas">
									<a href="/${grailsApplication.config.nombreAplicacion}/area/index" title="Areas">
										<i class="md md-store"></i>
									</a>
								</li>
								<!-- <li class="dropdown estados">
									<a href="/${grailsApplication.config.nombreAplicacion}/estado/index" class="dropdown-toggle" data-toggle="dropdown">Estados <span class="caret"></span></a>
									<ul class="dropdown-menu" role="menu">
										<li><a class="list" href="/${grailsApplication.config.nombreAplicacion}/estado/index">Listado</a></li>
										<li><a class="new" href="/${grailsApplication.config.nombreAplicacion}/estado/create">Cargar</a></li>
									</ul>
								</li> -->
								
								<li class="dropdown ubicaciones">
									<a href="/${grailsApplication.config.nombreAplicacion}/ubicacion/index" title="Ubicaciones">
										<i class="md md-place"></i>
									</a>
								</li>
							</sec:ifAllGranted>
						</ul>
					</sec:ifLoggedIn>
					<ul class="nav navbar-nav navbar-right">
						<sec:ifLoggedIn>
							<li class="dropdown perfil">
								<a href="#"><sec:username/> <i class="md md-person"></i></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="${grailsApplication.config.my.user.username}/">Permisos</a></li>
									<li>
										<form name="submitForm" method="POST" action="${createLink(controller:'logout')}">
											<input type="hidden" name="" value=""> 
											<a href="javascript:document.submitForm.submit()" class="cerrarsesion">Cerrar sesi&oacuten</a>
										</form> 
										<!-- <g:link controller="logout">Cerrar sesi&oacuten</g:link> -->
									</li>
								</ul>
							</li>
						</sec:ifLoggedIn>
					</ul>
				</div>
			</div>
		</nav>
		<g:layoutBody/>
	</body>
</html>
