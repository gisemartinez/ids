<%@ page import="abm.Persona" %>
<%@ page import="com.testapp.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<!--Volver al listado-->
		<ul class="mfb-component--br" data-mfb-toggle="hover">
			<li class="mfb-component__wrap">
				<g:link action="index" class="mfb-component__button--main">
					<i class="mfb-component__main-icon--resting mdi-action-list"></i>
					<i class="mfb-component__main-icon--active mdi-action-list"></i>
				</g:link>
			</li>
		</ul>
		<div class="container-fluid">
			<!--Alertas-->
			<g:if test='${flash.message}'>
				<div class="alert alert-dismissible alert-success" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<i class="md md-error"></i> ${flash.message}
				</div>
			</g:if>
			<div class="row">
				<div class="col-lg-6">
					<legend>Detalle de Persona</legend>
					<div class="panel panel-default" style="margin:0 auto 20px">
						<div class="panel-body">
							<div class="list-group">
								<div class="list-group-item">
									<div class="row-content">
										<g:if test="${personaInstance?.nombre}">
											<h4 class="list-group-item-heading"><g:message code="persona.nombre.label" default="Nombre"/></h4>
											<p class="list-group-item-text"><g:fieldValue bean="${personaInstance}" field="nombre"/></p>
										</g:if>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row-content">
										<g:if test="${personaInstance?.apellido}">
											<h4 class="list-group-item-heading"><g:message code="persona.apellido.label" default="Apellido"/></h4>
											<p class="list-group-item-text"><g:fieldValue bean="${personaInstance}" field="apellido"/></p>
										</g:if>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row-content">
										<g:if test="${userInstance?.username}">
											<h4 class="list-group-item-heading"><g:message code="user.username.label" default="Usuario/e-mail"/></h4>
											<p class="list-group-item-text"><g:fieldValue bean="${userInstance}" field="username"/></p>
										</g:if>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row-content">
										<g:if test="${personaInstance?.dni}">
											<h4 class="list-group-item-heading"><g:message code="persona.dni.label" default="DNI"/></h4>
											<p class="list-group-item-text"><g:fieldValue bean="${personaInstance}" field="dni"/></p>
										</g:if>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row-content">
										<g:if test="${personaInstance?.area}">
											<h4 class="list-group-item-heading"><g:message code="persona.area.label" default="Area"/></h4>
											<p class="list-group-item-text">
												<g:link controller="area" action="show" id="${personaInstance?.area?.id}">${personaInstance?.area?.encodeAsHTML()}</g:link>
											</p>
										</g:if>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row-content">
										<g:if test="${roleInstance?.authority}">
											<h4 class="list-group-item-heading"><g:message code="role.authority.label" default="Rol"/></h4>
											<p class="list-group-item-text"><g:fieldValue bean="${roleInstance}" field="authority"/></p>
										</g:if>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row-content">
										<g:if test="${personaInstance?.fechaAlta}">
											<h4 class="list-group-item-heading"><g:message code="persona.fechaAlta.label" default="Fecha Alta"/></h4>
											<p class="list-group-item-text"><g:formatDate format="dd-MM-yyyy" date="${personaInstance?.fechaAlta}"/></p>
										</g:if>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-footer" style="text-align:right">
							<g:submitButton name="delete" value="Borrar" class="btn btn-default delete"/>
							<g:link action="edit" id="${personaInstance.id}" class="btn btn-primary">Editar</g:link>
							<g:form url="[resource:personaInstance, action:'delete']" method="DELETE" id='form_delete'></g:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
