// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery
//= require_tree .
//= require_self
//= require bootstrap

$(document).ready(function(){

	//
	//bootstrap
	//

	//a todos los inputs (menos a los submits) le agrego la clase form-control

	$('input,select').addClass("form-control")

	$('input:checkbox').removeClass("form-control")
	$('input:submit').removeClass("form-control")

	$('.fieldcontain').removeClass("fieldcontain")
	//a todas las tablas le agrego la clase table
	$('table').addClass("table table-bordered")
	//agrego iconos a los botones
	// $('a.home').prepend("<span class='glyphicon glyphicon-home'>&nbsp</span>")
	
	// $('a.usuarios').prepend("<span class='glyphicon glyphicon-user'>&nbsp</span>")


	$('.save').prepend("<i align='center' class='glyphicon glyphicon-ok'></i>")
	$('.search').append("<i align='center' class='glyphicon glyphicon-search'></i>")
	$('.delete').append("<i align='center' class='glyphicon glyphicon-trash'></i>")
	$('a.edit').prepend("<span align='center' class='glyphicon glyphicon-pencil'></span>")
	$('a.cancel').prepend("<span align='center' class='glyphicon glyphicon-remove'></span>")


	$('a.list').prepend("<span class='glyphicon glyphicon-book'>&nbsp</span>")
	$('a.new').prepend("<span class='glyphicon glyphicon-upload'>&nbsp</span>")
	$('.perfil a').first().prepend("<span class='glyphicon glyphicon-user'>&nbsp</span>")

	//
	//Evitar comportamiento extraño de grails
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
	if(location.pathname=="/patronus/bien/index"){
		$('div#menu').append("<a class='btn btn-default' href='/patronus/bien/create'>Upload</a>")
	}
	if(location.pathname=="/patronus/bien/create"){
		$('div#menu').append("<a class='btn btn-default' href='/patronus/bien/index'>Bienes</a>")
	}
	if(location.pathname.indexOf("/patronus/bien/show")!=-1){
		$('div#menu').append("<a class='btn btn-default' href='/patronus/bien/index'>Bienes</a>")
	}
	

	$(".save").addClass("btn btn-success")
	$("a.cancel").addClass("btn btn-danger")
	$(".delete").addClass("btn btn-danger")

	$(".bienes").mouseover(function(){
		$(".bienes").addClass("open");
	});
	$(".bienes").mouseout(function(){
		$(".bienes").removeClass("open");
	});


	$(".usuarios").mouseover(function(event){
	$(".usuarios").addClass("open");
	});
	$(".usuarios").mouseout(function(event){
		$(".usuarios").removeClass("open");
	});

	$(".areas").mouseover(function(event){
	$(".areas").addClass("open");
	});
	$(".areas").mouseout(function(event){
		$(".areas").removeClass("open");
	});

	$(".estados").mouseover(function(event){
	$(".estados").addClass("open");
	});
	$(".estados").mouseout(function(event){
		$(".estados").removeClass("open");
	});

	$(".ubicaciones").mouseover(function(event){
	$(".ubicaciones").addClass("open");
	});
	$(".ubicaciones").mouseout(function(event){
		$(".ubicaciones").removeClass("open");
	});

	$(".perfil").mouseover(function(event){
	$(".perfil").addClass("open");
	});
	$(".perfil").mouseout(function(event){
		$(".perfil").removeClass("open");
	});
	
	$(".estado").mouseover(function(event){
		$(".estado").addClass("open");
	});
	$(".estado").mouseout(function(event){
		$(".estado").removeClass("open");
	});

})
