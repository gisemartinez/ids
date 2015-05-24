<!DOCTYPE html>
<html>
	<head>
		<title><g:if env="development">Error en PATRonus</g:if><g:else>Error</g:else></title>
		<meta name="layout" content="main">
		<g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
	</head>
	<body>
		<div class="alert alert-danger" role="alert">
			<!--<i class="medium mdi-alert-error"></i>-->
			<strong>Ha ocurrido un error </strong> ${msg}
		</div>
		<g:if env="development">
			<g:renderException exception="${exception}" />
		</g:if>
		<g:else>
			<ul class="errors">
				<li>Ud no posee autorización para acceder a ésta página</li>
			</ul>
		</g:else>
	</body>
</html>
