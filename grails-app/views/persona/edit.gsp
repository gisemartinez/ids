<%@ page import="abm.Persona" %>
<%@ page import="com.testapp.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="Persona" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container-fluid">
			<legend>Editar Persona</legend>
			<div class="panel panel-default">
				<div class="panel-body">
					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
					<g:hasErrors bean="${personaInstance}">
						<ul class="errors" role="alert">
							<g:eachError bean="${personaInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/>
								</li>
							</g:eachError>
						</ul>
					</g:hasErrors>
					<g:form url="[resource:personaInstance, action:'update']" method="PUT" id="form_edit" class="form-horizontal">
						<g:hiddenField name="version" value="${personaInstance?.version}" />
						<fieldset>
							<g:render template="form"/>
						</fieldset>
					</g:form>
				</div>
				<div class="panel-footer">
					<g:link action="show" id="${personaInstance.id}" class="btn btn-default">Cancelar</g:link>
					<g:submitButton form="form_edit" name="update" value="Guardar" class="btn btn-primary"/>
				</div>
			</div>
		</div>
	</body>
</html>
