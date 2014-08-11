<%@ page import="abm.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="edit-usuario" class="content scaffold-edit" role="main">
						<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
						<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
						</g:if>
						<g:hasErrors bean="${usuarioInstance}">
						<ul class="errors" role="alert">
							<g:eachError bean="${usuarioInstance}" var="error">
							<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
							</g:eachError>
						</ul>
						</g:hasErrors>
						<g:form url="[resource:usuarioInstance, action:'update']" method="PUT" >
							<g:hiddenField name="version" value="${usuarioInstance?.version}" />
							<fieldset class="form">
								<g:render template="form"/>
							</fieldset>
							<fieldset class="buttons">
								<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
							</fieldset>
						</g:form>
					</div>

				</div>
				<div class="col-md-3"></div>
			</div>
		</div>
					
	</body>
</html>
