<%@ page import="abm.Persona" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="Persona" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container-fluid">
			<div class="panel panel-primary" style="margin-top:1em" >
				<div class="panel-heading">
					<h3 class="panel-title"><g:message code="default.show.label" args="[entityName]"/></h3>
				</div>
				<div class="panel-body">
						<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
						</g:if>
					<ul class="list-group">

						<g:if test="${personaInstance?.nombre}">
						<li class="list-group-item">
							<strong>
								<span id="nombre-label" class="property-label">
									<g:message code="persona.nombre.label" default="Nombre" />
								</span>
							</strong>
							<span class="property-value" aria-labelledby="nombre-label">
								<g:fieldValue bean="${personaInstance}" field="nombre"/>
							</span>
							
						</li>
						</g:if>	
						<g:if test="${personaInstance?.apellido}">
						<li class="list-group-item">
							<strong>
								<span id="apellido-label" class="property-label">
									<g:message code="persona.apellido.label" default="Apellido" />
								</span>
							</strong>
							<span class="property-value" aria-labelledby="apellido-label">
								<g:fieldValue bean="${personaInstance}" field="apellido"/>
							</span>	
						</li>
						</g:if>
					
						<g:if test="${personaInstance?.dni}">
						<li class="list-group-item">
							<strong>
								<span id="dni-label" class="property-label">
									<g:message code="persona.dni.label" default="DNI" />
								</span>
							</strong>
							<span class="property-value" aria-labelledby="dni-label">
								<g:fieldValue bean="${personaInstance}" field="dni"/>
							</span>
						</li>
						</g:if>
					
						<g:if test="${personaInstance?.fechaAlta}">
						<li class="list-group-item">
							<strong>
								<span id="fechaAlta-label" class="property-label">
									<g:message code="persona.fechaAlta.label" default="Fecha Alta" />
								</span>
							</strong>
							<span class="property-value" aria-labelledby="fechaAlta-label">
								<g:formatDate date="${personaInstance?.fechaAlta}" />
							</span>
							
						</li>
						</g:if>
					
						<g:if test="${personaInstance?.fechaBaja}">
						<li class="list-group-item">
							<strong>
								<span id="fechaBaja-label" class="property-label">
									<g:message code="persona.fechaBaja.label" default="Fecha Baja" />
								</span>
							</strong>
							<span class="property-value" aria-labelledby="fechaBaja-label">
								<g:formatDate date="${personaInstance?.fechaBaja}" />
							</span>
							
						</li>
						</g:if>
					</ul>
					<g:form url="[resource:personaInstance, action:'delete']" method="DELETE">
						<fieldset class="buttons">
							
							<g:actionSubmit class="delete" action="delete" value="${message(code: 'e', default: 'Eliminar')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Está seguro?')}');" />
							<g:link class="edit btn btn-primary" action="edit" resource="${personaInstance}"><g:message code="default.button.edit.label" default="Editar" /></g:link>
						</fieldset>
					</g:form>
				</div>
				<!-- panel-body -->
			</div>
			<!-- panel-primary -->
		</div>
		<!-- container-fluid -->
	</body>
</html>
