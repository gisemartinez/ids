<%@ page import="abm.Bien" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bien.label', default: 'Bien')}" />
		<title><g:message code="Bien creado"/></title>
	</head>
	<body>
		<!--Crear Bien-->
		<sec:ifAnyGranted roles="ROLE_SUPERVISOR,ROLE_ENCARGADO">
			<div class="collapse" id="crearBien">
				<g:include controller="bien" action="create" />
			</div>
		</sec:ifAnyGranted>
		<div class="container-fluid">
			<!--Alertas-->
			<g:if test="${flash.message}">
				<div class="alert alert-dismissible alert-success" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</i></span>
					</button>
					${flash.message}
				</div>
			</g:if>
			<legend>Detalle</legend>
			<div class="panel panel-default" style="margin:0 auto; max-width:600px">
				<div class="panel-body">
					<div class="list-group">
						<div class="list-group-item">
							<div class="row-content">
								<g:if test="${bienInstance?.codigoDeSerie}">
									<h4 class="list-group-item-heading"><g:message code="bien.codigoDeSerie.label" default="Id Bien"/></h4>
									<p class="list-group-item-text"><g:fieldValue bean="${bienInstance}" field="codigoDeSerie"/></p>
								</g:if>
							</div>
						</div>
						<div class="list-group-item">
							<div class="row-content">
								<g:if test="${bienInstance?.nombreBien}">
									<h4 class="list-group-item-heading"><g:message code="bien.nombreBien.label" default="Denominaci&oacuten"/></h4>
									<p class="list-group-item-text"><g:fieldValue bean="${bienInstance}" field="nombreBien"/></p>
								</g:if>
							</div>
						</div>
						<div class="list-group-item">
							<div class="row-content">
								<g:if test="${bienInstance?.descripcion}">
									<h4 class="list-group-item-heading"><g:message code="bien.descripcion.label" default="Descripci&oacuten"/></h4>
									<p class="list-group-item-text"><g:fieldValue bean="${bienInstance}" field="descripcion"/></p>
								</g:if>
							</div>
						</div>
						<div class="list-group-item">
							<div class="row-content">
								<g:if test="${bienInstance?.responsableBien}">
									<h4 class="list-group-item-heading"><g:message code="bien.responsableBien.label" default="Responsable"/></h4>
									<p class="list-group-item-text">
										<g:link controller="Persona" action="show" id="${bienInstance?.responsableBien?.id}">${bienInstance?.responsableBien?.encodeAsHTML()}</g:link>
									</p>
								</g:if>
							</div>
						</div>
						<div class="list-group-item">
							<div class="row-content">
								<g:if test="${bienInstance?.tipo}">
									<h4 class="list-group-item-heading"><g:message code="bien.tipo.label" default="Tipo"/></h4>
									<p class="list-group-item-text">
										<g:link controller="tipo" action="show" id="${bienInstance?.tipo?.id}">${bienInstance?.tipo?.encodeAsHTML()}</g:link>
									</p>
								</g:if>
							</div>
						</div>
						<div class="list-group-item">
							<div class="row-content">
								<g:if test="${bienInstance?.estado}">
									<h4 class="list-group-item-heading"><g:message code="bien.estado.label" default="Estado"/></h4>
									<p class="list-group-item-text">
										<g:link controller="estado" action="show" id="${bienInstance?.estado?.id}">${bienInstance?.estado?.encodeAsHTML()}</g:link>
									</p>
								</g:if>
							</div>
						</div>
						<div class="list-group-item">
							<div class="row-content">
								<g:if test="${bienInstance?.ubicacion}">
									<h4 class="list-group-item-heading"><g:message code="bien.ubicacion.label" default="Ubicaci&oacuten"/></h4>
									<p class="list-group-item-text">
										<g:link controller="ubicacion" action="show" id="${bienInstance?.ubicacion?.id}">${bienInstance?.ubicacion?.encodeAsHTML()}</g:link>
									</p>
								</g:if>
							</div>
						</div>
						<div class="list-group-item">
							<div class="row-content">
								<g:if test="${bienInstance?.area}">
									<h4 class="list-group-item-heading"><g:message code="bien.area.label" default="Area"/></h4>
									<p class="list-group-item-text">
										<g:link controller="area" action="show" id="${bienInstance?.area?.id}">${bienInstance?.area?.encodeAsHTML()}</g:link>
									</p>
								</g:if>
							</div>
						</div>
					</div>

					<g:form url="[resource:bienInstance, action:'delete']" method="DELETE" id="form_show_bien">
						<fieldset>
							<div class="col-lg-12">
								<button type="submit" form="form_show_bien" class="btn btn-danger mdi-action-delete"></button>
								<g:link action="edit" resource="${bienInstance}" class="btn btn-primary mdi-content-create"></g:link>
							</div>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>
