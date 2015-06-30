<%@ page import="abm.Area" %>
<div class="form-group">
	<label for="nombrearea" class="col-lg-2 control-label">
		<g:message code="area.nombrearea.label" default="Nombre del &Aacuterea" />
	</label>
	<div class="col-md-10 ${hasErrors(bean: areaInstance, field: 'nombrearea', 'error')} required">
		<g:textField name="nombrearea" required="" value="${areaInstance?.nombrearea}" class="form-control"/>
	</div>
</div>
