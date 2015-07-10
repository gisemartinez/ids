<%@ page import="abm.Ubicacion" %>
<div class="form-group">
	<label for="nombreubica" class="col-lg-2 control-label">
		<g:message code="ubicacion.nombreubica.label" default="Nombre de la Ubicaci&oacuten" />
	</label>
	<div class="col-md-10 ${hasErrors(bean: ubicacionInstance, field: 'nombreubica', 'error')} required">
		<g:textField name="nombreubica" required="" value="${ubicacionInstance?.nombreubica}" class="form-control"/>
	</div>
</div>
