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
		<g:link action="index" class="btn-floating btn-large waves-effect waves-light red" style="position: fixed; bottom: 15px; right: 15px;">
			<i class="material-icons">list</i>
		</g:link>
		<div class="container">
			<!--Alertas-->
			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>
			<div class="row">
				<div class="col s12 offset-m1 m10 offset-l2 l8">
					<div class="card">
						<div class="card-image">
							<asset:image src="sample-1.jpg"/>
							<span class="card-title" id="persona">Detalle de Ubicación</span>
						</div>
						<div class="card-content">
							<div class="list-group">
								<div class="row">
									<div class="col s12 m6 l4">
										<g:if test="${ubicacionInstance?.nombreubica}">
											<label><g:message code="ubicacion.nombreubica.label" default="Nombre de la Ubicacion"/></label>
											<p><g:fieldValue bean="${ubicacionInstance}" field="nombreubica"/></p>
										</g:if>
									</div>
									<div class="col s12 m6 l4">
										<g:if test="${ubicacionInstance?.fechaAlta}">
											<label><g:message code="ubicacion.fechaAlta.label" default="Fecha Alta"/></label>
											<p><g:formatDate format="dd-MM-yyyy" date="${ubicacionInstance?.fechaAlta}"/></p>
										</g:if>
									</div>
								</div>
							</div>
						</div>
						<div class="card-action">
							<g:link action="edit" id="${ubicacionInstance.id}">Editar</g:link>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
