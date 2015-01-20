<%@ page import="abm.Ubicacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ubicacion.label', default: 'Ubicacion')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<style>
			.barra_acciones{
				position: fixed;
				top: 51px;
				left: 0px;
				border-radius: 0px;
				min-height: 10px;
				width: 100%;
				z-index: 900;
			}
		</style>
	</head>
	<body>
		<div style="margin-bottom:30px"></div>
		<nav class="navbar navbar-default barra_acciones" role="navigation">
			<div class="container-fluid" style="padding-left:5px;padding-right:25px">
				<ul class="nav navbar-nav navbar-left">
					<li>
						<g:link action="show" resource="${ubicacionInstance}" style="padding: 0px 12px; color:#777777"><i class="md md-arrow-back"></i></g:link>
					</li>
					<li><a>Editar</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li>
						<a data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample" id="accion">
							<i class="md md-add"></i>
						</a>
					</li>
				</ul>
			</div>
		</nav>
		<div class="collapse" id="collapseExample">
			<div>
				<g:include controller="ubicacion" action="create" />
			</div>
		</div>
		<div class="container-fluid">
			<div class="panel panel-default">
				<div class="panel-body">
					<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
					</g:if>
					<g:hasErrors bean="${ubicacionInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="$ubicacionInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
					</g:hasErrors>
					<g:form url="[resource:ubicacionInstance, action:'update']" method="PUT" >
						<g:hiddenField name="version" value="$ubicacionInstance?.version}" />
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>
					</g:form>
				</div>
				<div class="panel-footer" >
					<button class="btn btn-link" type="submit" form="form1" style="padding: 0px 12px; color:#777777">
						<i class="md md-check"></i>
					</button>
					<g:link action="index" resource="${ubicacionInstance}" style="padding: 0px 12px; color:#777777"><i class="md md-close"></i></g:link>
				</div>
			</div>
		</div>
	</body>
</html>
