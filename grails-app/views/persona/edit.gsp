<%@ page import="abm.Persona" %>
<%@ page import="com.testapp.User" %>

<!DOCTYPE html>
<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="Persona" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container-fluid">
			<div class="panel panel-primary" style="margin-top:1em; padding-bottom:15px;" >
				<div class="panel-heading">
					<h3 class="panel-title"><g:message code="default.edit.label" args="[entityName]"/></h3>
				</div>
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
					<g:form url="[resource:personaInstance, action:'update']" method="PUT" >
						<g:hiddenField name="version" value="${personaInstance?.version}" />
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>
						<div class="container-fluid">
							<a href="/${grailsApplication.config.nombreAplicacion}/persona/index" class="cancel">Cancelar</a>
							<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
						</div>
						<!-- container-fluid del form -->
					</g:form>
				</div>
				<!-- panel-body -->
			</div>
			<!-- panel-primary -->
		</div>
		<!-- container-fluid del body -->
	</body>
</html>
