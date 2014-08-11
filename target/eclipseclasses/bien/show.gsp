
<%@ page import="abm.Bien" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bien.label', default: 'Bien')}" />
		<script type="text/javascript">
			$(document).ready(
				function(){
					
				})		
		</script>
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="show-bien" class="content scaffold-show" role="main">
						<h1>Mostrar <b>Bien</b></h1>
						<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
						</g:if>
						<ul class="property-list bien">

							<g:if test="${bienInstance?.codigoDeSerie}">
							<li class="fieldcontain">
								<span id="codigoDeSerie-label" class="property-label"><g:message code="bien.codigoDeSerie.label" default="Codigo Fabricante" /></span>
								
									<span class="property-value" aria-labelledby="codigoDeSerie-label"><g:fieldValue bean="${bienInstance}" field="codigoDeSerie"/></span>
								
							</li>
							</g:if>

							<g:if test="${bienInstance?.descripcion}">
							<li class="fieldcontain">
								<span id="descripcion-label" class="property-label"><g:message code="bien.descripcion.label" default="Descripcion" /></span>
								
									<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${bienInstance}" field="descripcion"/></span>
								
							</li>
							</g:if>

							<g:if test="${bienInstance?.tipo}">
							<li class="fieldcontain">
								<span id="tipo-label" class="property-label"><g:message code="bien.tipo.label" default="Tipo" /></span>
								
									<span class="property-value" aria-labelledby="tipo-label"><g:link controller="tipo" action="show" id="${bienInstance?.tipo?.id}">${bienInstance?.tipo?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${bienInstance?.estado}">
							<li class="fieldcontain">
								<span id="estado-label" class="property-label"><g:message code="bien.estado.label" default="Estado" /></span>
								
									<span class="property-value" aria-labelledby="estado-label"><g:link controller="estado" action="show" id="${bienInstance?.estado?.id}">${bienInstance?.estado?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${bienInstance?.ubicacion}">
							<li class="fieldcontain">
								<span id="ubicacion-label" class="property-label"><g:message code="bien.ubicacion.label" default="Ubicacion" /></span>
								
									<span class="property-value" aria-labelledby="ubicacion-label"><g:link controller="ubicacion" action="show" id="${bienInstance?.ubicacion?.id}">${bienInstance?.ubicacion?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
							
							<g:if test="${bienInstance?.area}">
							<li class="fieldcontain">
								<span id="area-label" class="property-label"><g:message code="bien.area.label" default="Area" /></span>
								
									<span class="property-value" aria-labelledby="area-label"><g:link controller="area" action="show" id="${bienInstance?.area?.id}">${bienInstance?.area?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${bienInstance?.fechaAlta}">
							<li class="fieldcontain">
								<span id="fechaAlta-label" class="property-label"><g:message code="bien.fechaAlta.label" default="Fecha Alta" /></span>
								
									<span class="property-value" aria-labelledby="fechaAlta-label"><g:formatDate date="${bienInstance?.fechaAlta}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${bienInstance?.fechaBaja}">
							<li class="fieldcontain">
								<span id="fechaBaja-label" class="property-label"><g:message code="bien.fechaBaja.label" default="Fecha Baja" /></span>
								
									<span class="property-value" aria-labelledby="fechaBaja-label"><g:formatDate date="${bienInstance?.fechaBaja}" /></span>
								
							</li>
							</g:if>
						</ul>
						<g:form url="[resource:bienInstance, action:'delete']" method="DELETE">
							<fieldset class="buttons">
							
								<g:link class="edit btn btn-primary" action="edit" resource="${bienInstance}"><g:message code="default.button.edit.label" default="Editar" /></g:link>
								<g:actionSubmit class="delete btn-primary" action="delete" value="${message(code: 'e', default: 'Eliminar')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Está seguro?')}');" />	
							</fieldset>
						</g:form>  	
					</div>
				</div>
				<div class="col-md-3"></div>
			</div>
					
		</div>
			
	</body>
</html>
