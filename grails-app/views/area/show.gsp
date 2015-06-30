<%@ page import="abm.Area" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'area.label', default: 'Area')}"/>
		<title><g:message code="default.show.label" args="[entityName]"/></title>
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
			<!--Alertas-->
			<g:if test="${flash.message}">
				<div class="alert alert-dismissible alert-success" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</i></span>
					</button>
					${flash.message}
				</div>
			</g:if>
			<div class="row">
				<div class="col-lg-6">
					<legend>Detalle de Área</legend>
					<div class="panel panel-default" style="margin:0 auto 20px">
						<div class="panel-body">
							<div class="list-group">
								<div class="list-group-item">
									<div class="row-content">
										<g:if test="${areaInstance?.nombrearea}">
											<h4 class="list-group-item-heading"><g:message code="area.nombrearea.label" default="Nombre del Area"/></h4>
											<p class="list-group-item-text"><g:fieldValue bean="${areaInstance}" field="nombrearea"/></p>
										</g:if>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row-content">
										<g:if test="${areaInstance?.fechaAlta}">
											<h4 class="list-group-item-heading"><g:message code="area.fechaAlta.label" default="Fecha Alta"/></h4>
											<p class="list-group-item-text"><g:formatDate format="dd-MM-yyyy" date="${areaInstance?.fechaAlta}"/></p>
										</g:if>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-footer" style="text-align:right">
							<g:link action="edit" id="${areaInstance.id}" class="btn btn-primary">Editar</g:link>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
