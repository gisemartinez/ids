<%@ page import="abm.Persona" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}"/>
		<title><g:message code="Listado de Personas"/></title>
		<asset:javascript src="tablefilter.js"/>
	</head>
	<body>
		<!--Crear Persona-->
		<div id="create">
			<g:include controller="persona" action="create"/>
		</div>
		<ul class="mfb-component--br" data-mfb-toggle="hover">
			<li class="mfb-component__wrap">
				<a class="mfb-component__button--main" href="#create" data-panel-height="309">
					<i class="mfb-component__main-icon--resting mdi-content-add"></i>
					<i class="mfb-component__main-icon--active mdi-content-add"></i>
				</a>
			</li>
		</ul>
		<div class="container-fluid">
			<div id="list-usuario" class="content scaffold-list" role="main">
				<g:if test="${flash.message}">
					<div class="alert alert-dismissible alert-danger" role="alert">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true" aria-label="Close">×</button>
						<i class="mdi-alert-error"></i> <strong>Error:</strong> ${flash.message}
					</div>
				</g:if>
				<legend>Listado de Personas</legend>
				<table id="myTable">
					<thead>
						<tr>
							<g:sortableColumn property="nombre" title="${message(code: 'persona.nombre.label', default: 'Nombre')}"/>
							<g:sortableColumn property="apellido" title="${message(code: 'persona.apellido.label', default: 'Apellido')}"/>
							<g:sortableColumn property="dni" title="${message(code: 'persona.dni.label', default: 'Dni')}"/>
							<th><g:message code="persona.area.label" default="Area"/></th>
							<g:sortableColumn property="fechaAlta" title="${message(code: 'persona.fechaAlta.label', default: 'Fecha Alta')}"/>
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${personaInstanceList}" status="i" var="personaInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td>${fieldValue(bean: personaInstance, field: "nombre")}</td>
								<td>${fieldValue(bean: personaInstance, field: "apellido")}</td>
								<td>${fieldValue(bean: personaInstance, field: "dni")}</td>
								<td>${fieldValue(bean: personaInstance, field: "area")}</td>
								<td><g:formatDate format="dd-MM-yyyy" date="${personaInstance.fechaAlta}" /></td>
								<td>
									<g:link action="show" id="${personaInstance.id}" class="mdi-action-assignment"></g:link>
									<g:link action="edit" id="${personaInstance.id}" class="mdi-editor-mode-edit"></g:link>
									<g:link data-form="${personaInstance.id}" data-entity="${entityName}" class="mdi-action-delete delete"></g:link>
									<g:form url="[resource:personaInstance, action:'delete']" method="DELETE" id='${personaInstance.id}'></g:form>
								</td>	
							</tr>
						</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${personaInstanceCount ?: 0}" />
				</div>				
			</div>
		</div>
		<script language="javascript" type="text/javascript">
			var myTableFilters = {
				col_3: "select",
				col_5: "none",
				btn: true,
				btn_text: "Buscar"
			}
			setFilterGrid("myTable",0,myTableFilters);
		</script>
	</body>
</html>
