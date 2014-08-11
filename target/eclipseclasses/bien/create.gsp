<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bien.label', default: 'Bien')}" />

		<title><g:message code="Creación de Bienes" /></title>
	</head>
	<body>
		
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="create-bien" class="content scaffold-create" role="main">
						<h1>Crear <b>Bien</b></h1>
						<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
						</g:if>
						<g:hasErrors bean="${bienInstance}">
						<ul class="errors" role="alert">
							<g:eachError bean="${bienInstance}" var="error">
							<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
							</g:eachError>
						</ul>
						</g:hasErrors>
						<g:form url="[resource:bienInstance, action:'save']" >
							<fieldset class="form">
								<g:render template="form"/>
							</fieldset>
							<fieldset class="buttons">
								<g:submitButton name="create" class="save btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}"/>
							</fieldset>							
						</g:form>
					</div>
				</div>
			</div>
			<div class="col-md-3"></div>
		</div>
	</body>
</html>