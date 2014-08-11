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
		<g:layoutHead/>
		<script type="text/javascript">
			$(document).ready(
				function(){

					//
					//bootstrap
					//

					//a todos los inputs le agrego la clase form-control
					$('input').addClass("form-control")
					//a todas las tablas le agrego la clase table
					$('table').addClass("table")
					//agrego iconos a los botones
					$('a.home').prepend("<span class='glyphicon glyphicon-home'>&nbsp</span>")
					$('a.list').prepend("<span class='glyphicon glyphicon-list'>&nbsp</span>")
					$('a.create').prepend("<span class='glyphicon glyphicon-plus'>&nbsp</span>")

					$('div button .delete').before("<span align='center' class='glyphicon glyphicon-remove'>&nbsp</span>")
					$('div button .edit').before("<span align='center' class='glyphicon glyphicon-ok'>&nbsp</span>")

					//
					//Evitar comportamiento extraño de grails
					//

					//Si no hay suficientes elementos para paginar..
					if( $('ul.pagination li.disabled') )
					{
						$('div.pagination').css('visibility','hidden')	
					}
					//Si no hay elementos para mostrar..
					if( ! $('tbody').children().length )
					{
						$('div#list-bien').css('visibility','hidden')	
					}
					//Si hay un input de id=password ,cambiarlo a tipo pass(q no muestre lo que escribe)
					$('input#password').attr('type','password')

					//Un par de scripts en el main.gsp para modificar la barra de navegación dependiendo en que pagina estoy:

					if (location.pathname=="/abm/bien/index") {
						$('div#menu').append("<a class='btn btn-default' href='/abm/bien/create'>Upload</a>")
					};
					if (location.pathname=="/abm/bien/create") {
						$('div#menu').append("<a class='btn btn-default' href='/abm/bien/index'>Bienes</a>")
					};
					if (location.pathname.indexOf("/abm/bien/show")!=-1) {
						$('div#menu').append("<a class='btn btn-default' href='/abm/bien/index'>Bienes</a>")
					};
					$(".save").addClass("btn btn-primary");

					$(".delete").addClass("btn btn-primary");

					$('ul.property-list').addClass("list-group")
					$('li.fieldcontain').addClass("list-group-item")


				})		
		</script>
	</head>
	<body>
		<div id="menu" style="background-color:#f8f8f8; padding: 10px 10px; border-bottom: 1px solid #e8e8e8">
			<div class="btn-group">
				<a class="btn btn-danger" href="/abm/">abm</a>
				<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
					<span class="caret"></span>
					<span class="sr-only">Toggle Dropdown</span>
				</button>
				<ul class="dropdown-menu" role="menu">
					<li><a href="/abm/bien/index">Bienes</a></li>
					<li class="divider"></li>
					<li><a href="/abm/usuario/index">Usuarios</a></li>
				</ul>
			</div>
		</div>
		<g:layoutBody/>
	</body>
</html>
