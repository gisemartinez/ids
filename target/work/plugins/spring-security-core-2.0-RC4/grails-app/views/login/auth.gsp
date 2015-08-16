<html>
	<head>
		<title><g:message code="springSecurity.login.title"/></title>
		<style>
			body {padding-top: 0}
		</style>
	</head>
	<body>
		<h6 class="center-align" style="margin-bottom:20px">Inicia sesión para acceder a Patronus:</h6>
		<div class="row">
			<div class="col s12 offset-m3 m6 offset-l4 l4" style="min-width:350px">

				<g:if test="${flash.message}">
					<div class="card-panel red">
						<span class="white-text">${flash.message}</span>
					</div>
				</g:if>

				<div class="card-panel white">
					<div class="container">
						<div class="center-align"><i class="material-icons" style="font-size:8em">account_circle</i></div>
						<form role="form" action='${postUrl}' method='POST' id='form_login' autocomplete='off'>
							<div class="row">
								<div class="input-field col s12">
									<input name="j_username" id="email" type="email" class="validate">
									<label for="email">Email</label>
								</div>
								<div class="input-field col s12">
									<input name='j_password' id="password" type="password" class="validate">
									<label for="password">Password</label>
								</div>
								<div class="input-field col s12">
									<button type="submit" class="btn btn-primary" style="width: 100%">Iniciar sesi&oacuten</button>
								</div>
							</div>
							<p>
								<input type="checkbox" id="test5" <g:if test='${hasCookie}'>checked='checked'</g:if>/>
								<label for="test5">No cerrar sesi&oacuten</label>
							</p>
						</form>
					</div>
				</div>

			</div>
		</div>
	</body>
</html>
