<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>

<body>
		<div class="container-fluid">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title"><g:message code="default.create.label" args="[entityName]"/></h3>
				</div>
				<div class="panel-body">
					<!-- <g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
					</g:if> -->
					<g:hasErrors bean="${personaInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="$personaInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
					</g:hasErrors>
					<g:form url="[resource:personaInstance, action:'save']" >
						<fieldset class="form">
							<g:render template="form"/>
							<g:link class="btn btn-primary cancel" action="index" resource="${personaInstance}"></g:link>
							<button type="submit" class="btn btn-primary save"></button>
						</fieldset>
					</g:form>				
				</div>
				<g:message code="* Campo Obligatorio"/>
			</div>	
		</div>
	</body>
</html>
