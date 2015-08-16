<div class="card search">
	<g:formRemote name="form_refresh_list" update="list" url="[action:'list']">
		<button type="submit" class="btn-flat btn-search"><i class="material-icons">search</i></button>
		<input type="search" placeholder="Ingrese una busqueda..." name="query">
	</g:formRemote>
	<script>
		$(document).ready(function(){
			$('#form_refresh_list').submit()
		})
	</script>
</div>
