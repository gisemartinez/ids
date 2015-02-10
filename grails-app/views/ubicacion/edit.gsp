<%@ page import="abm.Ubicacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ubicacion.label', default: 'Ubicacion')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<nav class="navbar navbar-default barra_acciones">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<g:link action="show" resource="${ubicacionInstance}" class="navbar-brand"><i class="md md-arrow-back"></i></g:link>
					<a class="navbar-brand">Editar</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
					<!-- <form class="navbar-form navbar-left" action="busqueda" method="GET" role="search">
						<div class="form-group">
							<input type="text" class="form-control" name="query" placeholder="Buscar por denominacion...">
						</div>
						<button type="submit" class="btn btn-default"><i class="md md-search"></i></button>
					</form> -->
					<ul class="nav navbar-nav navbar-right">
						<li>
							<a data-toggle="collapse" href="#crearUbicacion" aria-expanded="false" aria-controls="crearUbicacion">
								<i class="md md-add"></i>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="collapse" id="crearUbicacion">
			<div>
				<g:include controller="ubicacion" action="create" />
			</div>
		</div>
		<div class="container-fluid">
			<div class="panel panel-default">
				<div class="panel-body">
					<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
					</g:if>
					<g:hasErrors bean="${ubicacionInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="$ubicacionInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
					</g:hasErrors>
					<g:form url="[resource:ubicacionInstance, action:'update']" method="PUT" id="form_edit_ubicacion">
						<g:hiddenField name="version" value="$ubicacionInstance?.version}" />
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>
					</g:form>
				</div>
				<div class="panel-footer" >
					<button class="btn btn-link" type="submit" form="form_edit_ubicacion" style="padding: 0px 12px; color:#777777">
						<i class="md md-check"></i>
					</button>
					<g:link action="index" resource="${ubicacionInstance}" style="padding: 0px 12px; color:#777777"><i class="md md-close"></i></g:link>
				</div>
			</div>
		</div>
	</body>
</html>
