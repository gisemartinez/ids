
<%@ page import="abm.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container-fluid">
			<div id="list-usuario" class="content scaffold-list" role="main">
				<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>
				<table>
				<thead>
						<tr>
							<g:sortableColumn property="nombre" title="${message(code: 'usuario.nombre.label', default: 'Nombre')}" />
							<g:sortableColumn property="apellido" title="${message(code: 'usuario.apellido.label', default: 'Apellido')}" />
							<g:sortableColumn property="DNI" title="${message(code: 'usuario.DNI.label', default: 'DNI')}" />
							<g:sortableColumn property="email" title="${message(code: 'usuario.email.label', default: 'Email')}" />
							<g:sortableColumn property="fechaAlta" title="${message(code: 'usuario.fechaAlta.label', default: 'Fecha Alta')}" />
						
							<g:sortableColumn property="fechaBaja" title="${message(code: 'usuario.fechaBaja.label', default: 'Fecha Baja')}" />
						</tr>
					</thead>
					<tbody>
					<g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "DNI")}</g:link></td>
						
							<td>${fieldValue(bean: usuarioInstance, field: "apellido")}</td>
						
							<td>${fieldValue(bean: usuarioInstance, field: "email")}</td>
						
							<td><g:formatDate date="${usuarioInstance.fechaAlta}" /></td>
						
							<td><g:formatDate date="${usuarioInstance.fechaBaja}" /></td>
						
							<td>${fieldValue(bean: usuarioInstance, field: "nombre")}</td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${usuarioInstanceCount ?: 0}" />
				</div>
			</div>
		</div>
			
	</body>
</html>
