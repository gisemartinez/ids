
<%@ page import="abm.Bien" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bien.label', default: 'Bien')}" />
		<title><g:message code="Listado de bienes" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container-fluid" style="margin-top:20px">
			<div id="list-bien" class="content scaffold-list" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>
				<div class="table-responsive">
					<table>
						<thead>
							<tr>
								<g:sortableColumn property="codigoDeSerie" title="${message(code: 'bien.codigoDeSerie.label', default: 'Código de serie')}" />
								<g:sortableColumn property="descripcion" title="${message(code: 'bien.descripcion.label', default: 'Descripcion')}" />
								<th><g:message code="bien.estado.label" default="Estado" /></th>
								<th><g:message code="bien.tipo.label" default="Tipo" /></th>
								<th><g:message code="bien.ubicacion.label" default="Ubicacion" /></th>
								<th><g:message code="bien.area.label" default="Area" /></th>
								<g:sortableColumn property="fechaAlta" title="${message(code: 'bien.fechaAlta.label', default: 'Fecha Alta')}" />
								<g:sortableColumn property="fechaBaja" title="${message(code: 'bien.fechaBaja.label', default: 'Fecha Baja')}" />
							</tr>
						</thead>
						<tbody>
							<g:each in="${bienInstanceList}" status="i" var="bienInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									<td><g:link action="show" id="${bienInstance.id}">${fieldValue(bean: bienInstance, field: "codigoDeSerie")}</g:link></td>
									<td>${fieldValue(bean: bienInstance, field: "descripcion")}</td>
									<td>${fieldValue(bean: bienInstance, field: "estado")}</td>
									<td>${fieldValue(bean: bienInstance, field: "tipo")}</td>
									<td>${fieldValue(bean: bienInstance, field: "ubicacion")}</td>
									<td>${fieldValue(bean: bienInstance, field: "area")}</td>
									<td><g:formatDate date="${bienInstance.fechaAlta}" /></td>
									<td><g:formatDate date="${bienInstance.fechaBaja}" /></td>
								</tr>
							</g:each>
						</tbody>
					</table>
				</div>
				<div class="pagination">
					<g:paginate total="${bienInstanceCount ?: 0}" />
				</div>
			</div>
		</div>
	</body>
</html>
