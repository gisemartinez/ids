<%@ page import="abm.Area" %>
<div class="row">
	<div class="input-field col s12 m12 l12 ${hasErrors(bean: areaInstance, field: 'nombreubica', 'error')}">
		<g:textField name="nombrearea" value="${areaInstance?.nombrearea}" required class="validate"/>
		<label for="nombrearea">
			<g:message code="area.nombrearea.label" default="Nombre del &Aacuterea"/>
		</label>
	</div>
</div>
