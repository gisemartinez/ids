<div class="container-fluid">
	<!-- Panel FAB -->
	<div class="panel panel-default panel-fab">
		<span class="mdi-content-add"></span>
		<div class="panel-body">
			<!-- <g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${bienInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${bienInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
							<g:message error="${error}"/>
						</li>
					</g:eachError>
				</ul>
			</g:hasErrors> -->
			<g:form url="[resource:bienInstance, action:'save']" id="form_create" class="form-horizontal">
				<g:render template="form"/>
			</g:form>						
		</div>
		<div class="panel-footer">
			<a id="create" class="btn btn-default" data-panel-height="406">Cancelar</a>
			<g:submitButton form="form_create" name="update" value="Crear" class="btn btn-primary"/>
		</div>
	</div>
	<!-- FAB -->
	<ul class="mfb-component--br" data-mfb-toggle="hover">
		<li class="mfb-component__wrap">
			<a id="create" class="mfb-component__button--main" data-panel-height="400">
				<i class="mfb-component__main-icon--resting mdi-content-add"></i>
				<i class="mfb-component__main-icon--active mdi-content-add"></i>
			</a>
		</li>
	</ul>
</div>
