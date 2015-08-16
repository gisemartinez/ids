<g:if test="${flash.message}">
	<div class="row">
		<div class="col s12 m5">
			<div class="card-panel red">
				<span class="white-text">${flash.message}</span>
			</div>
		</div>
	</div>
</g:if>
<g:hasErrors bean="${instance}">
	<ul class="errors" role="alert">
		<g:eachError bean="${instance}" var="error">
			<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
				<g:message error="${error}"/>
			</li>
		</g:eachError>
	</ul>
</g:hasErrors>
