<%@ page import="abm.Bien" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bien.label', default: 'Bien')}"/>
		<title><g:message code="default.edit.label" args="[entityName]"/></title>
	</head>
	<body>
		<!--Crear Bien-->
		<sec:ifAnyGranted roles="ROLE_SUPERVISOR,ROLE_ENCARGADO">
			<div class="collapse" id="crearBien">
				<g:include controller="bien" action="create" />
			</div>
		</sec:ifAnyGranted>
		<div class="container-fluid">
			<legend>Editar</legend>
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
					<g:form url="[resource:bienInstance, action:'update']" method="PUT" id="form_edit_bien" class="form-horizontal">
						<g:hiddenField name="version" value="${bienInstance?.version}" />
						<fieldset>
							<g:render template="form"/>
							<div class="col-lg-12">
								<g:link action="show" resource="${bienInstance}" class="btn btn-danger mdi-content-clear"></g:link>
								<button type="submit" form="form_edit_bien" class="btn btn-success mdi-action-done"></button>
							</div>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>
