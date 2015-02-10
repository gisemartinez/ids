<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ubicacion.label', default: 'Ubicacion')}" />
		<title><g:message code="Listado de ubicaciones" args="[entityName]" /></title>
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
		    	<g:include controller="ubicacion" action="create" />
			</div>
		</div>
		<div class="container-fluid">
			<div id="list-area" class="content scaffold-list" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>
				<table>
					<thead>
						<tr>
							<g:sortableColumn property="Nombre de la Ubicacion" title="${message(code: 'ubicacion.nombreubica.label', default: 'Nombre de Ubicaci&oacuten')}" />
							<g:sortableColumn property="fechaAlta" title="${message(code: 'ubicacion.fechaAlta.label', default: 'Fecha Alta')}" />
							<!--<g:sortableColumn property="fechaBaja" title="${message(code: 'ubicacion.fechaBaja.label', default: 'Fecha Baja')}" />-->
						</tr>
					</thead>
					<tbody>
						<g:each in="${ubicacionInstanceList}" status="i" var="ubicacionInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td><g:link action="show" id="${ubicacionInstance.id}">${fieldValue(bean: ubicacionInstance, field: "nombreubica")}</g:link></td>
								<td><g:formatDate format="dd-MM-yyyy" date="${ubicacionInstance.fechaAlta}" /></td>
								<!--<td><g:formatDate date="${ubicacionInstance.fechaBaja}" /></td>-->
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
