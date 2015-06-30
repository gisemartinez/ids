<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'bien.label', default: 'Bien')}"/>
		<title><g:message code="default.create.label" args="[entityName]"/></title>
	</head>
	<body>
		<div class="container-fluid">
			<div class="panel panel-default panel-fab">
				<span class="mdi-content-add"></span>
				<div class="panel-body">
					<!-- <g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
					<g:hasErrors bean="${bienInstance}">
						<ul class="errors" role="alert">
							<g:eachError bean="${bienInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
									<g:message error="${error}"/>
								</li>
							</g:eachError>
						</ul>
					</g:hasErrors> -->
					<g:form url="[resource:bienInstance, action:'save']" id="form_create" class="form-horizontal">
						<fieldset>
							<g:render template="form"/>
						</fieldset>
					</g:form>						
				</div>
				<div class="panel-footer">
					<a href="#create" class="btn btn-default" data-panel-height="406">Cancelar</a>
					<g:submitButton form="form_create" name="update" value="Crear" class="btn btn-primary"/>
				</div>
			</div>
		</div>
	</body>
</html>
