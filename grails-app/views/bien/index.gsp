<%@ page import="abm.Bien" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bien.label', default: 'Bien')}"/>
		<title><g:message code="Listado de bienes" args="[entityName]" /></title>
		<asset:javascript src="tablefilter.js"/>
		<asset:stylesheet src="mfb.css"/>
		<asset:javascript src="modernizr.touch.js"/>
	</head>
	<body>
		<!--Crear Bien-->
		<sec:ifAnyGranted roles="ROLE_SUPERVISOR,ROLE_ENCARGADO">
			<div class="collapse" id="crearBien">
				<g:include controller="bien" action="create"/>
			</div>
			<asset:javascript src="mfb.js"/>
			<ul class="mfb-component--br mfb-zoomin" data-mfb-toggle="hover">
				<li class="mfb-component__wrap">
					<!-- the main menu button -->
					<a data-mfb-label="Cancelar" class="mfb-component__button--main">
						<!-- the main button icon visibile by default -->
						<i class="mfb-component__main-icon--resting mdi-content-add"></i>
						<!-- the main button icon visibile when the user is hovering/interacting with the menu -->
						<i class="mfb-component__main-icon--active mdi-content-clear"></i>
					</a>
					<ul class="mfb-component__list">
						<!-- a child button, repeat as many times as needed -->
						<li>
							<a href="#crearBien" data-toggle="collapse" aria-expanded="false" aria-controls="crear" data-mfb-label="Crear bien" class="mfb-component__button--child">
								<i class="mfb-component__child-icon mdi-content-add-box"></i>
							</a>
						</li>
					</ul>
				</li>
			</ul>
		</sec:ifAnyGranted>
		<div class="container-fluid">
			<div id="list-bien" class="content scaffold-list" role="main">
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
								<td><span class="label label-default ${bienInstance.estado}">&nbsp${fieldValue(bean: bienInstance, field: "estado")}&nbsp</span></td>
								<td>${fieldValue(bean: bienInstance, field: "tipo")}</td>
								<td>${fieldValue(bean: bienInstance, field: "ubicacion")}</td>
								<td>${fieldValue(bean: bienInstance, field: "area")}</td>
								<td><g:formatDate format="dd-MM-yyyy" date="${bienInstance.fechaAlta}" /></td>
								<td>
									<g:link action="show" id="${bienInstance.id}"><i class="md md-assignment"></i></g:link>
									<g:link action="edit" resource="${bienInstance}"><i class="md md-edit"></i></g:link>
									<button class="btn btn-link mdi-action-delete" type="submit" form="${bienInstance.id}" style="padding:0 0; margin:0 0; border-style:none; color:#f44336"></button>
									<g:form url="[resource:bienInstance, action:'delete']" method="DELETE" id='${bienInstance.id}'></g:form>
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${bienInstanceCount ?: 0}"/>
				</div>
			</div>
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
			}
			setFilterGrid("myTable",0,myTableFilters);
		</script>
		<script>
			$("a[href='#crearBien']").click(function() {
				$("html, body").animate({ scrollTop: 0 }, "slow");
			})
		</script>
	</body>
</html>
