<%@ page import="abm.PersonaUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'personaUser.label', default: 'PersonaUser')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-personaUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-personaUser" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list personaUser">
				<g:if test="${personaUserInstance?.personaId}">
					<li class="fieldcontain">
						<span id="personaId-label" class="property-label"><g:message code="personaUser.personaId.label" default="Persona Id" /></span>
						<span class="property-value" aria-labelledby="personaId-label"><g:fieldValue bean="${personaUserInstance}" field="personaId"/></span>
					</li>
				</g:if>
				<g:if test="${personaUserInstance?.userId}">
					<li class="fieldcontain">
						<span id="userId-label" class="property-label"><g:message code="personaUser.userId.label" default="User Id" /></span>
						<span class="property-value" aria-labelledby="userId-label"><g:fieldValue bean="${personaUserInstance}" field="userId"/></span>
					</li>
				</g:if>
			</ol>
			<g:form url="[resource:personaUserInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${personaUserInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
