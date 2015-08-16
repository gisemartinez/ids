<%@ page import="abm.Area" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'area.label', default: 'Area')}"/>
		<g:set var="title" value="Editar"/>
		<title>${title}</title>
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="col s12 offset-m1 m10 offset-l2 l8">
					<div class="card">
						<g:form url="[resource:areaInstance, action:'update']" method="PUT" id="form_edit">
							<div class="card-image">
								<asset:image src="sample-1.jpg"/>
								<span class="card-title">Editar Área</span>
							</div>
							<div class="card-content">
								<g:render template="/if-errors" bean="${areaInstance}" var="instance"/>
								<g:hiddenField name="version" value="${areaInstance?.version}" />
								<g:render template="form"/>
							</div>
						</g:form>
						<div class="card-action">
							<g:link action="show" id="${areaInstance.id}">Cancelar</g:link>
							<g:submitButton form="form_edit" name="update" value="Guardar" class="btn-flat white"/>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>$('.brand-logo').text('${title}')</script>
	</body>
</html>
