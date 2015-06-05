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
		
		<asset:stylesheet src="application.css"/>
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
		<link href='//cdn.jsdelivr.net/bootstrap.material-design/0.2.2/css/material-wfont.min.css' rel='stylesheet' type='text/css'>
		<link href='//cdn.jsdelivr.net/bootstrap.material-design/0.2.2/css/ripples.min.css' rel='stylesheet' type='text/css'>

		<asset:javascript src="application.js"/>
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
		<script src="//cdn.jsdelivr.net/bootstrap.material-design/0.2.2/js/material.min.js"></script>
		<script src="//cdn.jsdelivr.net/bootstrap.material-design/0.2.2/js/ripples.min.js"></script>
		<g:layoutHead/>
		<style>
			@media (min-width: 1199px) {body {padding-top: 75px}}
			@media (max-width: 1199px) {body {padding-top: 65px}}
			
			/*Color y tamaño de los iconos*/
			#ic_bienes{color:#bcaaa4; font-size: 2em;}
			#ic_estadisticas{color:#A5D6A7; font-size: 2em;}
			#ic_personas{color:#90CAF9; font-size: 2em;}
			#ic_areas{color:#FFAB91; font-size: 2em;}
			#ic_ubicaciones{color:#e57373; font-size: 2em;}
			#ic_perfil{font-size: 2em;}
			
			.mfb-component--br a:hover, .mfb-component--br a:focus{color: white}

			.list-group .list-group-item .list-group-item-heading {
				font-size: 16px;
			}

			#barra_principal {
				/*background-color: #880E4F;*/
				transition: background .5s ease-in-out;}

			select{margin-top: 5px;}

			/*Barra Secundaria*/
			.barra_acciones{position: fixed; top: 60px; width: 100%; z-index: 900;}
			@media (max-width: 1199px) {.barra_acciones {top: 50px}}
		</style>
	</head>
	<body>
		<sec:ifLoggedIn>
			<div class="navbar navbar-default navbar-fixed-top barra_principal" id="barra_principal">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse1">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/${grailsApplication.config.nombreAplicacion}" title="Inicio">PATRonus</a>
				</div>
				<div class="navbar-collapse collapse navbar-responsive-collapse1">
					<ul class="nav navbar-nav">
						<li>
							<a href="/${grailsApplication.config.nombreAplicacion}/bien/index" id="ic_bienes" title="Bienes" class="mdi-device-now-widgets"></a>
						</li>
						<sec:ifAnyGranted roles="ROLE_SUPERVISOR,ROLE_ENCARGADO">
							<li>
								<a href="/${grailsApplication.config.nombreAplicacion}/bien/grafico" id="ic_estadisticas" title="Estad&iacutesticas" class="mdi-action-assessment"></a>
							</li>
							<sec:ifAllGranted roles="ROLE_SUPERVISOR">
							<li>
								<a href="/${grailsApplication.config.nombreAplicacion}/persona/index" id="ic_personas" title="Usuarios" class="mdi-social-group"></a>
							</li>
							</sec:ifAllGranted>
							<li>
								<a href="/${grailsApplication.config.nombreAplicacion}/area/index" id="ic_areas" title="Areas" class="mdi-action-store"></a>
							</li>
							<li>
								<a href="/${grailsApplication.config.nombreAplicacion}/ubicacion/index" id="ic_ubicaciones" title="Ubicaciones" class="mdi-maps-place"></a>
							</li>
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
								<li><a href="/${grailsApplication.config.nombreAplicacion}/permisos">Permisos</a></li>
								<li class="divider"></li>
								<li><a href="javascript:document.form_logout.submit()">Cerrar sesi&oacuten</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</sec:ifLoggedIn>

		<form name="form_logout" method="POST" action="${createLink(controller:'logout')}"></form>

		<g:layoutBody/>
		<script>
			$.material.init();
		</script>

		<!--<script>
			$( '#ic_bienes' ).hover( 
				function(){
					$('#barra_principal').css('background','#795548')
				},
				function(){
					$('#barra_principal').css('background','white')
				}
			)
		</script>-->
		<script>
			$(function(){
				$(window).resize(function() {
					if($(window).width() > 1199){
						$('body').css('padding-top','75px')
					}
					else {
						$('body').css('padding-top','65px')
					}
				});
			});
		</script>
		<script>
			$(function(){
				var prevScroll = 0, curDir = 'down', prevDir = 'up';
				$(window).scroll(function(){
					if($(this).scrollTop() > prevScroll){
						curDir = 'down';
						if(curDir != prevDir){
							if($(window).width() > 1199){
								$('.barra_principal').stop();
								$('.barra_principal').animate({ top: '-60px' }, 'slow');
								$('body').css('padding-top','15px')
							}
							else {
								$('.barra_principal').stop();
								$('.barra_principal').animate({ top: '-50px' }, 'slow');
								$('body').css('padding-top','15px')
							}
							$('.mfb-component--br').stop();
							$('.mfb-component--br').attr('data-mfb-state', 'closed');
							$('.mfb-component--br').animate({ bottom: '-200px' }, 'slow');
							prevDir = curDir;
						}
					} else {
						curDir = 'up';
						if(curDir != prevDir){
							if($(window).width() > 1199){
								$('.barra_principal').stop();
								$('.barra_principal').animate({ top: '0px' }, 'slow');
								$('body').css('padding-top','75px')
							}
							else {
								$('.barra_principal').stop();
								$('.barra_principal').animate({ top: '0px' }, 'slow');
								$('body').css('padding-top','65px')
							}
							$('.mfb-component--br').stop();
							$('.mfb-component--br').animate({ bottom: '0px' }, 'slow');
							prevDir = curDir;
						}
					}
					prevScroll = $(this).scrollTop();
				});
			})
		</script>
	</body>
</html>
