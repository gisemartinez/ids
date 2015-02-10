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
	$('input:checkbox,input:submit').removeClass("form-control")
	$('.fieldcontain').removeClass("fieldcontain")
	$('div.required').css('margin-bottom','10px')
	$('.list-group').css('margin-bottom','0')

	//Tablas
	$('table').addClass("table table-hover")
	$('table').wrap('<div class="panel panel-default table-responsive">')
	$('th,td').attr("style", "text-align:center")
	$('th a').attr("style", "color:white;text-decoration:none")
	$('th.sortable a').attr('title','Cambiar orden')
	
	//Coloreo los labels estado dependiendo su valor.
	$("span.Reparar").attr('style','color:white;background-color:#f44336')
	$("span.Uso").attr('style','color:white;background-color:#4CAF50')
	$("span.Baja").attr('style','color:white;background-color:#212121')
	$("span.Descarte").attr('style','color:white;background-color:#795548')
	$("span.Donacion").attr('style','color:white;background-color:#FFC107')
	$("span.Evaluar").attr('style','color:white;background-color:#2196F3')
	
	//Si no hay elementos para mostrar..
	if(!$('tbody').children().length){
		$('.table-responsive').before('<div class="alert alert-warning" role="alert"><i class="md md-info"></i> No hay datos cargados. <a class="alert-link" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample" id="accion">Desea agregar uno?</a></div>')
		$('.table-responsive').css('display','none')
	}

	//Si no hay suficientes elementos para paginar..
	if($('ul.pagination li.disabled')){
		$('div.pagination').css('display','none')	
	}
	
	//Barra Principal
	$('.barra_principal ul').attr("style", "background-color:#009688")
	$('.barra_principal a').attr("style", "color:white;background-color:#009688;padding:15px 10px;")
	$('.barra_principal .navbar-right ul a').css('padding','3px 20px;')
	$('.barra_principal .md').addClass('md-2x')
	$('#bs-example-navbar-collapse-1').attr("style", "background-color:#009688")
	
	//Barra Secundaria
	$('#bs-example-navbar-collapse-2').attr("style", "background-color:#f8f8f8")
	
	//Ambas
	$('.navbar-right ul li').attr("style","text-align: right;")
	
	//Menús Desplagables
	drop_up($(".perfil"))
	drop_up($(".filtro"))
	drop_down($(".perfil"))
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
