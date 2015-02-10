<%@ page import="abm.Persona" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="Personas"/>
		<title><g:message code="Listado de Personas"/></title>
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
							<a data-toggle="collapse" href="#crearPersona" aria-expanded="false" aria-controls="crearPersona">
								<i class="md md-add"></i>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="collapse" id="crearPersona">
			<div>
				<g:include controller="persona" action="create" />
			</div>
		</div>
		<div class="container-fluid">
			<div id="list-usuario" class="content scaffold-list" role="main">
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
								<g:sortableColumn property="nombre" title="${message(code: 'persona.nombre.label', default: 'Nombre')}" />
								<g:sortableColumn property="apellido" title="${message(code: 'persona.apellido.label', default: 'Apellido')}" />
								<g:sortableColumn property="dni" title="${message(code: 'persona.dni.label', default: 'Dni')}" />
								<th><g:message code="persona.area.label" default="Area" /></th>
								<g:sortableColumn property="fechaAlta" title="${message(code: 'persona.fechaAlta.label', default: 'Fecha Alta')}" />
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
										<g:link action="show" id="${personaInstance.id}"><i class="md  md-assignment"></i></g:link>
										<g:link action="edit" resource="${personaInstance}"><i class="md md-edit"></i></g:link>
										<button class="btn btn-link" type="submit" form="${personaInstance.id}" style="padding: 0px 0px; border-style: none; color:#f44336">
											<i class="md md-delete"></i>
										</button>
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
		</div>
	</body>
</html>
