<%@ page import="abm.PersonaUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'personaUser.label', default: 'PersonaUser')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-personaUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-personaUser" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="personaId" title="${message(code: 'personaUser.personaId.label', default: 'Persona Id')}" />					
						<g:sortableColumn property="userId" title="${message(code: 'personaUser.userId.label', default: 'User Id')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${personaUserInstanceList}" status="i" var="personaUserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${personaUserInstance.id}">${fieldValue(bean: personaUserInstance, field: "personaId")}</g:link></td>
						<td>${fieldValue(bean: personaUserInstance, field: "userId")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${personaUserInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
