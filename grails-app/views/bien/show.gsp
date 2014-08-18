<%@ page import="abm.Bien" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bien.label', default: 'Bien')}" />
		<title><g:message code="Bien creado" /></title>
	</head>
	<body>
		<div class="container-fluid">
			<div class="panel panel-primary" style="margin-top:20px" >
				<div class="panel-heading">
					<h3 class="panel-title"><g:message code="default.show.label" args="[entityName]"/></h3>
				</div>
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
						<g:if test="${bienInstance?.descripcion}">
							<li class="list-group-item">
								<strong>
									<span id="descripcion-label" class="property-label"><g:message code="bien.descripcion.label" default="Descripcion" /></span>
								</strong>
								<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${bienInstance}" field="descripcion"/></span>
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
									<span id="ubicacion-label" class="property-label"><g:message code="bien.ubicacion.label" default="Ubicacion" /></span>
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
						<g:if test="${bienInstance?.fechaAlta}">
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
						</g:if>
					</ul>
					<g:form url="[resource:bienInstance, action:'delete']" method="DELETE">
						<fieldset class="buttons">
							<!-- <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/> -->
							<button type="submit" class="btn btn-primary delete"></button>
							<g:link class="edit btn btn-primary" action="edit" resource="${bienInstance}"></g:link>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>
