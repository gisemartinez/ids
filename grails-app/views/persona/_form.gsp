<%@ page import="abm.Persona" %>
<%@ page import="com.testapp.User" %>
<%@ page import="com.testapp.Role" %>

<%@ page import="com.testapp.RoleService" %>
<%
	def roleService = grailsApplication.mainContext.getBean("roleService");
%>

<div class="row">
	<div class="input-field col s12 m6 l4 ${hasErrors(bean: personaInstance, field: 'nombre', 'error')}">
		<g:textField name="nombre" pattern="[A-Z]{1}?[a-z]{2,19}" title="Formato: letras de la A a la z. Longitud entre 3 y 20." value="${personaInstance?.nombre}" required class="validate"/>
		<label for="nombre">
			<g:message code="persona.nombre.label" default="Nombre" />
		</label>
	</div>
	<div class="input-field col s12 m6 l4 ${hasErrors(bean: personaInstance, field: 'apellido', 'error')}">
		<g:textField name="apellido" pattern="[A-Z]{1}?[a-z]{2,19}" title="Formato: letras de la A a la z. Longitud entre 3 y 20." value="${personaInstance?.apellido}" required class="validate"/>
		<label for="apellido">
			<g:message code="persona.apellido.label" default="Apellido" />
		</label>
	</div>
	<div class="input-field col s12 m6 l4 ${hasErrors(bean: personaInstance, field: 'dni', 'error')}">
		<g:textField name="dni" pattern = "[0-9]{8}"  title = "Formato: número de 8 digitos." value="${personaInstance?.dni}" required="" data-hint="Formato: número de 8 digitos." required class="validate"/>
		<label for="dni">
			<g:message code="persona.dni.label" default="DNI" />
		</label>
	</div>
</div>
<div class="row">
	<div class="input-field col s12 m6 l4 ${hasErrors(bean: userInstance, field: 'username', 'error')}">
		<g:field name="username" type="email" value="${userInstance?.username}"/>
		<label for="username">
			<g:message code="user.username.label" default="Usuario" />
		</label>
	</div>
	<div class="input-field col s12 m6 l4 ${hasErrors(bean: userInstance, field: 'password', 'error')}">
		<g:passwordField name="password" value="${userInstance?.password}" required class="validate"/>
		<label for="password">
			<g:message code="user.password.label" default="Contrase&ntildea" />
		</label>
	</div>
	<div class="input-field col s12 m6 l4 ${hasErrors(bean: userInstance, field: 'confirmPassword', 'error')}">
		<g:passwordField name="confirmPassword" value="${userInstance?.password}" required class="validate"/>
		<label for="confirmPassword">
			<g:message code="user.confirmPassword.label" default="Verificar Contrase&ntildea" />
		</label>
	</div>
</div>
<div class="row">
	<div class="input-field col s12 m6 l4 ${hasErrors(bean: personaInstance, field: 'area', 'error')}">
		<g:select id="area" name="area.id" from="${abm.Area.list()}" optionKey="id" noSelection= "['': 'Seleccione un area']" value="${personaInstance?.area?.id}" required class="validate"/>
		<label for="area">
			<g:message code="persona.area.label" default="Area" />
		</label>
	</div>
	<div class="input-field col s12 m6 l4 ${hasErrors(bean: roleInstance, field: 'authority', 'error')}">
		<g:select id="role" name="role.id" from="${roleService.listado()}" optionKey="id" optionValue="authority" noSelection= "['': 'Seleccione un rol']" value="${roleInstance?.id}" required class="validate"/>
		<label for="roleId">
			<g:message code="role.roleId.label" default="Rol" />
		</label>
	</div>
</div>
