<%@ page import="abm.Bien" %>


<sec:ifAllGranted roles="ROLE_ADMIN">
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				<div class="fieldcontain ${hasErrors(bean: bienInstance, field: 'nombreBien', 'error')} required">
					<label for="nombreBien">
						<g:message code="bien.nombreBien.label" default="Denominaci&oacuten" />
					</label>
					<g:textField name="nombreBien" required="" value="${bienInstance?.nombreBien}"/>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="fieldcontain ${hasErrors(bean: bienInstance, field: 'codigoPatrimonio', 'error')} required">
					<label for="codigoPatrimonio">
						<g:message code="bien.codigoPatrimonio.label" default="C&oacutedigo de Patrimonio" />
					</label>
					<g:textField name="codigoPatrimonio" required="" value="${bienInstance?.codigoPatrimonio}"/>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-6">
				<div class="fieldcontain ${hasErrors(bean: bienInstance, field: 'responsableBien', 'error')} required">
					<label for="responsableBien">
						<g:message code="bien.responsableBien.label" default="Responsable" />
					</label>
					<g:select id="persona" name="persona.id" from="${abm.Persona.filtrarPorRol(1)}" optionKey="id" optionValue="nombre" required="" 
				noSelection= "['': 'Seleccione un responsable']" value="${bienInstance?.responsableBien?.id}" class="many-to-one"/>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="fieldcontain ${hasErrors(bean: bienInstance, field: 'codigoDeSerie', 'error')} required">
					<label for="codigoDeSerie">
						<g:message code="bien.codigoDeSerie.label" default="C&oacutedigo de Serie" />
					</label>
					<g:textField name="codigoDeSerie" required="" value="${bienInstance?.codigoDeSerie}"/>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="fieldcontain ${hasErrors(bean: bienInstance, field: 'descripcion', 'error')} required">
					<label for="descripcion">
						<g:message code="bien.descripcion.label" default="Descripcion" />
					</label>
					<g:textArea name="descripcion" required="" value="${bienInstance?.descripcion}"/>
				</div>
			</div>

		</div>	
	</div>
</sec:ifAllGranted>
<div class="container">
	<div class="row">
		<div class="col-lg-6">
			<div class="fieldcontain ${hasErrors(bean: bienInstance, field: 'estado', 'error')} required">
				<label for="estado">
					<g:message code="bien.estado.label" default="Estado" />
				</label>
				<g:select id="estado" name="estado.id" from="${abm.Estado.list()}" optionKey="id" required="" 
				noSelection= "['': 'Seleccione un estado']"
				value="${bienInstance?.estado?.id}" class="many-to-one"/>
				
			</div>
		</div>
		<div class="col-lg-6">
		<sec:ifAllGranted roles="ROLE_ADMIN">
			<div class="fieldcontain ${hasErrors(bean: bienInstance, field: 'tipo', 'error')} required">
				<label for="tipo">
					<g:message code="bien.tipo.label" default="Tipo" />
				</label>
				<g:select id="tipo" name="tipo.id" from="${abm.Tipo.list()}" optionKey="id" required=""
				noSelection= "['': 'Seleccione un tipo']"
				 value="${bienInstance?.tipo?.id}" class="many-to-one"/>

			</div>
		</sec:ifAllGranted>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-6">
			<sec:ifAllGranted roles="ROLE_ADMIN">
				<div class="fieldcontain ${hasErrors(bean: bienInstance, field: 'ubicacion', 'error')} required">
					<label for="ubicacion">
						<g:message code="bien.ubicacion.label" default="Ubicacion" />
					</label>
					<g:select id="ubicacion" name="ubicacion.id" from="${abm.Ubicacion.list()}" optionKey="id" required=""
					noSelection= "['': 'Seleccione una ubicacion']"
					 value="${bienInstance?.ubicacion?.id}" class="many-to-one"/>

				</div>
			</sec:ifAllGranted>
		</div>
		<div class="col-lg-6">
			<sec:ifAllGranted roles="ROLE_ADMIN">
				<div class="fieldcontain ${hasErrors(bean: bienInstance, field: 'area', 'error')} required">
					<label for="area">
						<g:message code="bien.area.label" default="Departamento" />
					</label>
					<g:select id="area" name="area.id" from="${abm.Area.list()}" optionKey="id" required=""
					noSelection= "['': 'Seleccione un departamento']"
					 value="${bienInstance?.area?.id}" class="many-to-one"/>

				</div>
			</sec:ifAllGranted>
		</div>
	</div>
</div>


