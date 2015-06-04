<%@ page import="abm.Bien" %>
<%@ page import="abm.EstadoService" %>
<%@ page import="abm.PersonaService" %>
<%
    def personaService = grailsApplication.mainContext.getBean("personaService");
    def estadoService = grailsApplication.mainContext.getBean("estadoService");
%>

<sec:ifAllGranted roles="ROLE_SUPERVISOR">
	<div class="form-group">
		<label for="nombreBien" class="col-lg-1 control-label">
			<g:message code="bien.nombreBien.label" default="Denominaci&oacuten" />
		</label>
		<div class="col-lg-5 ${hasErrors(bean: bienInstance, field: 'nombreBien', 'error')} required">
			<g:textField name="nombreBien" required="" value="${bienInstance?.nombreBien}" class="form-control"/>
		</div>
		<label for="codigoPatrimonio" class="col-lg-1 control-label">
			<g:message code="bien.codigoPatrimonio.label" default="C&oacutedigo de Patrimonio" />
		</label>
		<div class="col-lg-5 ${hasErrors(bean: bienInstance, field: 'codigoPatrimonio', 'error')} required">
			<g:textField name="codigoPatrimonio" required="" value="${bienInstance?.codigoPatrimonio}" data-hint="You should really write something here" class="form-control"/>
		</div>
	</div>
			
	<div class="form-group">
		<label for="responsableBien" class="col-lg-1 control-label">
			<g:message code="bien.responsableBien.label" default="Responsable"/>
		</label>
		<div class="col-lg-5 ${hasErrors(bean: bienInstance, field: 'responsableBien', 'error')} required">
			<g:select id="responsableBien" name="responsableBien.id" from="${personaService.filtrarPersonasPorRol(1)}" optionKey="id" required="" noSelection= "['': 'Seleccione un responsable']" value="${bienInstance?.responsableBien?.id}" class="form-control"/>
		</div>
		<label for="codigoDeSerie" class="col-lg-1 control-label">
			<g:message code="bien.codigoDeSerie.label" default="Codigo de Serie"/>
		</label>
		<div class="col-lg-5 ${hasErrors(bean: bienInstance, field: 'codigoDeSerie', 'error')} required">
			<g:textField name="codigoDeSerie" required="" value="${bienInstance?.codigoDeSerie}" data-hint="You should really write something here" class="form-control"/>
		</div>
	</div>
	
	<div class="form-group">
		<label for="descripcion" class="col-lg-1 control-label">
			<g:message code="bien.descripcion.label" default="Descripcion"/>
		</label>
		<div class="col-lg-11 ${hasErrors(bean: bienInstance, field: 'descripcion', 'error')} required">
			<g:textArea name="descripcion" required="" value="${bienInstance?.descripcion}" class="form-control" rows="3"/>
		</div>
	</div>	
</sec:ifAllGranted>

<div class="form-group">
	<label for="estado" class="col-lg-1 control-label">
		<g:message code="bien.estado.label" default="Estado"/>
	</label>
	<div class="col-lg-5 ${hasErrors(bean: bienInstance, field: 'estado', 'error')} required">
		<g:select id="estado" name="estado.id" from="${estadoService.listado(bienInstance?.id)}" optionKey="id" required=""	noSelection= "['': 'Seleccione un estado']" value="${bienInstance?.estado?.id}" class="form-control many-to-one"/>
	</div>
	<sec:ifAllGranted roles="ROLE_SUPERVISOR">
		<label for="tipo" class="col-lg-1 control-label">
			<g:message code="bien.tipo.label" default="Tipo" />
		</label>
		<div class="col-lg-5 ${hasErrors(bean: bienInstance, field: 'tipo', 'error')} required">
			<g:select id="tipo" name="tipo.id" from="${abm.Tipo.list()}" optionKey="id" required=""	noSelection= "['': 'Seleccione un tipo']" value="${bienInstance?.tipo?.id}" class="form-control"/>
		</div>
	</sec:ifAllGranted>
</div>

<div class="form-group">
	<sec:ifAllGranted roles="ROLE_SUPERVISOR">
		<label for="ubicacion" class="col-lg-1 control-label">
			<g:message code="bien.ubicacion.label" default="Ubicacion" />
		</label>
		<div class="col-lg-5 ${hasErrors(bean: bienInstance, field: 'ubicacion', 'error')} required">
			<g:select id="ubicacion" name="ubicacion.id" from="${abm.Ubicacion.list()}" optionKey="id" required="" noSelection= "['': 'Seleccione una ubicacion']" value="${bienInstance?.ubicacion?.id}" class="form-control"/>
		</div>
	</sec:ifAllGranted>
	<sec:ifAllGranted roles="ROLE_SUPERVISOR">
		<label for="area" class="col-lg-1 control-label">
			<g:message code="bien.area.label" default="Departamento" />
		</label>
		<div class="col-lg-5 ${hasErrors(bean: bienInstance, field: 'area', 'error')} required">
			<g:select id="area" name="area.id" from="${abm.Area.list()}" optionKey="id" required="" noSelection= "['': 'Seleccione un departamento']" value="${bienInstance?.area?.id}" class="form-control"/>
		</div>
	</sec:ifAllGranted>
</div>
