// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//= require fab
//= require_self

$(document).ready(function(){
	$(".button-collapse").sideNav();
	$(".dropdown-button").dropdown();
	$('select').material_select();
	$('.materialboxed').materialbox();

	// Search Button
	$('nav input[type="search"]').bind('input',function(){
		$('#form_refresh_list').submit()
	})

	// setInterval(function(){
	// 	$('#form_refresh_notifications').submit()
	// },60000);

	// Clearable Inputs
	$('input:not([type="button"]):not([type="submit"]):not([type="hidden"]):not([type="checkbox"]),textarea').addClass("clearable-input")
	.after('<button class="btn-flat btn-clear" tabIndex="-1"><i class="material-icons">clear</i></button>')
	.bind('input change',function(){		
		if ($(this).val()) $(this).next().css('display','inline-block')
		else $(this).next().css('display','none')
	})
	$('button.btn-clear').click(function(){
		$(this).prev().val('').trigger('input')
	})

	$('.search input').focusin(function(){
		$('.search button[type="submit"]').addClass('teal-text')
	}).focusout(function(){
		$('.search button[type="submit"]').removeClass('teal-text')
	}).bind('input change',function(){
		$('.search button[type="submit"]').trigger( "click" )
	})

	$(function () {
		var url = window.location.pathname
		var animation_duration = 1000

		if (url.indexOf("bien")>-1) {$('li.bien').addClass('active')}
		if (url.indexOf("estadistica")>-1) {$('li.estadistica').addClass('active')}
		if (url.indexOf("persona")>-1) {$('li.persona').addClass('active')}
		if (url.indexOf("area")>-1) {$('li.area').addClass('active')}
		if (url.indexOf("ubicacion")>-1) {$('li.ubicacion').addClass('active')}

		if (url.indexOf("bien")>-1) {$('a.bien').animate({fontSize:'36px'},animation_duration)}
		if (url.indexOf("estadistica")>-1) {$('a.estadistica').animate({fontSize:'36px'},animation_duration)}
		if (url.indexOf("persona")>-1) {$('a.persona').animate({fontSize:'36px'},animation_duration)}
		if (url.indexOf("area")>-1) {$('a.area').animate({fontSize:'36px'},animation_duration)}
		if (url.indexOf("ubicacion")>-1) {$('a.ubicacion').animate({fontSize:'36px'},animation_duration)}
	})

	if (!$('.navbar-fixed')) {$('body').css('padding-top',0)}

	// Oculta la barra de navegacion y el FAB cuando nos desplazamos hacia abajo y los muestra cuando lo hacemos hacia arriba o llegamos al fondo
	var prevScrollTop = 0, curDir = 'down', prevDir = 'up'
	$(window).scroll(function() {
		var x = $('.navbar-fixed').height(), curScrollTop = $(this).scrollTop()
		if(curScrollTop > Math.max(x,prevScrollTop) && ((curScrollTop + $(this).height()) != $(document).height())) {
			curDir = 'down';
			if(curDir != prevDir ) {
				$('.navbar-fixed').stop().animate({ top: '-70px' }, 'slow')
				$('.btn-floating').attr('data-mfb-state', 'closed').stop().animate({ bottom: '-200px' }, 'slow')
			}
		} else {
			curDir = 'up'
			if(curDir != prevDir) {
				$('.navbar-fixed').stop().animate({ top: '0px' }, 'slow')
				$('.btn-floating').stop().animate({ bottom: '15px' }, 'slow')
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
				'<div id="dataConfirmModal" class="modal">'+
						'<div class="modal-content">'+
							'<h4 class="modal-title">Borrar '+entity+'</h4>'+
							'<p>¿Desea borrar esto?</p>'+
						'</div>'+
						'<div class="modal-footer">'+
							'<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cancelar</a>'+
							'<button id="confirmbutton" type="submit" form='+form+' class="btn btn-flat btn-primary">Borrar</button>'+
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
