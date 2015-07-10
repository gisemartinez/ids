<%@ page import="abm.Ubicacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ubicacion.label', default: 'Ubicacion')}" />
		<title><g:message code="Ubicacion creada" /></title>
	</head>
	<body>
		<!--Volver al listado-->
		<ul class="mfb-component--br" data-mfb-toggle="hover">
			<li class="mfb-component__wrap">
				<g:link action="index" class="mfb-component__button--main">
					<i class="mfb-component__main-icon--resting mdi-action-list"></i>
					<i class="mfb-component__main-icon--active mdi-action-list"></i>
				</g:link>
			</li>
		</ul>
		<div class="container-fluid">
			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>
			<div class="row">
				<div class="col-lg-6">
					<legend>Detalle de Ubicación</legend>			
					<div class="panel panel-default" style="margin:0 auto 20px">
						<div class="panel-body">
							<div class="list-group">
								<div class="list-group-item">
									<div class="row-content">
										<g:if test="${ubicacionInstance?.nombreubica}">
											<h4 class="list-group-item-heading"><g:message code="ubicacion.nombreubica.label" default="Nombre de la Ubicacion"/></h4>
											<p class="list-group-item-text"><g:fieldValue bean="${ubicacionInstance}" field="nombreubica"/></p>
										</g:if>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row-content">
										<g:if test="${ubicacionInstance?.fechaAlta}">
											<h4 class="list-group-item-heading"><g:message code="ubicacion.fechaAlta.label" default="Fecha Alta"/></h4>
											<p class="list-group-item-text"><g:formatDate format="dd-MM-yyyy" date="${ubicacionInstance?.fechaAlta}"/></p>
										</g:if>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row-content">
										<g:if test="${ubicacionInstance?.fechaBaja}">
											<h4 class="list-group-item-heading"><g:message code="ubicacion.fechaBaja.label" default="Fecha Baja"/></h4>
											<p class="list-group-item-text"><g:formatDate format="dd-MM-yyyy" date="${ubicacionInstance?.fechaBaja}"/></p>
										</g:if>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-footer" style="text-align:right">
							<g:link action="edit" id="${ubicacionInstance.id}" class="btn btn-primary">Editar</g:link>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
