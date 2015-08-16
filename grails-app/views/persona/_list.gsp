<g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}"/>
<div id="list">

	<g:if test="${flash.message}">
		<div class="alert alert-dismissible alert-danger" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true" aria-label="Close">×</button>
			<i class="mdi-alert-error"></i> <strong>Error:</strong> ${flash.message}
		</div>
	</g:if>

	<table id="myTable">
		<thead>
			<tr>
				<util:remoteSortableColumn property="nombre" title="${message(code: 'persona.nombre.label', default: 'Nombre')}" update="list" action="list" params="${params}"/>
				<util:remoteSortableColumn property="apellido" title="${message(code: 'persona.apellido.label', default: 'Apellido')}" update="list" action="list" params="${params}"/>
				<util:remoteSortableColumn property="dni" title="${message(code: 'persona.dni.label', default: 'DNI')}" update="list" action="list" params="${params}"/>
				<th><g:message code="persona.area.label" default="Area"/></th>
				<util:remoteSortableColumn property="fechaAlta" title="${message(code: 'persona.fechaAlta.label', default: 'Fecha Alta')}" update="list" action="list" params="${params}"/>
			</tr>
		</thead>
		<tbody>
			<g:each in="${personaInstanceList}" status="i" var="personaInstance">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'} clickable" data-id="${personaInstance.id}" data-entity="${entityName}">
					<td>${fieldValue(bean: personaInstance, field: "nombre")}</td>
					<td>${fieldValue(bean: personaInstance, field: "apellido")}</td>
					<td>${fieldValue(bean: personaInstance, field: "dni")}</td>
					<td>${fieldValue(bean: personaInstance, field: "area")}</td>
					<td><g:formatDate format="yyyy-MM-dd" date="${personaInstance.fechaAlta}" /></td>
				</tr>
			</g:each>
		</tbody>
	</table>
	<div style="text-align:right">
		<util:remotePaginate action="list" total="${personaInstanceCount ?: 0}" params="${params}" update="list" prev="«" next="»"/>
	</div>

	<g:render template="/table-script"/>

</div>
