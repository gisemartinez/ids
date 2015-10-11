<g:set var="entityName" value="${message(code: 'bien.label', default: 'Bien')}"/>
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
				<util:remoteSortableColumn property="codigoDeSerie" title="${message(code: 'bien.codigoDeSerie.label', default: 'C&oacutedigo de serie')}" update="list" action="list" params="${params}"/>
				<util:remoteSortableColumn property="nombreBien" title="${message(code: 'bien.codigoDeSerie.label', default: 'Denominaci&oacuten')}" update="list" action="list" params="${params}"/>
				<th><g:message code="bien.responsableBien.label" default="Responsable" /></th>
				<util:remoteSortableColumn property="descripcion" title="${message(code: 'bien.descripcion.label', default: 'Descripci&oacuten')}" 
				update="list" action="list" params="${params}"/>
				<th><g:message code="bien.estado.label" default="Estado" /></th>
				<th><g:message code="bien.tipo.label" default="Tipo" /></th>
				<th><g:message code="bien.ubicacion.label" default="Ubicacion" /></th>
				<th><g:message code="bien.area.label" default="Departamento" /></th>
				<util:remoteSortableColumn property="fechaAlta" title="${message(code: 'bien.fechaAlta.label', default: 'Fecha Alta')}" 
				style="min-width: 100px" update="list" action="list" params="${params}"/>
			</tr>
		</thead>
		<tbody>
			<g:each in="${bienInstanceList}" status="i" var="bienInstance">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'} clickable" data-id="${bienInstance.id}" data-entity="${entityName}" data-name="${bienInstance.nombreBien}">
					<td>${fieldValue(bean: bienInstance, field: "codigoDeSerie")}</td>
					<td>${fieldValue(bean: bienInstance, field: "nombreBien")}</td>
					<td>${fieldValue(bean: bienInstance, field: "responsableBien")}</td>
					<td>${fieldValue(bean: bienInstance, field: "descripcion")}</td>
					<td><span id="${bienInstance.estado}" class="label ${bienInstance.estado}">&nbsp${fieldValue(bean: bienInstance, field: "estado")}&nbsp</span></td>
					<td>${fieldValue(bean: bienInstance, field: "tipo")}</td>
					<td>${fieldValue(bean: bienInstance, field: "ubicacion")}</td>
					<td>${fieldValue(bean: bienInstance, field: "area")}</td>
					<td><g:formatDate format="yyyy-MM-dd" date="${bienInstance.fechaAlta}" /></td>
					<g:form url="[resource:bienInstance, action:'delete']" method="DELETE" id='form_delete_${bienInstance.id}'></g:form>
				</tr>
			</g:each>
		</tbody>
	</table>
	
	<util:remotePaginate action="list" total="${bienInstanceCount ?: 0}" params="${params}" update="list" prev="«" next="»"/>

	<g:render template="/table-script"/>

</div>
