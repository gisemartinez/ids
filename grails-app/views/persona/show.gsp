<%@ page import="abm.Persona" %>
<%@ page import="com.testapp.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
		<g:set var="userId" value="${sec.loggedInUserInfo(field:'id')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<!--Volver al listado-->
		<g:link action="index" class="btn-floating btn-large waves-effect waves-light red" style="position: fixed; bottom: 15px; right: 15px;">
			<i class="material-icons">list</i>
		</g:link>
		<div class="container">
			<!--Alertas-->
			<g:if test='${flash.message}'>
				<div class="alert alert-dismissible alert-success" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<i class="md md-error"></i> ${flash.message}
				</div>
			</g:if>
			<div class="row">
				<div class="col s12 offset-m1 m10 offset-l2 l8">
					<div class="card">
						<div class="card-image">
							<asset:image src="sample-1.jpg"/>
							<span class="card-title" id="persona">Detalle de Persona</span>
							<script>
								var card_title = (${personaInstance.id} == ${userId}) ? 'Detalle de Cuenta' : 'Detalle de Persona'
								$('.card-title').html(card_title)
							</script>
						</div>
						<div class="card-content">
							<div class="row">
								<div class="col s12 m6 l4">
									<g:if test="${personaInstance?.nombre}">
										<label><g:message code="persona.nombre.label" default="Nombre"/></label>
										<p><g:fieldValue bean="${personaInstance}" field="nombre"/></p>
									</g:if>
								</div>
								<div class="col s12 m6 l4">
									<g:if test="${personaInstance?.apellido}">
										<label><g:message code="persona.apellido.label" default="Apellido"/></label>
										<p><g:fieldValue bean="${personaInstance}" field="apellido"/></p>
									</g:if>
								</div>
								<div class="col s12 m6 l4">
									<g:if test="${personaInstance?.dni}">
										<label><g:message code="persona.dni.label" default="DNI"/></label>
										<p><g:fieldValue bean="${personaInstance}" field="dni"/></p>
									</g:if>
								</div>
							</div>
							<div class="row">
								<div class="col s12 m6 l4">
									<g:if test="${userInstance?.username}">
										<label><g:message code="user.username.label" default="Usuario/e-mail"/></label>
										<p><g:fieldValue bean="${userInstance}" field="username"/></p>
									</g:if>
								</div>
							</div>
							<div class="row">
								<div class="col s12 m6 l4">
									<g:if test="${personaInstance?.area}">
										<label><g:message code="persona.area.label" default="Area"/></label>
										<p>
											<g:link controller="area" action="show" id="${personaInstance?.area?.id}">${personaInstance?.area?.encodeAsHTML()}</g:link>
										</p>
									</g:if>
								</div>
								<div class="col s12 m6 l4">
									<g:if test="${roleInstance?.authority}">
										<label><g:message code="role.authority.label" default="Rol"/></label>
										<p><g:fieldValue bean="${roleInstance}" field="authority"/></p>
									</g:if>
								</div>
							</div>
							<div class="row">
								<div class="col s12 m6 l4">
									<g:if test="${personaInstance?.fechaAlta}">
										<label><g:message code="persona.fechaAlta.label" default="Fecha Alta"/></label>
										<p><g:formatDate format="dd-MM-yyyy" date="${personaInstance?.fechaAlta}"/></p>
									</g:if>
								</div>
							</div>
						</div>
						<div class="card-action">
							<g:submitButton form="form_delete" name="delete" value="Borrar" class="btn-flat white delete"/>
							<g:link action="edit" id="${personaInstance.id}">Editar</g:link>
							<g:form url="[resource:personaInstance, action:'delete']" method="DELETE" id='form_delete'></g:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
