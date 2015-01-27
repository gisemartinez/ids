<%@ page import="abm.Area" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'area.label', default: 'Area')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
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
						<a class="back" href="/${grailsApplication.config.nombreAplicacion}/area/index">
							<i class="md md-arrow-back"></i>
						</a>
					</li>
					<li><a>Detalle</a></li>
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
			<div class="">
				<g:include controller="area" action="create" />
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
						<g:if test="${areaInstance?.nombrearea}">
							<li class="list-group-item">
								<strong>
									<span id="nombrearea-label" class="property-label"><g:message code="area.nombrearea.label" default="Nombre del Area" /></span>
								</strong>
								<span class="property-value" aria-labelledby="nombrearea-label"><g:fieldValue bean="${areaInstance}" field="nombrearea"/></span>
							</li>
						</g:if>
						<g:if test="${areaInstance?.fechaAlta}">
							<li class="list-group-item">
								<strong>
									<span id="fechaAlta-label" class="property-label"><g:message code="area.fechaAlta.label" default="Fecha Alta" /></span>
								</strong>
								<span class="property-value" aria-labelledby="fechaAlta-label"><g:formatDate format="dd-MM-yyyy" date="${areaInstance?.fechaAlta}" /></span>
							</li>
						</g:if>
						<!--<g:if test="${areaInstance?.fechaBaja}">
							<li class="list-group-item">
								<strong>
									<span id="fechaBaja-label" class="property-label"><g:message code="area.fechaBaja.label" default="Fecha Baja" /></span>
								</strong>
								<span class="property-value" aria-labelledby="fechaBaja-label"><g:formatDate date="${areaInstance?.fechaBaja}" /></span>
							</li>
						</g:if>-->
					</ul>
					<g:form url="[resource:areaInstance, action:'delete']" method="DELETE" id="form_show_area">
					</g:form>
				</div>
				<div class="panel-footer" >
					<g:link action="edit" resource="${areaInstance}" style="padding: 0px 12px; color:#777777"><i class="md md-edit"></i></g:link>
					<button class="btn btn-link" type="submit" form="form_show_area" style="padding: 0px 12px; color:#777777">
						<i class="md md-delete"></i>
					</button>
				</div>
			</div>
		</div>
	</body>
</html>
