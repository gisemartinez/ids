<%@ page import="abm.Bien" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bien.label', default: 'Bien')}"/>
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<asset:javascript src="tablefilter.js"/>
	</head>
	<body>
		<!--Crear Bien-->
		<sec:ifAnyGranted roles="ROLE_SUPERVISOR,ROLE_ENCARGADO">
			<g:render template="create"/>
		</sec:ifAnyGranted>
		<g:render template="list"/>
	</body>
</html>
