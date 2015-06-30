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
		<!-- Hojas de estilo -->
		<link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'>
		<!-- <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/css/material-fullpalette.css'> -->
		<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/css/material.css'>
		<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/css/ripples.css'>
		<link rel='stylesheet' href='//jasny.github.io/bootstrap/dist/css/jasny-bootstrap.min.css'>
		<!-- <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css"> -->
		<asset:stylesheet src="application.css"/>
		<asset:stylesheet src="bootstrap-material-datetimepicker.css"/>
		<asset:stylesheet src="fab.css"/>
		<!-- Scripts -->
		<asset:javascript src="application.js"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
		<script src='//cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/js/material.min.js'></script>
		<script src='//cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/js/ripples.min.js'></script>
		<asset:javascript src="jasny-bootstrap.js"/>
		<!--
			Con el agregado de:
				$('.table-responsive').css('overflow','hidden')
			en la funcion disableScrolling, y:
				$('body').css('overflow', 'auto')
				$('.table-responsive').css('overflow','auto')
    		en la funcion hide.
		-->
		<asset:javascript src="moment-with-locales.min.js"/>
		<asset:javascript src="bootstrap-material-datetimepicker.js"/>
		<asset:javascript src="fab.js"/>
		<g:layoutHead/>
	</head>
	<body>
		<sec:ifLoggedIn>
		<div class="navbar navbar-default navbar-fixed-top">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="offcanvas" data-target=".navmenu">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<g:link class="navbar-brand">PATRonus</g:link>					
			</div>
			<div class="navbar-collapse collapse navbar-responsive-collapse">
				<ul class="nav navbar-nav">
					<li><g:link controller='bien' action='index' class="mdi-device-now-widgets bien"></g:link></li>
					<sec:ifAnyGranted roles="ROLE_SUPERVISOR,ROLE_ENCARGADO">
						<li><g:link controller='estadistica' action='index' class="mdi-action-assessment estadistica"></g:link></li>
						<sec:ifAllGranted roles="ROLE_SUPERVISOR">
							<li><g:link controller='persona' action='index' class="mdi-social-group persona"></g:link></li>
						</sec:ifAllGranted>
						<li><g:link controller='area' action='index' class="mdi-action-store area"></g:link></li>
						<li><g:link controller='ubicacion' action='index' class="mdi-maps-place ubicacion"></g:link></li>
					</sec:ifAnyGranted>
				</ul>
				<ul class="nav navbar-nav navbar-right" style="margin-right:0">
					<li><a id="ic_notificaciones" class="mdi-social-notifications"><span class="badge">3</span></a></li>
					<li class="dropdown perfil">
						<a id="ic_perfil" class="mdi-social-person"></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="" class="mdi-action-account-circle" style="font-size:2em"></a></li>
							<li class="dropdown-header">Usuario</li>
							<li><a><sec:username/></a></li>
							<sec:ifAllGranted roles="ROLE_SUPERVISOR">
								<li class="dropdown-header">Rol: Supervisor</li>
							</sec:ifAllGranted>
							<sec:ifAllGranted roles="ROLE_ENCARGADO">
								<li class="dropdown-header">Rol: Encargado</li>
							</sec:ifAllGranted>
							<sec:ifAllGranted roles="ROLE_OPERARIO">
								<li class="dropdown-header">Rol: Operario</li>
							</sec:ifAllGranted>
							<li><g:link resource='permisos'>Permisos</g:link></li>
							<li class="divider"></li>
							<li><a href="javascript:document.form_logout.submit()">Cerrar sesi&oacuten</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<div class="navmenu navmenu-default navmenu-fixed-left offcanvas-sm hidden-md hidden-lg">
			<!-- <a class="navmenu-brand" href="#">PATRonus</a> -->
			<ul class="nav navmenu-nav">
				<li class="account-circle"><a class="mdi-action-account-circle account-circle" style="font-size:3em;"></a></li>
				<li class="dropdown perfil">
					<a class="dropdown-toggle" data-toggle="dropdown" style="background-color:#009688;color:white;">
						<sec:username/> <b class="caret"></b>
					</a>
					<ul class="dropdown-menu navmenu-nav">
						<sec:ifAllGranted roles="ROLE_SUPERVISOR">
							<li class="dropdown-header">Rol: Supervisor</li>
						</sec:ifAllGranted>
						<sec:ifAllGranted roles="ROLE_ENCARGADO">
							<li class="dropdown-header">Rol: Encargado</li>
						</sec:ifAllGranted>
						<sec:ifAllGranted roles="ROLE_OPERARIO">
							<li class="dropdown-header">Rol: Operario</li>
						</sec:ifAllGranted>
						<li><g:link resource='permisos'>Permisos</g:link></li>
						<li><a href="javascript:document.form_logout.submit()">Cerrar sesi&oacuten</a></li>
					</ul>
				</li>
				<li class="bien">
					<span class="navmenu-icon"><i class="mdi-device-now-widgets"></i></span>
					<g:link controller='bien' action='index' class="navmenu-link-with-icon">Bienes</g:link>
				</li>
				<sec:ifAnyGranted roles="ROLE_SUPERVISOR,ROLE_ENCARGADO">
				<li class="estadistica">
					<span class="navmenu-icon"><i class="mdi-action-assessment"></i></span>
					<g:link controller='estadistica' action='index' class="navmenu-link-with-icon">Estadisticas</g:link></li>
				<li class="persona">
					<span class="navmenu-icon"><i class="mdi-social-group"></i></span>
					<g:link controller='persona' action='index' class="navmenu-link-with-icon">Personas</g:link>
				</li>
				<li class="area">
					<span class="navmenu-icon"><i class="mdi-action-store"></i></span>
					<g:link controller='area' action='index' class="navmenu-link-with-icon">Áreas</g:link>
				</li>
				<li class="ubicacion">
					<span class="navmenu-icon"><i class="mdi-maps-place"></i></span>
					<g:link controller='ubicacion' action='index' class="navmenu-link-with-icon">Ubicaciones</g:link>
				</li>
				</sec:ifAnyGranted>
			</ul>
		</div>
		<form name="form_logout" method="POST" action="${createLink(controller:'logout')}"></form>
		</sec:ifLoggedIn>
		<g:layoutBody/>
	</body>
</html>
