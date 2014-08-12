<html>
	<head>
		<meta name='layout' content='main'/>
		<title><g:message code="springSecurity.login.title"/></title>
		<style>
			.alerta{
				border-radius: 4px;
				margin-left: auto;
				margin-right: auto;
				padding: 6px 25px;
				max-width: 400px;
				background-color: #c33;
				color: white;
				text-align: center;
			}

			.alineacionvertical{
				position: relative; 
				top: 50%; 
				transform: translateY(-50%);
			}

		</style>
	</head>
	<body>
		<g:if test='${flash.message}'>
			<div style="padding: 0px 15px; margin-top: 25px; margin-bottom: 25px;">
				<div class="alerta">
					El usuario o la contraseña son incorrectos.
				</div>
			</div>
		</g:if>
		<div style="text-align:center; margin-top:20px; margin-bottom: 20px"><h4>Ingresa tus datos para acceder:</h4></div>
		<div class="container" style="max-width:256px;">

			<form role="form" action='${postUrl}' method='POST' id='loginForm' autocomplete='off'>
				<div class="form-group">
					<!-- <label for='username'><g:message code="springSecurity.login.username.label"/>:</label> -->
					<input type="text" class="form-control" name="j_username" id="username" placeholder="Nombre de usuario"/>
				</div>
				<div class="form-group">
					<!-- <label for='password'><g:message code="springSecurity.login.password.label"/>:</label> -->
					<input type="password" class="form-control" name='j_password' id='password' placeholder="Contraseña">
				</div>
				<button type="submit" class="btn btn-primary">Iniciar sesión</button>
				<div class="checkbox">
					<label>
						<input type='checkbox' <g:if test='${hasCookie}'>checked='checked'</g:if>/>No cerrar sesión
					</label>
				</div>				
			</form>
		</div>		
	</body>
</html>
