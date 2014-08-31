<%@ page import="abm.Area" %>



<div class="fieldcontain ${hasErrors(bean: areaInstance, field: 'nombrearea', 'error')} required">
	<label for="nombrearea">
		<g:message code="area.nombrearea.label" default="Nombre del Area" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombrearea" required="" value="${areaInstance?.nombrearea}"/>

</div>

