<%@ page import="abm.Area" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'area.label', default: 'Area')}"/>
		<title><g:message code="Listado de &aacutereas" args="[entityName]"/></title>
		<asset:javascript src="tablefilter.js"/>
	</head>
	<body>
		<!--Crear Area-->
		<div id="create">
			<g:include controller="area" action="create"/>
		</div>
		<ul class="mfb-component--br" data-mfb-toggle="hover">
			<li class="mfb-component__wrap">
				<a id="create" class="mfb-component__button--main" data-panel-height="119">
					<i class="mfb-component__main-icon--resting mdi-content-add"></i>
					<i class="mfb-component__main-icon--active mdi-content-add"></i>
				</a>
			</li>
		</ul>
		<!-- Fin Crear -->
		<div class="container-fluid">
			<div id="list-area" class="content scaffold-list" role="main">
				<!--Alertas-->
				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>	
				<legend>Listado de Áreas</legend>
				<table id="myTable">
					<thead>
						<tr>
							<g:sortableColumn property="nombrearea" title="${message(code: 'area.nombrearea.label', default: 'Nombre de Area')}" />
							<g:sortableColumn property="fechaAlta" title="${message(code: 'area.fechaAlta.label', default: 'Fecha Alta')}" />
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${areaInstanceList}" status="i" var="areaInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td>${fieldValue(bean: areaInstance, field: "nombrearea")}</td>
								<td><g:formatDate format="dd-MM-yyyy" date="${areaInstance.fechaAlta}" /></td>
								<td>
									<g:link action="show" id="${areaInstance.id}" class="mdi-action-assignment"></i></g:link>
									<g:link action="edit" id="${areaInstance.id}" class="mdi-editor-mode-edit"></g:link>
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
				<!-- <g:paginate controller="area" action="index" total="${areaInstanceCount}" params="${params}"/> -->
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
		<script>
			$(document).ready(function(){
				$('#flt1_myTable').bootstrapMaterialDatePicker({ format : 'DD-MM-YYYY', lang : 'es', weekStart : 0, cancelText : 'CANCELAR' });
			})
		</script>
	</body>
</html>
