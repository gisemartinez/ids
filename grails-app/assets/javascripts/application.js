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

	$('th.sortable a').attr('title','Cambiar orden')
	$('.list-group').attr('style','margin-bottom:0')


	//a todos los inputs (menos a los submits) le agrego la clase form-control

	$('input,select,textarea').addClass("form-control")
	$('input:checkbox').removeClass("form-control")
	$('input:submit').removeClass("form-control")
	$('.form-control').attr("style","margin-bottom:10px")
	$('.fieldcontain').removeClass("fieldcontain")

	//a todas las tablas le agrego la clase table
	$('table').addClass("table table-hover")
	$('table').wrap('<div class="panel panel-default table-responsive">')
	$('th,td').attr("style", "text-align:center")
	$('th a').attr("style", "color:white;text-decoration:none")


	$('.barra_principal ul').attr("style", "background-color:#009688")
	$('.barra_principal a').attr("style", "color:white;background-color:#009688;padding:15px 10px;")

	$('.barra_acciones a').attr("style","padding:5px 5px;")

	$('.navbar-right ul li').attr("style","text-align: right;")

	//$('.barra_acciones .navbar-right ul').attr("style","text-align: right;max-width:50px")

	//
	//Evitar comportamiento extra&#241o de grails
	//

	//Si no hay suficientes elementos para paginar..
	if($('ul.pagination li.disabled')){
		$('div.pagination').css('visibility','hidden')	
	}
	//Si no hay elementos para mostrar..
	if(!$('tbody').children().length){
		$('.table-responsive').css('visibility','hidden')	
	}
	//Si hay un input de id=password ,cambiarlo a tipo pass(q no muestre lo que escribe)
	$('input#password').attr('type','password')

	//Agrego algunos botones al menu dependiendo en que pagina estoy.

	if(location.pathname=="/${grailsApplication.config.nombreAplicacion}/bien/index"){
		$('div#menu').append("<a class='btn btn-default' href='/${grailsApplication.config.nombreAplicacion}/bien/create'>Upload</a>")
	}
	if(location.pathname=="/${grailsApplication.config.nombreAplicacion}/bien/create"){
		$('div#menu').append("<a class='btn btn-default' href='/${grailsApplication.config.nombreAplicacion}/bien/index'>Bienes</a>")
	}
	if(location.pathname.indexOf("/${grailsApplication.config.nombreAplicacion}/bien/show")!=-1){
		$('div#menu').append("<a class='btn btn-default' href='/${grailsApplication.config.nombreAplicacion}/${grailsApplication.config.nombreAplicacion}/bien/index'>Bienes</a>")
	}
	



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

	$("#nombre").change(function(e){
		var txt = $("#nombre").val();
		validarLetras( txt );
	})

	$("#apellido").change(function(e){
		var txt = $("#apellido").val();
		validarLetras( txt );
	})

	$("#codigoDeSerie").change(function(e){
		var txt = $("#codigoDeSerie").val();
		validarNumeros( txt );
	})

});



function validarLetras( txt ){
	if( !esSoloLetras(txt) )
		alert( "Debe ingresar solo letras" );
}

function esSoloLetras( txt ){
		var re = /^([a-z]|[A-Z]|\s)+$/;
		return re.test(txt);	
}

function esSoloNumero( txt ){
		var nu = /^([0-9])+$/;
		return nu.test(txt);	
}

function validarNumeros( txt ){
	if( !esSoloNumero(txt) )
		alert( "Debe ingresar solo numeros" );
}
