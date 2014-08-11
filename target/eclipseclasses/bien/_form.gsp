<%@ page import="abm.Bien" %>

<div class="fieldcontain ${hasErrors(bean: bienInstance, field: 'codigoDeSerie', 'error')} required">
	<label for="codigoDeSerie">
		<g:message code="bien.codigoDeSerie.label" default="Código de Serie" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codigoDeSerie" required="" value="${bienInstance?.codigoDeSerie}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: bienInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="bien.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${bienInstance?.descripcion}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: bienInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="bien.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estado" name="estado.id" from="${abm.Estado.list()}" optionKey="id" required="" 
	noSelection= "['': 'Seleccione un estado']"
	value="${bienInstance?.estado?.id}" class="many-to-one"/>
	
</div>
<div class="fieldcontain ${hasErrors(bean: bienInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="bien.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipo" name="tipo.id" from="${abm.Tipo.list()}" optionKey="id" required=""
	noSelection= "['': 'Seleccione un tipo']"
	 value="${bienInstance?.tipo?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bienInstance, field: 'ubicacion', 'error')} required">
	<label for="ubicacion">
		<g:message code="bien.ubicacion.label" default="Ubicacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ubicacion" name="ubicacion.id" from="${abm.Ubicacion.list()}" optionKey="id" required=""
	noSelection= "['': 'Seleccione una ubicacion']"
	 value="${bienInstance?.ubicacion?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bienInstance, field: 'area', 'error')} required">
	<label for="area">
		<g:message code="bien.area.label" default="Area" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="area" name="area.id" from="${abm.Area.list()}" optionKey="id" required=""
	noSelection= "['': 'Seleccione un area']"
	 value="${bienInstance?.area?.id}" class="many-to-one"/>

</div>