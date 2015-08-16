<%@ page import="abm.Bien" %>
<%@ page import="abm.EstadoService" %>
<%@ page import="abm.PersonaService" %>
<%
	def personaService = grailsApplication.mainContext.getBean("personaService");
	def estadoService = grailsApplication.mainContext.getBean("estadoService");
%>

<div class="row">
	<div class="input-field col s12 l6 ${hasErrors(bean: bienInstance, field: 'nombreBien', 'error')}">
		<g:textField name="nombreBien" value="${bienInstance?.nombreBien}" required class="validate"/>
		<label for="nombreBien">
			<g:message code="bien.nombreBien.label" default="Denominaci&oacuten" />
		</label>
	</div>
	<div class="input-field col s12 l6 ${hasErrors(bean: bienInstance, field: 'codigoPatrimonio', 'error')}">
		<g:textField name="codigoPatrimonio" value="${bienInstance?.codigoPatrimonio}" required class="validate"/>
		<label for="codigoPatrimonio">
			<g:message code="bien.codigoPatrimonio.label" default="C&oacutedigo de Patrimonio" />
		</label>
	</div>
</div>
<div class="row">
	<div class="input-field col s12 l6 ${hasErrors(bean: bienInstance, field: 'responsableBien', 'error')}">
		<g:select id="responsableBien" name="responsableBien.id" from="${personaService.filtrarPersonasPorRol(1)}" optionKey="id" noSelection= "['': 'Seleccione un responsable']" value="${bienInstance?.responsableBien?.id}" required class="validate"/>
		<label for="responsableBien">
			<g:message code="bien.responsableBien.label" default="Responsable"/>
		</label>
	</div>
	<div class="input-field col s12 l6 ${hasErrors(bean: bienInstance, field: 'codigoDeSerie', 'error')}">
		<g:textField name="codigoDeSerie" value="${bienInstance?.codigoDeSerie}" required class="validate"/>
		<label for="codigoDeSerie">
			<g:message code="bien.codigoDeSerie.label" default="Codigo de Serie"/>
		</label>
	</div>
</div>
<div class="row">
	<div class="input-field col s12 ${hasErrors(bean: bienInstance, field: 'descripcion', 'error')}">
		<g:textArea name="descripcion" value="${bienInstance?.descripcion}" required class="materialize-textarea validate"/></textarea>
		<label for="descripcion">
			<g:message code="bien.descripcion.label" default="Descripcion"/>
		</label>
	</div>
</div>
<div class="row">
	<div class="input-field col s12 l6 ${hasErrors(bean: bienInstance, field: 'estado', 'error')}">
		<g:select id="estado" name="estado.id" from="${estadoService.listado(bienInstance?.id)}" optionKey="id" noSelection= "['': 'Seleccione un estado']" value="${bienInstance?.estado?.id}" required class="many-to-one validate"/>
		<label for="estado">
			<g:message code="bien.estado.label" default="Estado"/>
		</label>
	</div>
	<sec:ifAllGranted roles="ROLE_SUPERVISOR">
		
		<div class="input-field col s12 l6 ${hasErrors(bean: bienInstance, field: 'tipo', 'error')}">
			<g:select id="tipo" name="tipo.id" from="${abm.Tipo.list()}" optionKey="id" noSelection= "['': 'Seleccione un tipo']" value="${bienInstance?.tipo?.id}"/>
			<label for="tipo">
				<g:message code="bien.tipo.label" default="Tipo" />
			</label>
		</div>
	</sec:ifAllGranted>
</div>
<div class="row">
	<div class="input-field col s12 l6 ${hasErrors(bean: bienInstance, field: 'ubicacion', 'error')}">
		<g:select id="ubicacion" name="ubicacion.id" from="${abm.Ubicacion.list()}" optionKey="id" noSelection= "['': 'Seleccione una ubicacion']" value="${bienInstance?.ubicacion?.id}" required class="validate"/>
		<label for="ubicacion">
			<g:message code="bien.ubicacion.label" default="Ubicacion" />
		</label>
	</div>
	
	<div class="input-field col s12 l6 ${hasErrors(bean: bienInstance, field: 'area', 'error')}">
		<g:select id="area" name="area.id" from="${abm.Area.list()}" optionKey="id" noSelection= "['': 'Seleccione un departamento']" value="${bienInstance?.area?.id}" required class="validate"/>
		<label for="area">
			<g:message code="bien.area.label" default="Departamento" />
		</label>
	</div>
</div>
