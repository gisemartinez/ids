<%@ page import="abm.Area" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'area.label', default: 'Area')}" />
		<title><g:message code="Listado de &aacutereas" args="[entityName]" /></title>
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
					<a class="navbar-brand">Listado</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
					<!-- <form class="navbar-form navbar-left" action="busqueda" method="GET" role="search">
						<div class="form-group">
							<input type="text" class="form-control" name="query" placeholder="Buscar por denominacion...">
						</div>
						<button type="submit" class="btn btn-default"><i class="md md-search"></i></button>
					</form> -->
					<ul class="nav navbar-nav navbar-right">
						<li>
							<a data-toggle="collapse" href="#crearArea" aria-expanded="false" aria-controls="crearArea">
								<i class="md md-add"></i>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="collapse" id="crearArea">
			<div>
				<g:include controller="area" action="create" />
			</div>
		</div>
		<div class="container-fluid">
			<div id="list-area" class="content scaffold-list" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>	
				<div class="table-responsive">
					<table>
						<thead>
							<tr>
								<g:sortableColumn property="Nombre de Area" title="${message(code: 'area.nombrearea.label', default: 'Nombre de Area')}" />
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
										<g:link action="show" id="${areaInstance.id}"><i class="md  md-assignment"></i></g:link>
										<g:link action="edit" resource="${areaInstance}"><i class="md md-edit"></i></g:link>
										<button class="btn btn-link" type="submit" form="${areaInstance.id}" style="padding: 0px 0px; border-style: none; color:#f44336">
											<i class="md md-delete"></i>
										</button>
										<g:form url="[resource:areaInstance, action:'delete']" method="DELETE" id='${areaInstance.id}'></g:form>
									</td>
								</tr>
							</g:each>
						</tbody>
					</table>
				</div>
				<div class="pagination">
					<g:paginate total="${areaInstanceCount ?: 0}" />
				</div>
			</div>
		</div>
	</body>
</html>
