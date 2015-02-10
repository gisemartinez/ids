<%@ page import="abm.Bien" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bien.label', default: 'Bien')}" />
		<title><g:message code="Listado de bienes" args="[entityName]" /></title>
	</head>
	<body>
		<nav class="navbar navbar-default barra_acciones">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Listado</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
					<form class="navbar-form navbar-left" action="busqueda" method="GET" role="search">
						<div class="form-group">
							<input type="text" class="form-control" name="query" placeholder="Buscar por denominacion...">
						</div>
						<button type="submit" class="btn btn-default"><i class="md md-search"></i></button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li>
							<a data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample" id="accion">
								<i class="md md-add"></i>
							</a>
						</li>
						<li class="dropdown filtro">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
								<i class="md md-filter-list"></i>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="/${grailsApplication.config.nombreAplicacion}/bien/index">Todos</a></li>
								<li><a href="/${grailsApplication.config.nombreAplicacion}/bien/estadoAevaluar">A Evaluar</a></li>
								<li><a href="/${grailsApplication.config.nombreAplicacion}/bien/estadoAreparar">A Reparar</a></li>
								<li><a href="/${grailsApplication.config.nombreAplicacion}/bien/estadoEnUso">En Uso</a></li>
								<li><a href="/${grailsApplication.config.nombreAplicacion}/bien/estadoAdonacion">A Donaci&oacuten</a></li>
								<li><a href="/${grailsApplication.config.nombreAplicacion}/bien/estadoAdescarte">A Descarte</a></li>
								<li><a href="/${grailsApplication.config.nombreAplicacion}/bien/estadoBaja">De Baja</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="collapse" id="collapseExample">
			<div class="">
		    		<g:include controller="bien" action="create" />
			</div>
		</div>
		<div class="container-fluid">
			<div id="list-bien" class="content scaffold-list" role="main">
				<g:if test="${flash.message}">
					<div class="alert alert-dismissible alert-danger" role="alert">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
							<span aria-hidden="true">&times;</i></span>
						</button>
						${flash.message}
					</div>
				</g:if>
				<div class="table-responsive">
					<table>
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
								<g:sortableColumn property="fechaAlta" title="${message(code: 'bien.fechaAlta.label', default: 'Fecha Alta')}" />
								<!--<g:sortableColumn property="fechaBaja" title="${message(code: 'bien.fechaBaja.label', default: 'Fecha Baja')}" />-->
								<th><i class="md md-settings"></i></th>
							</tr>
						</thead>
						<tbody>
							<g:each in="${bienInstanceList}" status="i" var="bienInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									<td><g:link action="show" id="${bienInstance.id}">${fieldValue(bean: bienInstance, field: "codigoDeSerie")}</g:link></td>
									<td>${fieldValue(bean: bienInstance, field: "nombreBien")}</td>
									<td>${fieldValue(bean: bienInstance, field: "responsableBien")}</td>
									<td>${fieldValue(bean: bienInstance, field: "descripcion")}</td>
									<td><span class="label label-default ${bienInstance.estado}">&nbsp${fieldValue(bean: bienInstance, field: "estado")}&nbsp</span></td>
									<td>${fieldValue(bean: bienInstance, field: "tipo")}</td>
									<td>${fieldValue(bean: bienInstance, field: "ubicacion")}</td>
									<td>${fieldValue(bean: bienInstance, field: "area")}</td>
									<td><g:formatDate format="dd-MM-yyyy" date="${bienInstance.fechaAlta}" /></td>
									<!--<td><g:formatDate format="dd-MM-yyyy" date="${bienInstance.fechaBaja}" /></td>-->
									<td><g:link action="edit" resource="${bienInstance}"><i class="md md-edit"></i></g:link></td>
								</tr>
							</g:each>
						</tbody>
					</table>
				</div>
				<div class="pagination">
					<g:paginate total="${bienInstanceCount ?: 0}" />
				</div>
			</div>
		</div>
	</body>
</html>
