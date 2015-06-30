<%@ page import="abm.Persona" %>
<%@ page import="com.testapp.User" %>
<%@ page import="com.testapp.Role" %>

<%@ page import="com.testapp.RoleService" %>
<%
    def roleService = grailsApplication.mainContext.getBean("roleService");
%>


<div class="form-group">
	<label for="nombre" class="col-lg-1 control-label">
		<g:message code="persona.nombre.label" default="Nombre" />
	</label>
	<div class="col-md-5 ${hasErrors(bean: personaInstance, field: 'nombre', 'error')} required">
		<g:textField name="nombre" pattern="[A-Z]{1}?[a-z]{2,19}" title="Formato: letras de la A a la z. Longitud entre 3 y 20." required="" value="${personaInstance?.nombre}" class="form-control"/>
	</div>
	<label for="apellido" class="col-lg-1 control-label">
		<g:message code="persona.apellido.label" default="Apellido" />
	</label>
	<div class="col-md-5 ${hasErrors(bean: personaInstance, field: 'apellido', 'error')} required">
		<g:textField name="apellido" pattern="[A-Z]{1}?[a-z]{2,19}" title="Formato: letras de la A a la z. Longitud entre 3 y 20." required="" value="${personaInstance?.apellido}" class="form-control"/>
	</div>
</div>

<div class="form-group">
	<label for="dni" class="col-lg-1 control-label">
		<g:message code="persona.dni.label" default="DNI" />
	</label>
	<div class="col-md-5 ${hasErrors(bean: personaInstance, field: 'dni', 'error')} required">
		<g:field name="dni" pattern = "[0-9]{8}"  title = "Formato: número de 8 digitos." value="${personaInstance?.dni}" required="" data-hint="Formato: número de 8 digitos." class="form-control"/>
	</div>
	<label for="area" class="col-lg-1 control-label">
		<g:message code="persona.area.label" default="Area" />
	</label>
	<div class="col-md-5 ${hasErrors(bean: personaInstance, field: 'area', 'error')} required">
		<g:select id="area" name="area.id" from="${abm.Area.list()}" optionKey="id" required="" noSelection= "['': 'Seleccione un area']" value="${personaInstance?.area?.id}" class="form-control"/>
	</div>
</div>

<div class="form-group">
	<label for="roleId" class="col-lg-1 control-label">
		<g:message code="role.roleId.label" default="Rol" />
	</label>
	<div class="col-md-5 ${hasErrors(bean: roleInstance, field: 'authority', 'error')} required">
		<g:select id="role" name="role.id" from="${roleService.listado()}" optionKey="id" optionValue="authority" required="" noSelection= "['': 'Seleccione un rol']" value="${roleInstance?.id}" class="form-control"/>
	</div>
	<label for="username" class="col-lg-1 control-label">
		<g:message code="user.username.label" default="Usuario" />
	</label>
	<div class="col-md-5 ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
		<g:field name="username" type="email" required="" value="${userInstance?.username}" class="form-control"/>
	</div>
</div>

<div class="form-group">
	<label for="password" class="col-lg-1 control-label">
		<g:message code="user.password.label" default="Contrase&ntildea" />
	</label>
	<div class="col-md-5 ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
		<g:passwordField name="password" required="" value="${userInstance?.password}" class="form-control"/>
	</div>
	<label for="confirmPassword" class="col-lg-1 control-label">
		<g:message code="user.confirmPassword.label" default="Verificar Contrase&ntildea" />
	</label>
	<div class="col-md-5 ${hasErrors(bean: userInstance, field: 'confirmPassword', 'error')} required">
		<g:passwordField name="confirmPassword" required="" value="${userInstance?.password}" class="form-control"/>
	</div>
</div>
