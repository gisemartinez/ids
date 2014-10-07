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
		
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
		<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
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
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/abm">Patronus</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->

				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<sec:ifLoggedIn>
					<ul class="nav navbar-nav">
						<li class="dropdown bienes">
							<a href="/abm/bien/index" class="dropdown-toggle" data-toggle="dropdown">Bienes <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a class="list" href="/abm/bien/index">Listado</a></li>
								<li><a class="new" href="/abm/bien/create">Cargar</a></li>
							</ul>
						</li>
						<li class="dropdown usuarios">
							<a href="/abm/usuario/index" class="dropdown-toggle" data-toggle="dropdown">Usuarios <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a class="list" href="/abm/usuario/index">Listado</a></li>
								<li><a class="new" href="/abm/usuario/create">Cargar</a></li>
							</ul>
						</li>
						<li class="dropdown areas">
							<a href="/abm/area/index" class="dropdown-toggle" data-toggle="dropdown">Areas <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a class="list" href="/abm/area/index">Listado</a></li>
								<li><a class="new" href="/abm/area/create">Cargar</a></li>
							</ul>
						</li>
						<li class="dropdown estados">
							<a href="/abm/estado/index" class="dropdown-toggle" data-toggle="dropdown">Estados <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a class="list" href="/abm/estado/index">Listado</a></li>
								<li><a class="new" href="/abm/estado/create">Cargar</a></li>
							</ul>
						</li>
						<li class="dropdown ubicaciones">
							<a href="/abm/ubicacion/index" class="dropdown-toggle" data-toggle="dropdown">Ubicaciones <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a class="list" href="/abm/ubicacion/index">Listado</a></li>
								<li><a class="new" href="/abm/ubicacion/create">Cargar</a></li>
							</ul>
						</li>
					</ul>
					</sec:ifLoggedIn>
					<sec:ifLoggedIn>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Buscar...">
						</div>
						<button type="submit" class="btn btn-primary search"></button>
					</form>
					</sec:ifLoggedIn>
					<ul class="nav navbar-nav navbar-right">
						<!-- <li><a href="#">Link</a></li> -->
						<li class="dropdown perfil">
							<sec:ifNotLoggedIn>
								<g:link controller='login' action='auth'>Login</g:link>
							</sec:ifNotLoggedIn>
							<sec:ifLoggedIn>
								<a href="#"><sec:username/></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#">Permisos</a></li>
									<li class="divider"></li>
									<li>
										<form name="submitForm" method="POST" action="${createLink(controller:'logout')}">
											<input type="hidden" name="" value=""> 
											<a href="javascript:document.submitForm.submit()" class="cerrarsesion">Cerrar sesi&oacuten</a>
										</form> 
										<!-- <g:link controller="logout">Cerrar sesi&oacuten</g:link> -->
									</li>
								</ul>
							</sec:ifLoggedIn>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<g:layoutBody/>
	</body>
</html>
