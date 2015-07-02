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
	
	$.material.init()

	$(function () {$('[data-toggle="tooltip"]').tooltip()})
	
	//Clear Input Button//
	$('input:not([type="button"]):not([type="submit"]):not([type="hidden"]),textarea').addClass("clearable-input").bind('input change',function(){
		if($(this).val()) {
			$(this).next().css('display','inline-block')
		}
		else $(this).next().css('display','none')

		if ($(this).parent().prop("tagName") == "TD") {$('tr input[type="button"]').trigger( "click" )}
	}).after('<button class="btn-link btn-clear mdi-content-clear" id="btn-clear" tabIndex="-1"></button>')
	$('button#btn-clear').click(function(){
		$(this).prev().val('').trigger('input')
	})
	
	//Submit Form on Password Field Enter//
	$('form input[type="password"]').keypress(function(e){
		if (e.which == 13) {
			e.preventDefault()
			$('button[type="submit"]').trigger( "click" )
		}
	})

	$(function () {
		var url = window.location.pathname
		var animation_duration = 1000
		var easing = "linear"

		if (url.indexOf("bien")>-1) {$('li.bien').addClass('active')}
		if (url.indexOf("estadistica")>-1) {$('li.estadistica').addClass('active')}
		if (url.indexOf("persona")>-1) {$('li.persona').addClass('active')}
		if (url.indexOf("area")>-1) {$('li.area').addClass('active')}
		if (url.indexOf("ubicacion")>-1) {$('li.ubicacion').addClass('active')}

		if (url.indexOf("bien")>-1) {$('a.bien').animate({fontSize:'36px'},animation_duration,easing)}
		if (url.indexOf("estadistica")>-1) {$('a.estadistica').animate({fontSize:'36px'},animation_duration,easing)}
		if (url.indexOf("persona")>-1) {$('a.persona').animate({fontSize:'36px'},animation_duration,easing)}
		if (url.indexOf("area")>-1) {$('a.area').animate({fontSize:'36px'},animation_duration,easing)}
		if (url.indexOf("ubicacion")>-1) {$('a.ubicacion').animate({fontSize:'36px'},animation_duration,easing)}
	})	
	
	// Estilo de los inputs
	$('input,select,textarea').addClass("form-control")
	$('input:checkbox,input:submit').removeClass("form-control")

	// Tablas
	$('table').addClass("table table-hover").wrap('<div class="panel table-responsive">')
	$('th.sortable a').attr('data-toggle','tooltip').attr('data-toggle','tooltip').attr('data-placement','top').attr('title','').attr('data-original-title','Cambiar orden')
	
	$('.sortable a').append('<i class="mdi-navigation-unfold-more"></i>')
	$('.sorted.asc a').children().remove()
	$('.sorted.asc a').append('<i class="mdi-navigation-expand-less"></i>')
	$('.sorted.desc a').children().remove()
	$('.sorted.desc a').append('<i class="mdi-navigation-expand-more"></i>')


	if(!$('tbody').children().length){
		$('.table-responsive').before('<div class="alert alert-dismissable alert-info"><button type="button" class="close" data-dismiss="alert">×</button><i class="mdi-action-info"></i> No hay nada cargado. <a class="alert-link" href="#create" id="accion">Desea cargar algo?</a></div>')
		$('.table-responsive').css('display','none')
	}

	// Paginacion
	if($('ul.pagination li.disabled')){
		$('div.pagination').css('display','none')
	}
	
	// Desplegables
	$(".perfil").hover(
		function(){
			$(this).addClass("open")
			$('.perfil>a>b').removeClass('mdi-navigation-arrow-drop-down').addClass('mdi-navigation-arrow-drop-up')
		},
		function(){
			$(this).removeClass("open")
			$('.perfil>a>b').removeClass('mdi-navigation-arrow-drop-up').addClass('mdi-navigation-arrow-drop-down')
		}
	)
	
	// Oculta la barra de navegacion y el FAB cuando nos desplazamos hacia abajo y los muestra cuando lo hacemos hacia arriba o llegamos al fondo
	var prevScrollTop = 0, curDir = 'down', prevDir = 'up'
	$(window).scroll(function() {
		var x = $('div.navbar').height(), curScrollTop = $(this).scrollTop()
		if(curScrollTop > Math.max(x,prevScrollTop) && curScrollTop + $(this).height() != $(document).height()) {
			curDir = 'down';
			if(curDir != prevDir ) {
				$('div.navbar').stop().animate({ top: '-70px' }, 'slow')
				$('.mfb-component--br').attr('data-mfb-state', 'closed').stop().animate({ bottom: '-200px' }, 'slow')
			}
		} else {
			curDir = 'up'
			if(curDir != prevDir) {
				$('div.navbar').stop().animate({ top: '0px' }, 'slow')
				$('.mfb-component--br').stop().animate({ bottom: '0px' }, 'slow')
			}
		}
		prevDir = curDir;
		prevScrollTop = curScrollTop
	})
		
	$('.delete').click(function() {
		var form,entity
		if ($(this).data('form') == undefined) {form = "form_delete"} else form = $(this).data('form')
		if ($(this).data('entity') == undefined) {entity = ""} else entity = $(this).data('entity')
		//Si aun no existe ningun modal
		if (!$('#dataConfirmModal').length) {
			$('body').append(
				'<div id="dataConfirmModal" class="modal fade">'+
					'<div class="modal-dialog modal-sm">'+
						'<div class="modal-content">'+
							'<div class="modal-header">'+
								'<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>'+
								'<h4 class="modal-title">Borrar '+entity+'</h4>'+
							'</div>'+
							'<div class="modal-body">'+
								'<p>¿Desea borrar esto?</p>'+
							'</div>'+
							'<div class="modal-footer">'+
								'<button type="button" data-dismiss="modal" class="btn btn-flat btn-default">Cancelar</button>'+
								'<button id="confirmbutton" type="submit" form='+form+' class="btn btn-flat btn-primary">Borrar</button>'+
							'</div>'+
						'</div>'+
					'</div>'+
				'</div>'
			)
		} else {
			var modal = $('#dataConfirmModal')
			// Redireccionamos el boton al formulario correspondiente.
			modal.find('#confirmbutton').attr('form',form)
		}
		$('#dataConfirmModal').modal({show:true});
		return false;
	})
});
