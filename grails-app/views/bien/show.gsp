<%@ page import="abm.Bien" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bien.label', default: 'Bien')}" />
		<title><g:message code="Bien creado" /></title>
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
					<a class="navbar-brand" href="/${grailsApplication.config.nombreAplicacion}/bien/index"><i class="md md-arrow-back"></i></a>
					<a class="navbar-brand">Detalle</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
					<form class="navbar-form navbar-left" action="busqueda" method="GET" role="search">
						<div class="form-group">
							<input type="text" class="form-control" name="query" placeholder="Buscar por denominacion...">
						</div>
						<button type="submit" class="btn btn-default"><i class="md md-search"></i></button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li>
							<a data-toggle="collapse" href="#crearBien" aria-expanded="false" aria-controls="crearBien">
								<i class="md md-add"></i>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="collapse" id="crearBien">
			<div class="">
				<g:include controller="bien" action="create" />
			</div>
		</div>
		<div class="container-fluid">
			<g:if test="${flash.message}">
				<div class="alert alert-dismissible alert-success" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</i></span>
					</button>
					${flash.message}
				</div>
			</g:if>
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
						<g:if test="${bienInstance?.codigoDeSerie}">
							<li class="list-group-item">
								<strong>
									<span id="codigoDeSerie-label" class="property-label"><g:message code="bien.codigoDeSerie.label" default="Id Bien" /></span>
								</strong>
								<span class="property-value" aria-labelledby="codigoDeSerie-label"><g:fieldValue bean="${bienInstance}" field="codigoDeSerie"/></span>
							</li>
						</g:if>
						<g:if test="${bienInstance?.nombreBien}">
							<li class="list-group-item">
								<strong>
									<span id="nombreBien-label" class="property-label"><g:message code="bien.nombreBien.label" default="Denominaci&oacuten" /></span>
								</strong>
								<span class="property-value" aria-labelledby="codigoDeSerie-label"><g:fieldValue bean="${bienInstance}" field="nombreBien"/></span>
							</li>
						</g:if>
						<g:if test="${bienInstance?.descripcion}">
							<li class="list-group-item">
								<strong>
									<span id="descripcion-label" class="property-label"><g:message code="bien.descripcion.label" default="Descripci&oacuten" /></span>
								</strong>
								<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${bienInstance}" field="descripcion"/></span>
							</li>
						</g:if>
						<g:if test="${bienInstance?.responsableBien}">
							<li class="list-group-item">
								<strong>
									<span id="responsableBien-label" class="property-label"><g:message code="bien.responsableBien.label" default="Responsable" /></span>
								</strong>
								<span class="property-value" aria-labelledby="responsableBien-label"><g:link controller="Persona" action="show" id="${bienInstance?.responsableBien?.id}">${bienInstance?.responsableBien?.encodeAsHTML()}</g:link></span>
							</li>
						</g:if>
						<g:if test="${bienInstance?.tipo}">
							<li class="fieldcontain list-group-item">
								<strong>
									<span id="tipo-label" class="property-label"><g:message code="bien.tipo.label" default="Tipo" /></span>
								</strong>
								<span class="property-value" aria-labelledby="tipo-label"><g:link controller="tipo" action="show" id="${bienInstance?.tipo?.id}">${bienInstance?.tipo?.encodeAsHTML()}</g:link></span>
							</li>
						</g:if>
						<g:if test="${bienInstance?.estado}">
							<li class="fieldcontain list-group-item">
								<strong>
									<span id="estado-label" class="property-label"><g:message code="bien.estado.label" default="Estado" /></span>
								</strong>
								<span class="property-value" aria-labelledby="estado-label"><g:link controller="estado" action="show" id="${bienInstance?.estado?.id}">${bienInstance?.estado?.encodeAsHTML()}</g:link></span>
							</li>
						</g:if>
						<g:if test="${bienInstance?.ubicacion}">
							<li class="fieldcontain list-group-item">
								<strong>
									<span id="ubicacion-label" class="property-label"><g:message code="bien.ubicacion.label" default="Ubicaci&oacuten" /></span>
								</strong>
								<span class="property-value" aria-labelledby="ubicacion-label"><g:link controller="ubicacion" action="show" id="${bienInstance?.ubicacion?.id}">${bienInstance?.ubicacion?.encodeAsHTML()}</g:link></span>
							</li>
						</g:if>
						<g:if test="${bienInstance?.area}">
							<li class="fieldcontain list-group-item list-group-item">
								<strong>
									<span id="area-label" class="property-label"><g:message code="bien.area.label" default="Area" /></span>
								</strong>
								<span class="property-value" aria-labelledby="area-label">
									<g:link controller="area" action="show" id="${bienInstance?.area?.id}">${bienInstance?.area?.encodeAsHTML()}</g:link>
								</span>
							</li>
						</g:if>
					<!-- 	<g:if test="${bienInstance?.fechaAlta}">
							<li class="list-group-item">
								<strong>
									<span id="fechaAlta-label" class="property-label"><g:message code="bien.fechaAlta.label" default="Fecha Alta" /></span>
								</strong>
								<span class="property-value" aria-labelledby="fechaAlta-label"><g:formatDate date="${bienInstance?.fechaAlta}" /></span>
							</li>
						</g:if>
						<g:if test="${bienInstance?.fechaBaja}">
							<li class="list-group-item">
								<strong>
									<span id="fechaBaja-label" class="property-label"><g:message code="bien.fechaBaja.label" default="Fecha Baja" /></span>
								</strong>
								<span class="property-value" aria-labelledby="fechaBaja-label"><g:formatDate date="${bienInstance?.fechaBaja}" /></span>
							</li>
						</g:if>-->
					</ul>
					<g:form url="[resource:bienInstance, action:'delete']" method="DELETE" id="form_show_bien">
						<fieldset class="buttons">
							<!-- <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/> -->	
						</fieldset>
					</g:form>
				</div>
				<div class="panel-footer" >
					<g:link action="edit" resource="${bienInstance}" style="padding: 0px 12px; color:#777777"><i class="md md-edit"></i></g:link>
					<button class="btn btn-link" type="submit" form="form_show_bien" style="padding: 0px 12px; color:#777777">
						<i class="md md-delete"></i>
					</button>
				</div>
			</div>
		</div>
	</body>
</html>
