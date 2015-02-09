<%@ page import="abm.Bien" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="Permisos"/></title>
	</head>
	<body>
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">${springSecurityService.authentication.authorities}</a>
				</div>

			</div>
		</nav>

		<div class="container-fluid">
			<div id="content-permisos" class="content scaffold-list" role="main">

				<div class="table-responsive">
					<table>
						<thead>
							<tr>

							</tr>
						</thead>
						<tbody>
	
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
									<td><g:link action="show" id="${bienInstance.id}">${fieldValue(bean: bienInstance, field: "codigoDeSerie")}</g:link></td>
								</tr>

						</tbody>
					</table>
				</div>
				
			</div>
		</div>
	</body>
</html>
