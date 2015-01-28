<%@ page import="abm.Bien" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bien.label', default: 'Bien')}" />
		<title><g:message code="Bien creado" /></title>
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
						<a class="back" href="/${grailsApplication.config.nombreAplicacion}/bien/index">
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
				<g:include controller="bien" action="create" />
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
						<g:if test="${bienInstance?.codigoDeSerie}">
							<li class="list-group-item">
								<strong>
									<span id="codigoDeSerie-label" class="property-label"><g:message code="bien.codigoDeSerie.label" default="Id Bien" /></span>
								</strong>
								<span class="property-value" aria-labelledby="codigoDeSerie-label"><g:fieldValue bean="${bienInstance}" field="codigoDeSerie"/></span>
							</li>
						</g:if>
						<g:if test="${bienInstance?.nombreBien}">
							<li class="list-group-item">
								<strong>
									<span id="nombreBien-label" class="property-label"><g:message code="bien.nombreBien.label" default="Denominaci&oacuten" /></span>
								</strong>
								<span class="property-value" aria-labelledby="codigoDeSerie-label"><g:fieldValue bean="${bienInstance}" field="nombreBien"/></span>
							</li>
						</g:if>
						<g:if test="${bienInstance?.descripcion}">
							<li class="list-group-item">
								<strong>
									<span id="descripcion-label" class="property-label"><g:message code="bien.descripcion.label" default="Descripci&oacuten" /></span>
								</strong>
								<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${bienInstance}" field="descripcion"/></span>
							</li>
						</g:if>
						<g:if test="${bienInstance?.responsableBien}">
							<li class="list-group-item">
								<strong>
									<span id="responsableBien-label" class="property-label"><g:message code="bien.responsableBien.label" default="Responsable" /></span>
								</strong>
								<span class="property-value" aria-labelledby="responsableBien-label"><g:link controller="Persona" action="show" id="${bienInstance?.responsableBien?.id}">${bienInstance?.responsableBien?.encodeAsHTML()}</g:link></span>
							</li>
						</g:if>
						<g:if test="${bienInstance?.tipo}">
							<li class="fieldcontain list-group-item">
								<strong>
									<span id="tipo-label" class="property-label"><g:message code="bien.tipo.label" default="Tipo" /></span>
								</strong>
								<span class="property-value" aria-labelledby="tipo-label"><g:link controller="tipo" action="show" id="${bienInstance?.tipo?.id}">${bienInstance?.tipo?.encodeAsHTML()}</g:link></span>
							</li>
						</g:if>
						<g:if test="${bienInstance?.estado}">
							<li class="fieldcontain list-group-item">
								<strong>
									<span id="estado-label" class="property-label"><g:message code="bien.estado.label" default="Estado" /></span>
								</strong>
								<span class="property-value" aria-labelledby="estado-label"><g:link controller="estado" action="show" id="${bienInstance?.estado?.id}">${bienInstance?.estado?.encodeAsHTML()}</g:link></span>
							</li>
						</g:if>
						<g:if test="${bienInstance?.ubicacion}">
							<li class="fieldcontain list-group-item">
								<strong>
									<span id="ubicacion-label" class="property-label"><g:message code="bien.ubicacion.label" default="Ubicaci&oacuten" /></span>
								</strong>
								<span class="property-value" aria-labelledby="ubicacion-label"><g:link controller="ubicacion" action="show" id="${bienInstance?.ubicacion?.id}">${bienInstance?.ubicacion?.encodeAsHTML()}</g:link></span>
							</li>
						</g:if>
						<g:if test="${bienInstance?.area}">
							<li class="fieldcontain list-group-item list-group-item">
								<strong>
									<span id="area-label" class="property-label"><g:message code="bien.area.label" default="Area" /></span>
								</strong>
								<span class="property-value" aria-labelledby="area-label">
									<g:link controller="area" action="show" id="${bienInstance?.area?.id}">${bienInstance?.area?.encodeAsHTML()}</g:link>
								</span>
							</li>
						</g:if>
					<!-- 	<g:if test="${bienInstance?.fechaAlta}">
							<li class="list-group-item">
								<strong>
									<span id="fechaAlta-label" class="property-label"><g:message code="bien.fechaAlta.label" default="Fecha Alta" /></span>
								</strong>
								<span class="property-value" aria-labelledby="fechaAlta-label"><g:formatDate date="${bienInstance?.fechaAlta}" /></span>
							</li>
						</g:if>
						<g:if test="${bienInstance?.fechaBaja}">
							<li class="list-group-item">
								<strong>
									<span id="fechaBaja-label" class="property-label"><g:message code="bien.fechaBaja.label" default="Fecha Baja" /></span>
								</strong>
								<span class="property-value" aria-labelledby="fechaBaja-label"><g:formatDate date="${bienInstance?.fechaBaja}" /></span>
							</li>
						</g:if>-->
					</ul>
					<g:form url="[resource:bienInstance, action:'delete']" method="DELETE" id="form_show_bien">
						<fieldset class="buttons">
							<!-- <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/> -->	
						</fieldset>
					</g:form>
				</div>
				<div class="panel-footer" >
					<g:link action="edit" resource="${bienInstance}" style="padding: 0px 12px; color:#777777"><i class="md md-edit"></i></g:link>
					<button class="btn btn-link" type="submit" form="form_show_bien" style="padding: 0px 12px; color:#777777">
						<i class="md md-delete"></i>
					</button>
				</div>
			</div>
		</div>
	</body>
</html>
