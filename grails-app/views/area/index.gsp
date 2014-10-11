
<%@ page import="abm.Area" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'area.label', default: 'Area')}" />
		<title><g:message code="Listado de &aacutereas" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container-fluid" style="margin-top:20px">
			<div id="list-area" class="content scaffold-list" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>	
				<div class="table-responsive">
					<table>
						<thead>
							<tr>
								<g:sortableColumn property="Nombre de Area" title="${message(code: 'area.nombrearea.label', default: 'Nombre de Area')}" />
								<g:sortableColumn property="fechaAlta" title="${message(code: 'area.fechaAlta.label', default: 'Fecha Alta')}" />
								<g:sortableColumn property="fechaBaja" title="${message(code: 'area.fechaBaja.label', default: 'Fecha Baja')}" />
							</tr>
						</thead>
						<tbody>
							<g:each in="${areaInstanceList}" status="i" var="areaInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									<td><g:link action="show" id="${areaInstance.id}">${fieldValue(bean: areaInstance, field: "nombrearea")}</g:link></td>
									<td><g:formatDate date="${areaInstance.fechaAlta}" /></td>
									<td><g:formatDate date="${areaInstance.fechaBaja}" /></td>
								</tr>
							</g:each>
						</tbody>
					</table>
				</div>
				<div class="pagination">
					<g:paginate total="${areaInstanceCount ?: 0}" />
				</div>
			</div>
		</div>
	</body>
</html>
