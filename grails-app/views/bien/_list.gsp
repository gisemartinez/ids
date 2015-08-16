<div class="container-fluid">
	<g:if test="${flash.message}">
		<div class="alert alert-dismissible alert-danger" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</i></span>
			</button>
			<p>${flash.message}</p>
		</div>
	</g:if>
	<legend>Listado de Bienes</legend>
	<table id="myTable">
		<thead>
			<tr>
				<g:sortableColumn property="codigoDeSerie" title="${message(code: 'bien.codigoDeSerie.label', default: 'C&oacutedigo de serie')}" />
				<g:sortableColumn property="nombreBien" title="${message(code: 'bien.codigoDeSerie.label', default: 'Denominaci&oacuten')}" />
				<th><g:message code="bien.responsableBien.label" default="Responsable" /></th>
				<!-- <g:sortableColumn property="responsableBien" title="${message(code: 'bien.codigoDeSerie.label', default: 'Responsable')}" /> -->
				<g:sortableColumn property="descripcion" title="${message(code: 'bien.descripcion.label', default: 'Descripci&oacuten')}" />
				<th><g:message code="bien.estado.label" default="Estado" /></th>
				<th><g:message code="bien.tipo.label" default="Tipo" /></th>
				<th><g:message code="bien.ubicacion.label" default="Ubicacion" /></th>
				<th><g:message code="bien.area.label" default="Departamento" /></th>
				<g:sortableColumn property="fechaAlta" title="${message(code: 'bien.fechaAlta.label', default: 'Fecha Alta')}" style="min-width: 100px"/>
				<th>Acciones</th>
			</tr>
		</thead>
		<tbody>
			<g:each in="${bienInstanceList}" status="i" var="bienInstance">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					<td>${fieldValue(bean: bienInstance, field: "codigoDeSerie")}</td>
					<td>${fieldValue(bean: bienInstance, field: "nombreBien")}</td>
					<td>${fieldValue(bean: bienInstance, field: "responsableBien")}</td>
					<td>${fieldValue(bean: bienInstance, field: "descripcion")}</td>
					<td><span id="${bienInstance.estado}" class="label ${bienInstance.estado}">&nbsp${fieldValue(bean: bienInstance, field: "estado")}&nbsp</span></td>
					<td>${fieldValue(bean: bienInstance, field: "tipo")}</td>
					<td>${fieldValue(bean: bienInstance, field: "ubicacion")}</td>
					<td>${fieldValue(bean: bienInstance, field: "area")}</td>
					<td><g:formatDate format="dd-MM-yyyy" date="${bienInstance.fechaAlta}" /></td>
					<td>
						<g:link action="show" id="${bienInstance.id}" class="mdi-action-assignment"></g:link>
						<g:link action="edit" id="${bienInstance.id}" class="mdi-editor-mode-edit"></g:link>
						<g:link data-form="${bienInstance.id}" data-entity="${entityName}" class="mdi-action-delete delete"></g:link>
						<g:form url="[resource:bienInstance, action:'delete']" method="DELETE" id='${bienInstance.id}'></g:form>
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>
</div>

<script language="javascript" type="text/javascript">
	var myTableFilters = {
		col_4: "select",
		col_5: "select",
		col_6: "select",
		col_7: "select",
		col_9: "none",
		btn: true,
		btn_text: "Buscar"
		//,paging: true
		//,paging_length: 1
	}
	setFilterGrid("myTable",0,myTableFilters);

	$('#flt8_myTable').bootstrapMaterialDatePicker({
		format: 'DD-MM-YYYY',
		lang: 'es',
		weekStart: 0,
		time: false,
		cancelText: 'CANCELAR',
		okText: 'ACEPTAR'
	})
</script>