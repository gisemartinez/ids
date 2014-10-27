
<%@ page import="abm.Ubicacion" %>
<!DOCTYPE html>

<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ubicacion.label', default: 'Ubicacion')}" />
		<title><g:message code="Ubicacion creada" /></title>
	</head>
	<body>
		<div class="container-fluid">
			<div class="panel panel-primary">
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
								<span class="property-value" aria-labelledby="fechaAlta-label"><g:formatDate date="${ubicacionInstance?.fechaAlta}" /></span>
							</li>
						</g:if>
						<g:if test="${ubicacionInstance?.fechaBaja}">
							<li class="list-group-item">
								<strong>
									<span id="fechaBaja-label" class="property-label"><g:message code="ubicacion.fechaBaja.label" default="Fecha Baja" /></span>
								</strong>
								<span class="property-value" aria-labelledby="fechaBaja-label"><g:formatDate date="${ubicacionInstance?.fechaBaja}" /></span>
							</li>
						</g:if>
					</ul>
					<g:form url="[resource:ubicacionInstance, action:'delete']" method="DELETE">
						<fieldset class="buttons">
							<!-- <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/> -->
							<button type="submit" class="btn btn-primary delete"></button>
							<g:link class="edit btn btn-primary" action="edit" resource="${ubicacionInstance}"></g:link>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>
