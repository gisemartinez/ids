<%@ page import="abm.Ubicacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ubicacion.label', default: 'Ubicacion')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<!--Crear Ubicacion-->
		<div class="collapse" id="crearUbicacion">
			<g:include controller="ubicacion" action="create"/>
		</div>
		<div class="container-fluid">
			<legend>Editar Ubicación</legend>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${ubicacionInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="$ubicacionInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
							<g:message error="${error}"/>
						</li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			<div class="row">
				<div class="col-lg-6">
					<div class="panel panel-default">
						<div class="panel-body">
							<g:form url="[resource:ubicacionInstance, action:'update']" method="PUT" id="form_edit" class="form-horizontal">
								<g:hiddenField name="version" value="$ubicacionInstance?.version}"/>
								<fieldset>
									<g:render template="form"/>
								</fieldset>
							</g:form>
						</div>
						<div class="panel-footer">
							<g:link action="show" id="${ubicacionInstance.id}" class="btn btn-default">Cancelar</g:link>
							<g:submitButton form="form_edit" name="update" value="Guardar" class="btn btn-primary"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
