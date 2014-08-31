
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ubicacion.label', default: 'Ubicacion')}" />
		<title><g:message code="Listado de ubicaciones" args="[entityName]" /></title>
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
								<g:sortableColumn property="Nombre de la Ubicacion" title="${message(code: 'ubicacion.nombreubica.label', default: 'Nombre de Ubicación')}" />
								<g:sortableColumn property="fechaAlta" title="${message(code: 'ubicacion.fechaAlta.label', default: 'Fecha Alta')}" />
								<g:sortableColumn property="fechaBaja" title="${message(code: 'ubicacion.fechaBaja.label', default: 'Fecha Baja')}" />
							</tr>
						</thead>
						<tbody>
							<g:each in="${ubicacionInstanceList}" status="i" var="ubicacionInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									<td><g:link action="show" id="${ubicacionInstance.id}">${fieldValue(bean: ubicacionInstance, field: "nombreubica")}</g:link></td>
									<td><g:formatDate date="${ubicacionInstance.fechaAlta}" /></td>
									<td><g:formatDate date="${ubicacionInstance.fechaBaja}" /></td>
								</tr>
							</g:each>
						</tbody>
					</table>
				</div>
				<div class="pagination">
					<g:paginate total="${ubicacionInstanceCount ?: 0}" />
				</div>
			</div>
		</div>
	</body>
</html>
