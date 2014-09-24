<%@ page import="abm.Persona" %>
<%@ page import="com.testapp.User" %>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="persona.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${personaInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'apellido', 'error')} required">
	<label for="apellido">
		<g:message code="persona.apellido.label" default="Apellido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellido" required="" value="${personaInstance?.apellido}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'dni', 'error')} required">
	<label for="dni">
		<g:message code="persona.dni.label" default="dni" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="dni" type="number" value="${personaInstance.dni}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${userInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${userInstance?.password}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'area', 'error')} required">
	<label for="area">
		<g:message code="persona.area.label" default="Area" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="area" name="area.id" from="${abm.Area.list()}" optionKey="id" required=""
	noSelection= "['': 'Seleccione un area']"
	 value="${personaInstance?.area?.id}" class="many-to-one"/>

</div>
