<%@ page import=nombreAplicacion+".Area" %>
<!DOCTYPE html>

<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'area.label', default: 'Area')}" />
		<title><g:message code="Area creada" /></title>
	</head>
	<body>
		<div class="container-fluid">
			<div class="panel panel-primary" style="margin-top:20px" >
				<div class="panel-heading">
					<h3 class="panel-title"><g:message code="default.show.label" args="[entityName]"/></h3>
				</div>
				<div class="panel-body">
					<!-- <g:if test="${flash.message}">
						<div class="message" role="status">
							${flash.message}
						</div>
					</g:if> -->
					<ul class="list-group">
						<g:if test="${areaInstance?.nombrearea}">
							<li class="list-group-item">
								<strong>
									<span id="nombrearea-label" class="property-label"><g:message code="area.nombrearea.label" default="Nombre del Area" /></span>
								</strong>
								<span class="property-value" aria-labelledby="nombrearea-label"><g:fieldValue bean="${areaInstance}" field="nombrearea"/></span>
							</li>
						</g:if>
						<g:if test="${areaInstance?.fechaAlta}">
							<li class="list-group-item">
								<strong>
									<span id="fechaAlta-label" class="property-label"><g:message code="area.fechaAlta.label" default="Fecha Alta" /></span>
								</strong>
								<span class="property-value" aria-labelledby="fechaAlta-label"><g:formatDate date="${areaInstance?.fechaAlta}" /></span>
							</li>
						</g:if>
						<g:if test="${areaInstance?.fechaBaja}">
							<li class="list-group-item">
								<strong>
									<span id="fechaBaja-label" class="property-label"><g:message code="area.fechaBaja.label" default="Fecha Baja" /></span>
								</strong>
								<span class="property-value" aria-labelledby="fechaBaja-label"><g:formatDate date="${areaInstance?.fechaBaja}" /></span>
							</li>
						</g:if>
					</ul>
					<g:form url="[resource:areaInstance, action:'delete']" method="DELETE">
						<fieldset class="buttons">
							<!-- <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/> -->
							<button type="submit" class="btn btn-primary delete"></button>
							<g:link class="edit btn btn-primary" action="edit" resource="${areaInstance}"></g:link>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>
