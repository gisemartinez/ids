<%@ page import="abm.PersonaUser" %>



<div class="fieldcontain ${hasErrors(bean: personaUserInstance, field: 'personaId', 'error')} required">
	<label for="personaId">
		<g:message code="personaUser.personaId.label" default="Persona Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="personaId" type="number" value="${personaUserInstance.personaId}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: personaUserInstance, field: 'userId', 'error')} required">
	<label for="userId">
		<g:message code="personaUser.userId.label" default="User Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="userId" type="number" value="${personaUserInstance.userId}" required=""/>

</div>

