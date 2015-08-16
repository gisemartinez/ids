<%@ page import="abm.Bien" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="title" value="Listado"/>
		<title>${title}</title>
	</head>
	<body>
		<div class="container">
			<g:render template="create"/>
			<g:render template="/search"/>
			<g:render template="list"/>
		</div>
		<script>$('.brand-logo').text('${title}')</script>
	</body>
</html>
