<%@ page import="abm.Ubicacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ubicacion.label', default: 'Ubicacion')}" />
		<title><g:message code="Ubicacion creada" /></title>
		<style>
			.panel-footer a:hover .md{
				color:black;
				text-decoration:none;
			}
			.panel-footer button:hover .md{
				color:black;
				text-decoration:none;
			}
		</style>
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
					<a class="navbar-brand" href="/${grailsApplication.config.nombreAplicacion}/ubicacion/index"><i class="md md-arrow-back"></i></a>
					<a class="navbar-brand">Detalle</a>
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
				<!-- <div class="panel-heading">
					<g:message code="default.show.label" args="[entityName]"/>
				</div> -->
				<div class="panel-body">
					<!-- <g:if test="${flash.message}">
						<div class="message" role="status">
							${flash.message}
						</div>
					</g:if> -->
					<ul class="list-group">
						<g:if test="${ubicacionInstance?.nombreubica}">
							<li class="list-group-item">
								<strong>
									<span id="nombreubica-label" class="property-label"><g:message code="ubicacion.nombreubica.label" default="Nombre de la Ubicacion" /></span>
								</strong>
								<span class="property-value" aria-labelledby="nombreubica-label"><g:fieldValue bean="${ubicacionInstance}" field="nombreubica"/></span>
							</li>
						</g:if>
						<g:if test="${ubicacionInstance?.fechaAlta}">
							<li class="list-group-item">
								<strong>
									<span id="fechaAlta-label" class="property-label"><g:message code="ubicacion.fechaAlta.label" default="Fecha Alta" /></span>
								</strong>
								<span class="property-value" aria-labelledby="fechaAlta-label"><g:formatDate format="dd-MM-yyyy" date="${ubicacionInstance?.fechaAlta}" /></span>
							</li>
						</g:if>
						<g:if test="${ubicacionInstance?.fechaBaja}">
							<li class="list-group-item">
								<strong>
									<span id="fechaBaja-label" class="property-label"><g:message code="ubicacion.fechaBaja.label" default="Fecha Baja" /></span>
								</strong>
								<span class="property-value" aria-labelledby="fechaBaja-label"><g:formatDate format="dd-MM-yyyy" date="${ubicacionInstance?.fechaBaja}" /></span>
							</li>
						</g:if>
					</ul>
					<g:form url="[resource:ubicacionInstance, action:'delete']" method="DELETE" id="form_show_ubicacion">
					</g:form>
				</div>
				<div class="panel-footer" >
					<g:link action="edit" resource="${ubicacionInstance}" style="padding: 0px 12px; color:#777777"><i class="md md-edit"></i></g:link>
					<!--<button class="btn btn-link" type="submit" form="form_show_ubicacion" style="padding: 0px 12px; color:#777777">
						<i class="md md-delete"></i>
					</button>-->
				</div>
			</div>
		</div>
	</body>
</html>
