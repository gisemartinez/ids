<html>
	<head>
		<meta name='layout' content='login'/>
		<title><g:message code="springSecurity.login.title"/></title>
	</head>
	<body>
		<div style="margin-top:70px;"></div>
		<div style="text-align:center; margin-bottom: 20px"><h4>Ingrese sus datos para acceder:</h4></div>
		<div class="container-fluid" style="max-width:300px;">
			<form role="form" action='${postUrl}' method='POST' id='loginForm' autocomplete='off'>
				<div class="form-group">
					<!-- <label for='username'><g:message code="springSecurity.login.username.label"/>:</label> -->
					<input type="text" class="form-control" name="j_username" id="username" placeholder="Nombre de usuario"/>
				</div>
				<div class="form-group">
					<!-- <label for='password'><g:message code="springSecurity.login.password.label"/>:</label> -->
					<input type="password" class="form-control" name='j_password' id='password' placeholder="Contrase&#241a">
				</div>
				<button type="submit" class="btn btn-primary">Iniciar sesi&oacuten</button>
				<div class="checkbox">
					<label>
						<input type='checkbox' <g:if test='${hasCookie}'>checked='checked'</g:if>/>No cerrar sesi&oacuten
					</label>
				</div>				
			</form>
		</div>
		<g:if test='${flash.message}'>
			<div class="alert alert-danger alert-dismissible" role="alert" style="max-width:350px;margin:0 auto">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<i class="md md-error"></i> <!-- <strong>Error!</strong>  -->El usuario o la contrase&#241a son incorrectos.
			</div>
		</g:if>
	</body>
</html>
