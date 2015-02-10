<%@ page import="abm.Area" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'area.label', default: 'Area')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
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
					<a class="navbar-brand">Crear</a>
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
							<a data-toggle="collapse" href="#crearArea" aria-expanded="false" aria-controls="crearArea">
								<i class="md md-add"></i>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="collapse" id="crearArea">
			<div>
				<g:include controller="area" action="create" />
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
						<g:if test="${areaInstance?.nombrearea}">
							<li class="list-group-item">
								<strong>
									<span id="nombrearea-label" class="property-label"><g:message code="area.nombrearea.label" default="Nombre del Area" /></span>
								</strong>
								<span class="property-value" aria-labelledby="nombrearea-label"><g:fieldValue bean="${areaInstance}" field="nombrearea"/></span>
							</li>
						</g:if>
						<g:if test="${areaInstance?.fechaAlta}">
							<li class="list-group-item">
								<strong>
									<span id="fechaAlta-label" class="property-label"><g:message code="area.fechaAlta.label" default="Fecha Alta" /></span>
								</strong>
								<span class="property-value" aria-labelledby="fechaAlta-label"><g:formatDate format="dd-MM-yyyy" date="${areaInstance?.fechaAlta}" /></span>
							</li>
						</g:if>
						<!--<g:if test="${areaInstance?.fechaBaja}">
							<li class="list-group-item">
								<strong>
									<span id="fechaBaja-label" class="property-label"><g:message code="area.fechaBaja.label" default="Fecha Baja" /></span>
								</strong>
								<span class="property-value" aria-labelledby="fechaBaja-label"><g:formatDate date="${areaInstance?.fechaBaja}" /></span>
							</li>
						</g:if>-->
					</ul>
					<g:form url="[resource:areaInstance, action:'delete']" method="DELETE" id="form_show_area">
					</g:form>
				</div>
				<div class="panel-footer" >
					<g:link action="edit" resource="${areaInstance}" style="padding: 0px 12px; color:#777777"><i class="md md-edit"></i></g:link>
				</div>
			</div>
		</div>
	</body>
</html>
