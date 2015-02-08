<%@ page import="abm.Ubicacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ubicacion.label', default: 'Ubicacion')}" />
		<title><g:message code="Ubicacion creada" /></title>
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
			.panel-footer a:hover .md{
				color:black;
				text-decoration:none;
			}
			.panel-footer button:hover .md{
				color:black;
				text-decoration:none;
			}
		</style>
	</head>
	<body>
		<div style="margin-bottom:30px"></div>
		<nav class="navbar navbar-default barra_acciones" role="navigation">
			<div class="container-fluid" style="padding-left:5px;padding-right:25px">
				<ul class="nav navbar-nav navbar-left">
					<li>
						<a class="back" href="/${grailsApplication.config.nombreAplicacion}/ubicacion/index">
							<i class="md md-arrow-back"></i>
						</a>
					</li>
					<li><a>Detalle</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li>
						<a data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
							<i class="md md-add"></i>
						</a>
					</li>
				</ul>
			</div>
		</nav>
		<div class="collapse" id="collapseExample">
			<div class="">
				<g:include controller="ubicacion" action="create" />
			</div>
		</div>
		<div class="container-fluid">
			<div class="panel panel-default">
				<!-- <div class="panel-heading">
					<g:message code="default.show.label" args="[entityName]"/>
				</div> -->
				<div class="panel-body">
					<!-- <g:if test="${flash.message}">
						<div class="message" role="status">
							${flash.message}
						</div>
					</g:if> -->
					<ul class="list-group">
						<g:if test="${ubicacionInstance?.nombreubica}">
							<li class="list-group-item">
								<strong>
									<span id="nombreubica-label" class="property-label"><g:message code="ubicacion.nombreubica.label" default="Nombre de la Ubicacion" /></span>
								</strong>
								<span class="property-value" aria-labelledby="nombreubica-label"><g:fieldValue bean="${ubicacionInstance}" field="nombreubica"/></span>
							</li>
						</g:if>
						<g:if test="${ubicacionInstance?.fechaAlta}">
							<li class="list-group-item">
								<strong>
									<span id="fechaAlta-label" class="property-label"><g:message code="ubicacion.fechaAlta.label" default="Fecha Alta" /></span>
								</strong>
								<span class="property-value" aria-labelledby="fechaAlta-label"><g:formatDate format="dd-MM-yyyy" date="${ubicacionInstance?.fechaAlta}" /></span>
							</li>
						</g:if>
						<g:if test="${ubicacionInstance?.fechaBaja}">
							<li class="list-group-item">
								<strong>
									<span id="fechaBaja-label" class="property-label"><g:message code="ubicacion.fechaBaja.label" default="Fecha Baja" /></span>
								</strong>
								<span class="property-value" aria-labelledby="fechaBaja-label"><g:formatDate format="dd-MM-yyyy" date="${ubicacionInstance?.fechaBaja}" /></span>
							</li>
						</g:if>
					</ul>
					<g:form url="[resource:ubicacionInstance, action:'delete']" method="DELETE" id="form_show_ubicacion">
					</g:form>
				</div>
				<div class="panel-footer" >
					<g:link action="edit" resource="${ubicacionInstance}" style="padding: 0px 12px; color:#777777"><i class="md md-edit"></i></g:link>
					<!--<button class="btn btn-link" type="submit" form="form_show_ubicacion" style="padding: 0px 12px; color:#777777">
						<i class="md md-delete"></i>
					</button>-->
				</div>
			</div>
		</div>
	</body>
</html>
