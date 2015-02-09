<%@ page import="abm.Persona" %>
<%@ page import="com.testapp.User" %>
<%@ page import="com.testapp.Role" %>

<div class="container">
	<div class="row">
		<div class="col-md-6">
			<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'nombre', 'error')} required">
				<label for="nombre">
					<g:message code="persona.nombre.label" default="Nombre" />
				</label>
				<g:textField name="nombre" pattern="[A-Z]{1}?[a-z]{2,19}" title="Formato: letras de la A a la z. Longitud entre 3 y 20." required="" value="${personaInstance?.nombre}"/>
			</div>
		</div>
		<div class="col-md-6">
			<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'apellido', 'error')} required">
				<label for="apellido">
					<g:message code="persona.apellido.label" default="Apellido" />
				</label>
				<g:textField name="apellido" pattern="[A-Z]{1}?[a-z]{2,19}" title="Formato: letras de la A a la z. Longitud entre 3 y 20." required="" value="${personaInstance?.apellido}"/>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6">
			<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'dni', 'error')} required">
				<label for="dni">
					<g:message code="persona.dni.label" default="DNI" />
				</label>
				<g:field name="dni" pattern = "[0-9]{8}"  title = "Formato: número de 8 digitos." value="${personaInstance?.dni}" required=""/>
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
            <div class="fieldcontain ${hasErrors(bean: roleInstance, field: 'authority', 'error')} required">
                <label for="roleId">
                    <g:message code="role.roleId.label" default="Rol" />
                </label>
                <g:select id="role" name="role.id" from="${com.testapp.Role.list()}" optionKey="id" optionValue="authority" required="" 
                noSelection= "['': 'Seleccione un rol']"
                value="${roleInstance?.roleId}"/>
            </div>
        </div>
		<div class="col-md-6">
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
				<label for="username">
					<g:message code="user.username.label" default="Usuario" />
				</label>
				<g:field name="username" type="email" required="" value="${userInstance?.username}"/>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
				<label for="password">
					<g:message code="user.password.label" default="Contrase&ntildea" />
				</label>
				<g:textField name="password" required="" value="${userInstance?.password}"/>
			</div>
		</div>
		<div class="col-md-4">
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'confirmPassword', 'error')} required">
				<label for="confirmPassword">
					<g:message code="user.confirmPassword.label" default="Verificar Contrase&ntildea" />
				</label>
				<g:textField name="confirmPassword" required="" value="${userInstance?.confirmPassword}"/>
			</div>
		</div>
	</div>
</div>



