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
		
		<g:layoutHead/>
		<script type="text/javascript">
			$(document).ready(function(){

				//
				//bootstrap
				//

				//a todos los inputs (menos a los submits) le agrego la clase form-control

				$('input,select').addClass("form-control")

				$('input:checkbox').removeClass("form-control")
				$('input:submit').removeClass("form-control")

				$('.fieldcontain').removeClass("fieldcontain")
				//a todas las tablas le agrego la clase table
				$('table').addClass("table table-bordered")
				//agrego iconos a los botones
				// $('a.home').prepend("<span class='glyphicon glyphicon-home'>&nbsp</span>")
				
				// $('a.usuarios').prepend("<span class='glyphicon glyphicon-user'>&nbsp</span>")


				$('.save').prepend("<i align='center' class='glyphicon glyphicon-ok'></i>")
				$('.search').append("<i align='center' class='glyphicon glyphicon-search'></i>")
				$('.delete').append("<i align='center' class='glyphicon glyphicon-trash'></i>")
				$('a.edit').prepend("<span align='center' class='glyphicon glyphicon-pencil'></span>")
				$('a.cancel').prepend("<span align='center' class='glyphicon glyphicon-remove'></span>")


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

				$(".bienes").mouseover(function(){
					$(".bienes").addClass("open");
				});
				$(".bienes").mouseout(function(){
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
							</ul>
						</li>
						<li class="dropdown usuarios">
							<a href="/abm/usuario/index" class="dropdown-toggle" data-toggle="dropdown">Usuarios <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a class="list" href="/abm/usuario/index">Listado</a></li>
								<li><a class="new" href="/abm/usuario/create">Cargar</a></li>
							</ul>
						</li>
					</ul>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Buscar...">
						</div>
						<button type="submit" class="btn btn-primary search"></button>
					</form>
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
											<a href="javascript:document.submitForm.submit()">Cerrar sesi&oacuten</a>
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
