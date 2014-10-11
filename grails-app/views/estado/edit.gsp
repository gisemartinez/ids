<%@ page import="abm.Estado" %>
<!DOCTYPE html>

<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'estado.label', default: 'Estado')}" />
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
					<g:hasErrors bean="${estadoInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="$estadoInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
					</g:hasErrors>
					<g:form url="[resource:estadoInstance, action:'update']" method="PUT" >
						<g:hiddenField name="version" value="$estadoInstance?.version}" />
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>
						<div class="container-fluid">
							<a href="/${grailsApplication.config.nombreAplicacion}/estado/index" class="cancel">Cancelar</a>
							<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
						</div>
					</g:form>
				</div>
			</div>
		</div>
	</body>