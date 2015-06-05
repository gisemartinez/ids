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
	//Footer
	$('body').append('<!--Footer--><div class="row container-fluid" style="margin-top:100px"></div>')

	//a todos los inputs (menos a los submits) le agrego la clase form-control
	$('input,select,textarea').addClass("form-control")
	$('input:checkbox,input:submit').removeClass("form-control")
	$('.fieldcontain').removeClass("fieldcontain")
	$('div.required').css('margin-bottom','10px')
	$('.list-group').css('margin-bottom','0')

	//Tablas
	$('table').addClass("table table-hover")
	$('table').wrap('<div class="panel table-responsive">')
	$('th').css('vertical-align','middle')
	$('th,td').css('text-align', 'center')
	$('th a').attr("style", "color:white;text-decoration:none")
	$('th.sortable a').attr('title','Cambiar orden')
	$('th.sortable a').append('<i class="mdi-navigation-unfold-more"></i>')
	
	//Coloreo los labels de estado dependiendo su valor.
	$("span.Reparar").attr('style','color:white;background-color:#f44336')
	$("span.Uso").attr('style','color:white;background-color:#4CAF50')
	$("span.Baja").attr('style','color:white;background-color:#212121')
	$("span.Descarte").attr('style','color:white;background-color:#795548')
	$("span.Donacion").attr('style','color:white;background-color:#FFC107')
	$("span.Evaluar").attr('style','color:white;background-color:#2196F3')
	
	//Si no hay elementos para mostrar..
	if(!$('tbody').children().length){
		$('.table-responsive').before('<div class="alert alert-dismissable alert-info"><button type="button" class="close" data-dismiss="alert">×</button><i class="mdi-action-info"></i> No hay bienes cargados. <a class="alert-link" data-toggle="collapse" href="#crearBien" aria-expanded="false" aria-controls="crearBien" id="accion">Desea cargar uno?</a></div>')
		$('.table-responsive').css('display','none')
	}

	//Si no hay suficientes elementos para paginar..
	if($('ul.pagination li.disabled')){
		$('div.pagination').css('display','none')	
	}	
	
	//Menús Desplagables
	drop_up($(".perfil"))
	drop_down($(".perfil"))
	
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
