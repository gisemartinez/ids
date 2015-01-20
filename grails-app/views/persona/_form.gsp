<%@ page import="abm.Persona" %>
<%@ page import="com.testapp.User" %>

<div class="container">
	<div class="row">
		<div class="col-md-6">
			<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'nombre', 'error')} required">
				<label for="nombre">
					<g:message code="persona.nombre.label" default="Nombre" />
				</label>
				<g:textField name="nombre" required="" value="${personaInstance?.nombre}"/>

			</div>
		</div>
		<div class="col-md-6">
			<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'apellido', 'error')} required">
				<label for="apellido">
					<g:message code="persona.apellido.label" default="Apellido" />
				</label>
				<g:textField name="apellido" required="" value="${personaInstance?.apellido}"/>

			</div>
		</div>

	</div>
	<div class="row">
		<div class="col-md-6">
			<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'dni', 'error')} required">
				<label for="dni">
					<g:message code="persona.dni.label" default="DNI" />
				</label>
				<g:field name="dni" type="number" value="${personaInstance.dni}" required=""/>

			</div>
		</div>
		<div class="col-md-6">
			<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'area', 'error')} required">
				<label for="area">
					<g:message code="persona.area.label" default="Area" />
				</label>
				<g:select id="area" name="area.id" from="${abm.Area.list()}" optionKey="id" required=""
				noSelection= "['': 'Seleccione un area']"
				 value="${personaInstance?.area?.id}" class="many-to-one"/>

			</div>
		</div>

	</div>
	<div class="row">
		<div class="col-md-6">
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
				<label for="username">
					<g:message code="user.username.label" default="Usuario" />
				</label>
				<g:textField name="username" required="" value="${userInstance?.username}"/>

			</div>
		</div>
		<div class="col-md-6">
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
				<label for="password">
					<g:message code="user.password.label" default="Contraseña" />
				</label>
				<g:textField name="password" required="" value="${userInstance?.password}"/>

			</div>
		</div>
	</div>
</div>



