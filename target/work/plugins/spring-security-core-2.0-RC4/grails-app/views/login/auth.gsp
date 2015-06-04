<html>
	<head>
		<meta name='layout' content='login'/>
		<title><g:message code="springSecurity.login.title"/></title>
	</head>
	<body>
		<div style="text-align:center; margin-bottom: 20px"><h4>Inicia sesión para acceder Patronus:</h4></div>
		<div class="panel panel-default" style="margin:0 auto; max-width:350px">
			<div class="panel-body">
				<div style="text-align:center; margin-bottom: 20px"><i class="mdi-action-account-circle" style="font-size:8em"></i></div>
				<div class="container-fluid" style="max-width:300px;">
					<form role="form" action='${postUrl}' method='POST' id='loginForm' autocomplete='off'>
						<div class="form-group">
							<input type="text" required="" class="form-control floating-label" name="j_username" id="username" placeholder="Nombre de usuario"/>
						</div>
						<div class="form-group">
							<input type="password" required="" class="form-control floating-label" name='j_password' id='password' placeholder="Contrase&#241a">
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary" style="width:100%">Iniciar sesi&oacuten</button>
						</div>
						<div class="form-group">
							<div class="checkbox">
								<label>
									<input type='checkbox' <g:if test='${hasCookie}'>checked='checked'</g:if>/>No cerrar sesi&oacuten
								</label>
							</div>
						</div>
					</form>
				</div>
				<g:if test='${flash.message}'>
					<div class="alert alert-danger alert-dismissible" role="alert" style="max-width:350px; margin:0 auto">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<i class="md md-error"></i> <!-- <strong>Error!</strong>  -->El usuario o la contrase&#241a son incorrectos.
					</div>
				</g:if>
			</div>
		</div>
	</body>
</html>
