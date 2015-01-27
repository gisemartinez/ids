<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'ubicacion.label', default: 'Ubicacion')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<script type="text/javascript">
		$(document).ready(function()
				{
					$('select#estado').val(1);
					$('select#estado option').attr('hidden',true)
				}
			)
		</script>
	</head>
	<body>
		<div class="container-fluid">
			<div class="panel panel-default">
				<div class="panel-heading">
					<g:message code="Crear Ubicaci&oacuten"/>
				</div>
				<div class="panel-body">
					<!-- <g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
					</g:if> -->
					<g:hasErrors bean="${ubicacionInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="$ubicacionInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
					</g:hasErrors>
					<g:form url="[resource:ubicacionInstance, action:'save']" id="form_create_ubicacion">
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>
					</g:form>				
				</div>
				<div class="panel-footer" >
					<button class="btn btn-link" type="submit" form="form_create_ubicacion" style="padding: 0px 12px; color:#777777">
						<i class="md md-check"></i>
					</button>
				</div>
			</div>	
		</div>
	</body>
</html>
