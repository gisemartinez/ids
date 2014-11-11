
<%@ page import="abm.Bien" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bien.label', default: 'Bien')}" />
		<title><g:message code="Listado de bienes" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container-fluid">
			<div id="list-bien" class="content scaffold-list" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>
				
				<ul class="nav nav-tabs" role="tablist" style="margin-bottom:20px;">
					<li class="active dropdown estado">
						<a class="dropdown-toggle" data-toggle="dropdown" href="">
							Filtrar por Estado <span class="caret"></span>
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
				
				<div class="table-responsive">
					<table>
						<thead>
							<tr>
								<g:sortableColumn property="codigoDeSerie" title="${message(code: 'bien.codigoDeSerie.label', default: 'C&oacutedigo de serie')}" />
								<g:sortableColumn property="descripcion" title="${message(code: 'bien.descripcion.label', default: 'Descripcion')}" />
								<th><g:message code="bien.estado.label" default="Estado" /></th>
								<th><g:message code="bien.tipo.label" default="Tipo" /></th>
								<th><g:message code="bien.ubicacion.label" default="Ubicacion" /></th>
								<th><g:message code="bien.area.label" default="Departamento" /></th>
								<g:sortableColumn property="fechaAlta" title="${message(code: 'bien.fechaAlta.label', default: 'Fecha Alta')}" />
								<g:sortableColumn property="fechaBaja" title="${message(code: 'bien.fechaBaja.label', default: 'Fecha Baja')}" />
							</tr>
						</thead>
						<tbody>
							<g:each in="${bienInstanceList}" status="i" var="bienInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									<td><g:link action="show" id="${bienInstance.id}">${fieldValue(bean: bienInstance, field: "codigoDeSerie")}</g:link></td>
									<td>${fieldValue(bean: bienInstance, field: "descripcion")}</td>
									<td>${fieldValue(bean: bienInstance, field: "estado")}</td>
									<td>${fieldValue(bean: bienInstance, field: "tipo")}</td>
									<td>${fieldValue(bean: bienInstance, field: "ubicacion")}</td>
									<td>${fieldValue(bean: bienInstance, field: "area")}</td>
									<td><g:formatDate format="dd-MM-yyyy HH:mm:ss" date="${bienInstance.fechaAlta}" /></td>
									<td><g:formatDate format="dd-MM-yyyy HH:mm:ss" date="${bienInstance.fechaBaja}" /></td>
								</tr>
							</g:each>
						</tbody>
					</table>
				</div>
				<div class="pagination">
					<g:paginate total="${bienInstanceCount ?: 0}" />
				</div>
				<div>Cantidad de bienes dados de alta:${cantidad}</div>
				<p><a href="/abm/bien/estadoAevaluar">Ud tiene ${cantEstado} bienes a evaluar</a></p>
				<p><a href="/abm/bien/estadoAreparar">Ud tiene ${cantEstado1} bienes a reparar</a></p>
				<p><a href="/abm/bien/estadoEnUso">Ud tiene ${cantEstado5} bienes en uso</a></p>
				<p><a href="/abm/bien/estadoAdonacion">Ud tiene ${cantEstado2} bienes para donar</a></p>
				<p><a href="/abm/bien/estadoAdescarte">Ud tiene ${cantEstado3} bienes para descartar</a></p>
				<p><a href="/abm/bien/estadoBajo">Ud tiene ${cantEstado4} bienes para dar de baja</a></p>
			</div>
		</div>
	</body>
</html>
