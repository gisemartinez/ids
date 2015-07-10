<%@ page import="abm.Bien" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bien.label', default: 'Bien')}"/>
		<title><g:message code="default.edit.label" args="[entityName]"/></title>
	</head>
	<body>
		<div class="container-fluid">
			<legend>Editar Bien</legend>
			<div class="panel panel-default">
				<div class="panel-body">
					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
					<g:hasErrors bean="${bienInstance}">
						<ul class="errors" role="alert">
							<g:eachError bean="${bienInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/>
								</li>
							</g:eachError>
						</ul>
					</g:hasErrors>
					<g:form url="[resource:bienInstance, action:'update']" method="PUT" id="form_edit" class="form-horizontal">
						<g:hiddenField name="version" value="${bienInstance?.version}" />
						<fieldset>
							<g:render template="form"/>
						</fieldset>
					</g:form>
				</div>
				<div class="panel-footer">
					<g:link action="show" id="${bienInstance.id}" class="btn btn-default">Cancelar</g:link>
					<g:submitButton form="form_edit" name="update" value="Guardar" class="btn btn-primary"/>
				</div>
			</div>
		</div>
	</body>
</html>
