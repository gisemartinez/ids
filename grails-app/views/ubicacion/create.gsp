<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
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
			<div class="panel panel-primary" style="margin-top:20px;">
				<div class="panel-heading">
					<h3 class="panel-title"><g:message code="default.create.label" args="[entityName]"/></h3>
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
					<g:form url="[resource:ubicacionInstance, action:'save']" >
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>
						<div style="margin-top:20px">
							<a href="/${grailsApplication.config.nombreAplicacion}/ubicacion/index" class="cancel">Cancelar</a>
							<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
						</fieldset>
					</g:form>				
				</div>
				<g:message code="* Campo Obligatorio"/>
			</div>	
		</div>
	</body>
</html>