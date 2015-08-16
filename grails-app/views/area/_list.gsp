<g:set var="entityName" value="${message(code: 'area.label', default: 'Área')}"/>
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
				<util:remoteSortableColumn property="nombrearea" title="${message(code: 'area.nombrearea.label', default: 'Nombre de Area')}" update="list" action="list" params="${params}"/>
				<util:remoteSortableColumn property="fechaAlta" title="${message(code: 'area.fechaAlta.label', default: 'Fecha Alta')}" style="min-width: 100px" update="list" action="list" params="${params}"/>
			</tr>
		</thead>
		<tbody>
			<g:each in="${areaInstanceList}" status="i" var="areaInstance">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'} clickable" data-id="${areaInstance.id}" data-entity="${entityName}" data-name="${areaInstance.nombrearea}">
					<td>${fieldValue(bean: areaInstance, field: "nombrearea")}</td>
					<td><g:formatDate format="dd-MM-yyyy" date="${areaInstance.fechaAlta}" /></td>
				</tr>
			</g:each>
		</tbody>
	</table>

	<div style="text-align:right">
		<util:remotePaginate action="list" update="list" prev="«" next="»" total="${areaInstanceCount ?: 0}" params="${params}" />
	</div>

	<g:render template="/table-script"/>

</div>
