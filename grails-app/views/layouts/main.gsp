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
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.0/css/materialize.min.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
		<asset:stylesheet src="application.css"/>
		<asset:stylesheet src="fab.css"/>
		<!-- Scripts -->
		<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.0/js/materialize.min.js"></script>
		<asset:javascript src="application.js"/></script>
		
		<g:set var="userId" value="${sec.loggedInUserInfo(field:'id')}" />

		<g:layoutHead/>

	</head>
	<body>
		<sec:ifLoggedIn>
		
			<div class="navbar-fixed" style="position:fixed">
				<nav class="teal">
					<div class="nav-wrapper">
						<ul class="left hide-on-med-and-down">
							<li>
								<g:link controller='bien' action='index' class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Bienes">
									<i class="material-icons">widgets</i>
								</g:link>
							</li>
							<li>
								<g:link controller='estadistica' action='index' class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Estadisticas">
									<i class="material-icons">assessment</i>
								</g:link>
							</li>
							<li>
								<g:link controller='persona' action='index' class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Personas">
									<i class="material-icons">supervisor_account</i>
								</g:link>
							</li>
							<li>
								<g:link controller='area' action='index' class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Areas">
									<i class="material-icons">store</i>
								</g:link>
							</li>
							<li>
								<g:link controller='ubicacion' action='index' class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Ubicaciones">
									<i class="material-icons">location_on</i>
								</g:link>
							</li>
						</ul>
						<ul id="slide-out" class="side-nav">
							<li>
								<g:link controller='bien' action='index' class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Bienes">
									<i class="material-icons">widgets</i>
								</g:link>
							</li>
							<li>
								<g:link controller='estadistica' action='index' class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Estadisticas">
									<i class="material-icons">assessment</i>
								</g:link>
							</li>
							<li>
								<g:link controller='persona' action='index' class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Personas">
									<i class="material-icons">supervisor_account</i>
								</g:link>
							</li>
							<li>
								<g:link controller='area' action='index' class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Areas">
									<i class="material-icons">store</i>
								</g:link>
							</li>
							<li>
								<g:link controller='ubicacion' action='index' class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Ubicaciones">
									<i class="material-icons">location_on</i>
								</g:link>
							</li>
							<li><a>First Sidebar Link</a></li>
							<li><a>Second Sidebar Link</a></li>
							<li class="no-padding">
								<ul class="collapsible collapsible-accordion">
									<li>
										<a class="collapsible-header">Dropdown<i class="mdi-navigation-arrow-drop-down"></i></a>
										<div class="collapsible-body">
											<ul>
												<li><a href="#!">First</a></li>
											</ul>
										</div>
									</li>
								</ul>
							</li>
						</ul>
						
						<a href="#" data-activates="slide-out" class="button-collapse"><i class="material-icons">menu</i></a>
						<a href="#" class="brand-logo center">PATRonus</a>

						
						<ul class="right hide-on-med-and-down">
							<li>
								<a class="dropdown-button" data-activates="dropdown1"><sec:username/><i class="material-icons right">arrow_drop_down</i></a>
								<ul id="dropdown1" class="dropdown-content">
									<!-- <sec:ifAllGranted roles="ROLE_SUPERVISOR">
										<li>Rol: Supervisor</li>
									</sec:ifAllGranted>
									<sec:ifAllGranted roles="ROLE_ENCARGADO">
										<li>Rol: Encargado</li>
									</sec:ifAllGranted>
									<sec:ifAllGranted roles="ROLE_OPERARIO">
										<li>Rol: Operario</li>
									</sec:ifAllGranted> -->
									<li><g:link resource='permisos'>Permisos</g:link></li>
									<li class="divider"></li>
									<li><a href="javascript:document.form_logout.submit()">Cerrar sesi&oacuten</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</nav>
			</div>
			
			<!-- <g:formRemote name="form_refresh_notifications" update="notifications" url="[controller: 'bien', action:'noticias']"></g:formRemote> 

			<script>
			 	(function(){
			 		$('#form_refresh_notifications').submit()
			 		setTimeout(arguments.callee, 60000);
			 	})();
			</script>

			-->
			
			<form name="form_logout" method="POST" action="${createLink(controller:'logout')}"></form>
		</sec:ifLoggedIn>
		
		<g:layoutBody/>
	</body>
</html>
