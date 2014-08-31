
<%@ page import="abm.Estado" %>
<!DOCTYPE html>

<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'estado.label', default: 'Estado')}" />
		<title><g:message code="Estado creado" /></title>
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
						<g:if test="${estadoInstance?.nombre}">
							<li class="list-group-item">
								<strong>
									<span id="nombre-label" class="property-label"><g:message code="estado.nombre.label" default="Nombre de Estado" /></span>
								</strong>
								<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${estadoInstance}" field="nombre"/></span>
							</li>
						</g:if>
						<g:if test="${estadoInstance?.fechaAlta}">
							<li class="list-group-item">
								<strong>
									<span id="fechaAlta-label" class="property-label"><g:message code="estado.fechaAlta.label" default="Fecha Alta" /></span>
								</strong>
								<span class="property-value" aria-labelledby="fechaAlta-label"><g:formatDate date="${estadoInstance?.fechaAlta}" /></span>
							</li>
						</g:if>
						<g:if test="${estadoInstance?.fechaBaja}">
							<li class="list-group-item">
								<strong>
									<span id="fechaBaja-label" class="property-label"><g:message code="estado.fechaBaja.label" default="Fecha Baja" /></span>
								</strong>
								<span class="property-value" aria-labelledby="fechaBaja-label"><g:formatDate date="${estadoInstance?.fechaBaja}" /></span>
							</li>
						</g:if>
					</ul>
					<g:form url="[resource:estadoInstance, action:'delete']" method="DELETE">
						<fieldset class="buttons">
							<!-- <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/> -->
							<button type="submit" class="btn btn-primary delete"></button>
							<g:link class="edit btn btn-primary" action="edit" resource="${estadoInstance}"></g:link>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>
