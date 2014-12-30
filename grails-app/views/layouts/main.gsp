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
		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>

		<g:layoutHead/>
		<script type="text/javascript">
			

		</script>
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
			.jumbotron{
				background-color: white;
			}
		</style>
	</head>
	<body>
		<nav class="navbar navbar-default navbar-static-top" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="/${grailsApplication.config.nombreAplicacion}">Patronus</a>
				</div>
<div></div>
				<!-- Collect the nav links, forms, and other content for toggling -->

				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<sec:ifLoggedIn>
					<ul class="nav navbar-nav">
						<li class="dropdown bienes">
							<a href="/${grailsApplication.config.nombreAplicacion}/bien/index" class="dropdown-toggle" data-toggle="dropdown">Bienes <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a class="list" href="/${grailsApplication.config.nombreAplicacion}/bien/index">Listado</a></li>
								<li><a class="new" href="/${grailsApplication.config.nombreAplicacion}/bien/create">Cargar</a></li>
							</ul>
						</li>
						<sec:ifAllGranted roles="ROLE_ADMIN">
						<li class="dropdown persona">
							<a href="/${grailsApplication.config.nombreAplicacion}/persona/index" class="dropdown-toggle" data-toggle="dropdown">Usuarios<span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a class="list" href="/${grailsApplication.config.nombreAplicacion}/persona/index">Listado</a></li>
								<li><a class="new" href="/${grailsApplication.config.nombreAplicacion}/persona/create">Cargar</a></li>
							</ul>
						</li>
						<li class="dropdown areas">
							<a href="/${grailsApplication.config.nombreAplicacion}/area/index" class="dropdown-toggle" data-toggle="dropdown">Departamentos <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a class="list" href="/${grailsApplication.config.nombreAplicacion}/area/index">Listado</a></li>
								<li><a class="new" href="/${grailsApplication.config.nombreAplicacion}/area/create">Cargar</a></li>
							</ul>
						</li>
						<li class="dropdown estados">
							<a href="/${grailsApplication.config.nombreAplicacion}/estado/index" class="dropdown-toggle" data-toggle="dropdown">Estados <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a class="list" href="/${grailsApplication.config.nombreAplicacion}/estado/index">Listado</a></li>
								<li><a class="new" href="/${grailsApplication.config.nombreAplicacion}/estado/create">Cargar</a></li>
							</ul>
						</li>
						
						<li class="dropdown ubicaciones">
							<a href="/${grailsApplication.config.nombreAplicacion}/ubicacion/index" class="dropdown-toggle" data-toggle="dropdown">Ubicaciones <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a class="list" href="/${grailsApplication.config.nombreAplicacion}/ubicacion/index">Listado</a></li>
								<li><a class="new" href="/${grailsApplication.config.nombreAplicacion}/ubicacion/create">Cargar</a></li>
							</ul>
						</li>
						</sec:ifAllGranted>
					</ul>
					</sec:ifLoggedIn>
					<sec:ifLoggedIn>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown perfil">							
								<a href="#"><sec:username/></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="${grailsApplication.config.my.user.username}/">Permisos</a></li>
									<li class="divider"></li>
									<li>
										<form name="submitForm" method="POST" action="${createLink(controller:'logout')}">
											<input type="hidden" name="" value=""> 
											<a href="javascript:document.submitForm.submit()" class="cerrarsesion">Cerrar sesi&oacuten</a>
										</form> 
										<!-- <g:link controller="logout">Cerrar sesi&oacuten</g:link> -->
									</li>
								</ul>
						</li>
					</ul>
					</sec:ifLoggedIn>
				</div>
			</div>
		</nav>
		<g:layoutBody/>
	</body>
</html>
