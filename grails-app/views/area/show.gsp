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
		<g:link action="index" class="btn-floating btn-large waves-effect waves-light red" style="position: fixed; bottom: 15px; right: 15px;">
			<i class="material-icons">list</i>
		</g:link>
		<div class="container">
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
				<div class="col s12 offset-m1 m10 offset-l2 l8">
					<div class="card">
						<div class="card-image">
							<asset:image src="sample-1.jpg"/>
							<span class="card-title" id="persona">Detalle de Área</span>
						</div>
						<div class="card-content">
							<div class="row">
								<div class="col s12 m6 l4">
									<g:if test="${areaInstance?.nombrearea}">
										<label><g:message code="area.nombrearea.label" default="Nombre del Area"/></label>
										<p><g:fieldValue bean="${areaInstance}" field="nombrearea"/></p>
									</g:if>
								</div>
								<div class="col s12 m6 l4">
									<g:if test="${areaInstance?.fechaAlta}">
										<label><g:message code="area.fechaAlta.label" default="Fecha Alta"/></label>
										<p><g:formatDate format="dd-MM-yyyy" date="${areaInstance?.fechaAlta}"/></p>
									</g:if>
								</div>
							</div>
						</div>
						<div class="card-action">
							<g:link action="edit" id="${areaInstance.id}">Editar</g:link>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
