<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'bien.label', default: 'Bien')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container-fluid">
			<div class="panel panel-default">
				<div class="panel-heading">Crear Bien</div>
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
					<g:form url="[resource:bienInstance, action:'save']" id="form_create_bien">
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>
					</g:form>				
				</div>
				<div class="panel-footer" >
					<button class="btn btn-link" type="submit" form="form_create_bien" style="padding: 0px 12px; color:#777777">
						<i class="md md-check"></i>
					</button>
					<a data-toggle="collapse" href="#crearBien" aria-expanded="false" aria-controls="crearBien" style="padding: 0px 12px; color:#777777">
						<i class="md md-close"></i>
					</a>
				</div>
			</div>	
		</div>
	</body>
</html>
