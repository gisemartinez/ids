<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ubicacion.label', default: 'Ubicacion')}" />
		<title><g:message code="Listado de ubicaciones" args="[entityName]" /></title>
		<asset:javascript src="tablefilter.js"/>
		<asset:stylesheet src="mfb.css"/>
		<asset:javascript src="modernizr.touch.js"/>
	</head>
	<body>
		<!--Crear Ubicacion-->
		<div id="create">
			<g:include controller="ubicacion" action="create" />
		</div>
		<asset:javascript src="mfb.js"/>
		<ul class="mfb-component--br" data-mfb-toggle="hover">
			<li class="mfb-component__wrap">
				<a class="mfb-component__button--main" href="#create" data-panel-height="119">
					<i class="mfb-component__main-icon--resting mdi-content-add"></i>
					<i class="mfb-component__main-icon--active mdi-content-add"></i>
				</a>
			</li>
		</ul>
		<!-- Fin Crear -->
		<div class="container-fluid">
			<div id="list-ubicacion" class="content scaffold-list" role="main">
				<legend>Listado de Ubicaciones</legend>
				<!--Alertas-->
				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>
				<table id="myTable">
					<thead>
						<tr>
							<g:sortableColumn property="nombreubica" title="${message(code: 'ubicacion.nombreubica.label', default: 'Nombre de Ubicaci&oacuten')}"/>
							<g:sortableColumn property="fechaAlta" title="${message(code: 'ubicacion.fechaAlta.label', default: 'Fecha Alta')}"/>
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${ubicacionInstanceList}" status="i" var="ubicacionInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td>${fieldValue(bean: ubicacionInstance, field: "nombreubica")}</td>
								<td><g:formatDate format="dd-MM-yyyy" date="${ubicacionInstance.fechaAlta}" /></td>
								<td>
									<g:link action="show" id="${ubicacionInstance.id}" class="mdi-action-assignment"></g:link>
									<g:link action="edit" id="${ubicacionInstance.id}" class="mdi-editor-mode-edit"></g:link>
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${ubicacionInstanceCount ?: 0}" />
				</div>
			</div>
		</div>
		
		<script language="javascript" type="text/javascript">
			var myTableFilters = {
				col_0: "select",
				col_2: "none",
				btn: true,
				btn_text: "Buscar"
			}
			setFilterGrid("myTable",0,myTableFilters);
		</script>
	</body>
</html>
