<%@ page import="abm.Ubicacion" %>
<div class="row">
	<div class="input-field col s12 m12 l12 ${hasErrors(bean: ubicacionInstance, field: 'nombreubica', 'error')}">
		<g:textField name="nombreubica" value="${bienInstance?.nombreBien}" required class="validate"/>
		<label for="nombreubica">
			<g:message code="ubicacion.nombreubica.label" default="Nombre de la Ubicaci&oacuten"/>
		</label>
	</div>
</div>
