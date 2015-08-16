<%@ page import="abm.Estado" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'estado.label', default: 'Estado')}" />
		<title><g:message code="Listado de estados" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container-fluid" style="margin-top:20px">
			<div id="list-estado" class="content scaffold-list" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>
				<div class="table-responsive">
					<table>
						<thead>
							<tr>
								<g:sortableColumn property="Nombre de Estado" title="${message(code: 'estado.nombre.label', default: 'Nombre de Estado')}" />
								<g:sortableColumn property="fechaAlta" title="${message(code: 'estado.fechaAlta.label', default: 'Fecha Alta')}" />
							<!--		<g:sortableColumn property="fechaBaja" title="${message(code: 'estado.fechaBaja.label', default: 'Fecha Baja')}" />-->
							</tr>
						</thead>
						<tbody>
							<g:each in="${estadoInstanceList}" status="i" var="estadoInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									<td><g:link action="show" id="${estadoInstance.id}">${fieldValue(bean: estadoInstance, field: "nombre")}</g:link></td>
									<td><g:formatDate date="${estadoInstance.fechaAlta}" /></td>
								<!--		<td><g:formatDate date="${estadoInstance.fechaBaja}" /></td>-->
								</tr>
							</g:each>
						</tbody>
					</table>
				</div>
				<div class="pagination">
					<g:paginate total="${estadoInstanceCount ?: 0}" />
				</div>
			</div>
		</div>
	</body>
</html>
