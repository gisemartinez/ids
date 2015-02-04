// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//= require jquery
//= require_self

//= require_tree bootstrap 

$(document).ready(function(){

	//
	//bootstrap
	//

	//a todos los inputs (menos a los submits) le agrego la clase form-control

	$('input,select,textarea').addClass("form-control")
	$('input:checkbox').removeClass("form-control")
	$('input:submit').removeClass("form-control")
	$('.fieldcontain').removeClass("fieldcontain")

	$('.list-group').attr('style','margin-bottom:0')
	$('.form-control').attr("style","margin-bottom:10px")

	//Tablas
	$('table').addClass("table table-hover")
	$('table').wrap('<div class="panel panel-default table-responsive">')
	$('th,td').attr("style", "text-align:center")
	$('th a').attr("style", "color:white;text-decoration:none")
	$('th.sortable a').attr('title','Cambiar orden')
	
	//Si no hay elementos para mostrar..
	if(!$('tbody').children().length){
		$('.table-responsive').before('<div class="alert alert-warning" role="alert"><i class="md md-info"></i> No hay datos cargados. <a class="alert-link" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample" id="accion">Desea agregar uno?</a></div>')
		$('.table-responsive').css('visibility','hidden')
	}

	//Si no hay suficientes elementos para paginar..
	if($('ul.pagination li.disabled')){
		$('div.pagination').css('visibility','hidden')	
	}

	$('.barra_principal ul').attr("style", "background-color:#009688")
	$('.barra_principal a').attr("style", "color:white;background-color:#009688;padding:15px 10px;")
	$('.barra_acciones a').attr("style","padding:5px 5px;")
	$('.navbar-right ul li').attr("style","text-align: right;")

	$('.barra_principal .navbar-right ul a').attr("style","padding:3px 20px;color:white;background-color:#009688;")
	$('.barra_acciones .navbar-right ul a').attr("style","padding:3px 20px;")

	//Si hay un input de id=password ,cambiarlo a tipo pass(q no muestre lo que escribe)
	$('input#password').attr('type','password')

	drop_up($(".estado"))
	drop_up($(".perfil"))
	drop_up($(".ubicaciones"))
	drop_up($(".estados"))
	drop_up($(".areas"))
	//drop_up($(".bienes"))
	drop_up($(".persona"))
	drop_up($(".filtro"))
	
	drop_down($(".estado"))
	drop_down($(".perfil"))
	drop_down($(".ubicaciones"))
	drop_down($(".estados"))
	drop_down($(".areas"))
	//drop_down($(".bienes"))
	drop_down($(".persona"))
	drop_down($(".filtro"))

	function drop_up(elem){
		elem.mouseout(function(){
			elem.removeClass("open")
		})
	}
	
	function drop_down(elem){
		elem.mouseover(function(){
			elem.addClass("open")
		})
	}
	
});
