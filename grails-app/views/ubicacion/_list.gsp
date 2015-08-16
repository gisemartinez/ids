<g:set var="entityName" value="${message(code: 'ubicacion.label', default: 'Ubicación')}"/>
<div id="list">

	<g:if test="${flash.message}">
		<div class="alert alert-dismissible alert-danger" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</i></span>
			</button>
			<p>${flash.message}</p>
		</div>
	</g:if>

	<table id="myTable">
		<thead>
			<tr>
				<util:remoteSortableColumn property="nombreubica" title="${message(code: 'ubicacion.nombreubica.label', default: 'Nombre de Ubicaci&oacuten')}" update="list" action="list" params="${params}"/>
				<util:remoteSortableColumn property="fechaAlta" title="${message(code: 'ubicacion.fechaAlta.label', default: 'Fecha Alta')}" style="min-width: 100px" update="list" action="list" params="${params}"/>
			</tr>
		</thead>
		<tbody>
			<g:each in="${ubicacionInstanceList}" status="i" var="ubicacionInstance">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'} clickable" data-id="${ubicacionInstance.id}" data-entity="${entityName}" data-name="${ubicacionInstance.nombreubica}">
					<td>${fieldValue(bean: ubicacionInstance, field: "nombreubica")}</td>
					<td><g:formatDate format="dd-MM-yyyy" date="${ubicacionInstance.fechaAlta}"/></td>
				</tr>
			</g:each>
		</tbody>
	</table>

	<div style="text-align:right">
		<util:remotePaginate action="list" total="${ubicacionInstanceCount ?: 0}" params="${params}" update="list" prev="«" next="»"/>
	</div>

	<g:render template="/table-script"/>

</div>
