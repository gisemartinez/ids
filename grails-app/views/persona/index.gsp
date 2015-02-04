<%@ page import="abm.Persona" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="Personas" />
		<title><g:message code="Listado de Personas" /></title>
		<style>
			.barra_acciones{
				position: fixed;
				top: 51px;
				left: 0px;
				border-radius: 0px;
				min-height: 10px;
				width: 100%;
				z-index: 900;
			}
		</style>
	</head>
	<body>
		<div style="margin-bottom:30px"></div>
		<nav class="navbar navbar-default barra_acciones" role="navigation">
			<div class="container-fluid" style="padding-left:5px;padding-right:25px">
				<ul class="nav navbar-nav navbar-left">
					<li><a>Listado</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li>
						<a data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample" id="accion">
							<i class="md md-add"></i>
						</a>
					</li>
				</ul>
			</div>
		</nav>
		<div class="collapse" id="collapseExample">
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
								<!--<g:sortableColumn property="fechaBaja" title="${message(code: 'persona.fechaBaja.label', default: 'Fecha Baja')}" />-->
							</tr>
						</thead>
						<tbody>
						<g:each in="${personaInstanceList}" status="i" var="personaInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td>${fieldValue(bean: personaInstance, field: "nombre")}</td>
								<td><g:link action="show" id="${personaInstance.id}">${fieldValue(bean: personaInstance, field: "apellido")}</g:link></td>
								<td>${fieldValue(bean: personaInstance, field: "dni")}</td>
								<td>${fieldValue(bean: personaInstance, field: "area")}</td>
								<td><g:formatDate format="dd-MM-yyyy" date="${personaInstance.fechaAlta}" /></td>
								<!--<td><g:formatDate date="${personaInstance.fechaBaja}" /></td>-->
							</tr>
						</g:each>
						</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="${personaInstanceCount ?: 0}" />
					</div>
					<!-- /pagination-->
				</div> 
				<!-- /table-responsive -->
			</div>
			<!-- #list .content -->
		</div>
		<!-- .container-fluid -->
	</body>
</html>
