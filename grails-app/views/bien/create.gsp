<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'bien.label', default: 'Bien')}"/>
		<title><g:message code="default.create.label" args="[entityName]"/></title>
	</head>
	<body>
		<div class="container-fluid">
			<legend>Crear Bien</legend>
			<div class="panel panel-default">
				<div class="panel-body">
					<!-- <g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if> -->
					<g:hasErrors bean="${bienInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${bienInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
					</g:hasErrors>
					<g:form url="[resource:bienInstance, action:'save']" id="form_create_bien" class="form-horizontal">
						<fieldset>
							<g:render template="form"/>
							<div class="col-lg-12">
								<a href="#crearBien" data-toggle="collapse" aria-expanded="false" aria-controls="crearBien" class="btn btn-danger mdi-content-clear"></a>
								<button type="submit" form="form_create_bien" class="btn btn-success mdi-action-done"></button>
							</div>
						</fieldset>
					</g:form>						
				</div>
			</div>
		</div>
	</body>
</html>
