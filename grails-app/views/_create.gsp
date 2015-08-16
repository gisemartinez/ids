<div class="card card-fab">
	<i class="material-icons white-text center-align">add</i>
	<div class="card-content">
		<g:render template="/if-errors" bean="$(bienInstance)" var="instance"/>
		<g:form url="[resource:bienInstance, action:'save']" id="form_create" class="col s12">
			<g:render template="form"/>
		</g:form>
	</div>
	<div class="card-action">
		<a id="create" class="white waves-effect waves-teal btn-flat teal-text" data-panel-height="405">Cancelar</a>
		<g:submitButton form="form_create" name="update" value="Crear" class="btn btn-primary"/>
	</div>
</div>
<!-- FAB -->
<a id="create" class="btn-floating btn-large waves-effect waves-light red" data-panel-height="405" style="position: fixed; bottom: 15px; right: 15px;">
	<i class="material-icons">add</i>
</a>
