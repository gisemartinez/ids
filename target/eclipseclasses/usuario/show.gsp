
<%@ page import="abm.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="show-usuario" class="content scaffold-show" role="main">
						<h1>Mostrar <b>Usuario</b></h1>
						<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
						</g:if>
						<ul class="property-list usuario">		
							<g:if test="${usuarioInstance?.nombre}">
							<li class="fieldcontain">
								<span id="nombre-label" class="property-label"><g:message code="usuario.nombre.label" default="Nombre" /></span>
								
									<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${usuarioInstance}" field="nombre"/></span>
								
							</li>
							</g:if>
							
							<g:if test="${usuarioInstance?.apellido}">
							<li class="fieldcontain">
								<span id="apellido-label" class="property-label"><g:message code="usuario.apellido.label" default="Apellido" /></span>
								
									<span class="property-value" aria-labelledby="apellido-label"><g:fieldValue bean="${usuarioInstance}" field="apellido"/></span>
								
							</li>
							</g:if>
							<g:if test="${usuarioInstance?.DNI}">
							<li class="fieldcontain">
								<span id="DNI-label" class="property-label"><g:message code="usuario.DNI.label" default="DNI" /></span>
								
									<span class="property-value" aria-labelledby="DNI-label"><g:fieldValue bean="${usuarioInstance}" field="DNI"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${usuarioInstance?.email}">
							<li class="fieldcontain">
								<span id="email-label" class="property-label"><g:message code="usuario.email.label" default="Email" /></span>
								
									<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${usuarioInstance}" field="email"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${usuarioInstance?.fechaAlta}">
							<li class="fieldcontain">
								<span id="fechaAlta-label" class="property-label"><g:message code="usuario.fechaAlta.label" default="Fecha Alta" /></span>
								
									<span class="property-value" aria-labelledby="fechaAlta-label"><g:formatDate date="${usuarioInstance?.fechaAlta}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${usuarioInstance?.fechaBaja}">
							<li class="fieldcontain">
								<span id="fechaBaja-label" class="property-label"><g:message code="usuario.fechaBaja.label" default="Fecha Baja" /></span>
								
									<span class="property-value" aria-labelledby="fechaBaja-label"><g:formatDate date="${usuarioInstance?.fechaBaja}" /></span>
								
							</li>
							</g:if>

							<!-- 
							<g:if test="${usuarioInstance?.password}">
							<li class="fieldcontain">
								<span id="password-label" class="property-label"><g:message code="usuario.password.label" default="Password" /></span>
								
									<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${usuarioInstance}" field="password"/></span>
								
							</li>
							</g:if>
							 -->
						</ul>
						<g:form url="[resource:usuarioInstance, action:'delete']" method="DELETE">
							<fieldset class="buttons">
							<div clas="row">
									<div align="center" class="fieldcontain col-md-2">
										<button>
											<g:link class="edit" action="edit" resource="${usuarioInstance}"><g:message code="default.button.edit.label" default="Editar" /></g:link>
										</button>
										
									</div>

									<div align="center" class="fieldcontain col-md-2">
										<button>
											<g:actionSubmit class="delete" action="delete" value="${message(code: 'e', default: 'Eliminar')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Está seguro?')}');" />
										</button>
									</div>
							
								</div>	
							</fieldset>
						</g:form> 
					</div>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>

					
	</body>
</html>
