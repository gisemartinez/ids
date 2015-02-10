<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ubicacion.label', default: 'Ubicacion')}" />
		<title><g:message code="Listado de ubicaciones" args="[entityName]" /></title>
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
							<a data-toggle="collapse" href="#crearUbicacion" aria-expanded="false" aria-controls="crearUbicacion">
								<i class="md md-add"></i>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="collapse" id="crearUbicacion">
			<g:include controller="ubicacion" action="create" />
		</div>
		<div class="container-fluid">
			<div id="list-ubicacion" class="content scaffold-list" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>
				<table>
					<thead>
						<tr>
							<g:sortableColumn property="Nombre de la Ubicacion" title="${message(code: 'ubicacion.nombreubica.label', default: 'Nombre de Ubicaci&oacuten')}" />
							<g:sortableColumn property="fechaAlta" title="${message(code: 'ubicacion.fechaAlta.label', default: 'Fecha Alta')}" />
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${ubicacionInstanceList}" status="i" var="ubicacionInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td>${fieldValue(bean: ubicacionInstance, field: "nombreubica")}</td>
								<td><g:formatDate format="dd-MM-yyyy" date="${ubicacionInstance.fechaAlta}" /></td>
								<td>
									<g:link action="show" id="${ubicacionInstance.id}"><i class="md  md-assignment"></i></g:link>
									<g:link action="edit" resource="${ubicacionInstance}"><i class="md md-edit"></i></g:link>
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
	</body>
</html>
