<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	
		<g:layoutHead/>
		<script type="text/javascript">
			$(document).ready(
			function(){

				//
				//bootstrap
				//

				//a todos los inputs (menos a los submits) le agrego la clase form-control
				$('input').addClass("form-control")
				$('input:submit').removeClass("form-control")
				//a todas las tablas le agrego la clase table
				$('table').addClass("table")
				//agrego iconos a los botones
				// $('a.home').prepend("<span class='glyphicon glyphicon-home'>&nbsp</span>")
				
				// $('a.usuarios').prepend("<span class='glyphicon glyphicon-user'>&nbsp</span>")

				$('.delete').append("<i align='center' class='glyphicon glyphicon-remove'>&nbsp</i>")
				$('a.edit').prepend("<span align='center' class='glyphicon glyphicon-pencil'>&nbsp</span>")
				$('a.cancel').prepend("<span align='center' class='glyphicon glyphicon-remove'>&nbsp</span>")
				$('a.list').prepend("<span class='glyphicon glyphicon-book'>&nbsp</span>")
				$('a.new').prepend("<span class='glyphicon glyphicon-upload'>&nbsp</span>")
				$('.perfil a').first().prepend("<span class='glyphicon glyphicon-user'>&nbsp</span>")

				//
				//Evitar comportamiento extraño de grails
				//

				//Si no hay suficientes elementos para paginar..
				if($('ul.pagination li.disabled')){
					$('div.pagination').css('visibility','hidden')	
				}
				//Si no hay elementos para mostrar..
				if(!$('tbody').children().length){
					$('div#list-bien').css('visibility','hidden')	
				}
				//Si hay un input de id=password ,cambiarlo a tipo pass(q no muestre lo que escribe)
				$('input#password').attr('type','password')

				//Agrego algunos botones al menu dependiendo en que pagina estoy.
				if(location.pathname=="/patronus/bien/index"){
					$('div#menu').append("<a class='btn btn-default' href='/patronus/bien/create'>Upload</a>")
				}
				if(location.pathname=="/patronus/bien/create"){
					$('div#menu').append("<a class='btn btn-default' href='/patronus/bien/index'>Bienes</a>")
				}
				if(location.pathname.indexOf("/patronus/bien/show")!=-1){
					$('div#menu').append("<a class='btn btn-default' href='/patronus/bien/index'>Bienes</a>")
				}
				

				$(".save").addClass("btn btn-success")
				$("a.cancel").addClass("btn btn-danger")
				$(".delete").addClass("btn btn-danger")

				$(".bienes").mouseover(function(event){
					$(".bienes").addClass("open");
				});
				$(".bienes").mouseout(function(event){
					$(".bienes").removeClass("open");
				});


				$(".usuarios").mouseover(function(event){
				$(".usuarios").addClass("open");
				});
				$(".usuarios").mouseout(function(event){
					$(".usuarios").removeClass("open");
				});

				$(".perfil").mouseover(function(event){
				$(".perfil").addClass("open");
				});
				$(".perfil").mouseout(function(event){
					$(".perfil").removeClass("open");
				});

			})

		</script>
		<style>
			body{
				padding-top: 50px;
			}
			.fieldcontain{
				margin-bottom: 10px;
			}
			input.save{
				float: right;				
				margin: 5px;
			}
			input.delete{
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
		</style>
	</head>
	<body>
		<nav class="navbar navbar-default" role="navigation" style="position:fixed;top:0;left:0;z-index:99999;width:100%">
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
					<ul class="nav navbar-nav">
						<li class="dropdown bienes">
							<a href="/abm/bien/index" class="dropdown-toggle" data-toggle="dropdown">Bienes <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a class="list" href="/abm/bien/index">Listado</a></li>
								<li><a class="new" href="/abm/bien/create">Cargar</a></li>
<!-- 								<li class="divider"></li>
								<li><a href="#">Separated link</a></li> -->
							</ul>
						</li>
						<li class="dropdown usuarios">
							<a href="/abm/usuario/index" class="dropdown-toggle" data-toggle="dropdown">Usuarios <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a class="list" href="/abm/usuario/index">Listado</a></li>
								<li><a class="new" href="/abm/usuario/create">Cargar</a></li>
<!-- 								<li class="divider"></li>
								<li><a href="#">Separated link</a></li> -->
							</ul>
						</li>
					</ul>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search">
						</div>
						<button type="submit" class="btn btn-default">Submit</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">Link</a></li>
						<li class="dropdown perfil">
						          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Perfil <span class="caret"></span></a>
						          <ul class="dropdown-menu" role="menu">
						            <li><a href="../../abm/secure">
						            	<sec:ifLoggedIn>
											<sec:username/>
										</sec:ifLoggedIn>
						            </a></li>
						            <li><a href="#">Permisos</a></li>

						            <li class="divider"></li>
						            <li><a href="#">Logout</a></li>
						          </ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<g:layoutBody/>
	</body>
</html>
