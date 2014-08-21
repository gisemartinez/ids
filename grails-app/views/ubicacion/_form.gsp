<%@ page import="abm.Ubicacion" %>



<div class="fieldcontain ${hasErrors(bean: ubicacionInstance, field: 'nombreubica', 'error')} required">
	<label for="nombreubica">
		<g:message code="ubicacion.nombreubica.label" default="Nombreubica" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombreubica" required="" value="${ubicacionInstance?.nombreubica}"/>

</div>

