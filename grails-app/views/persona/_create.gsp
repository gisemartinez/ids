	
	<div class="row card-fab-row">
		<div class="col s12 offset-m1 m10 offset-l2 l8 card-fab-col">
			<div class="card card-fab">
				<i class="material-icons white-text center-align">add</i>
				<g:form url="[resource:personaInstance, action:'save']" id="form_create" class="form-fab">
					<div class="card-image">
						<asset:image src="sample-1.jpg"/>
						<span class="card-title">Crear Persona</span>
					</div>
					<div class="card-content">
						<g:render template="/if-errors" bean="${personaInstance}" var="instance"/>
						<g:hiddenField name="version" value="${personaInstance?.version}"/>
						<g:render template="form"/>
					</div>
				</g:form>
				<div class="card-action">
					<a id="create" data-card-height="990" style="cursor:pointer">Cancelar</a>
					<g:submitButton form="form_create" name="update" value="Crear" class="btn-flat white"/>
				</div>
			</div>
		</div>
	</div>
	<!-- FAB -->
	<a id="create" class="btn-floating btn-large waves-effect waves-light red" data-card-height="990" style="position: fixed; bottom: 15px; right: 15px;">
		<i class="material-icons">add</i>
	</a>
