var fab = {margin: 15, height: 56, width: 56}
var animation_duration = 600
var easing = "easeInQuart"

function window_width() {return $(window).width()}
function window_height() {return $(window).height()}
function body_padding_top() {return parseInt($('body').css('padding-top').substr(0,2))}

function init_panel_fab() {
	$('.panel-fab')
	.css('height',fab.height)
	.css('width',fab.width)
	.css('bottom',-window_height()+body_padding_top()+fab.height+fab.margin)
	.css('right',-window_width()/2+fab.width-fab.margin)
	.css('border-radius',200)
	.css('display','block')
}

$(document).ready(function() {

	// Si encuentra un FAB, agrega el padding correpondiente.
	if ($('.mfb-component--br').length) {
		$('body').css('padding-bottom', '95px')
	};
	
	$('.mfb-component__button--main').hover(
		function(){$(this).attr('data-mfb-state','open')},
		function(){$(this).removeAttr('data-mfb-state')}
	)

	$('a.mfb-component__button--main>i.mdi-content-add').attr('data-toggle','tooltip').attr('data-toggle','tooltip').attr('data-placement','left').attr('title','').attr('data-original-title','Crear')
	$('a.mfb-component__button--main>i.mdi-action-list').attr('data-toggle','tooltip').attr('data-toggle','tooltip').attr('data-placement','left').attr('title','').attr('data-original-title','Volver al listado')
	
	$('a[href="#create"]').click(function() {
		var panel_height = parseInt($(this).data('panel-height'))

		if ($('.panel-fab').hasClass('open')) {
			$('body').animate({scrollTop:0},animation_duration,easing/2)
			$('.panel-fab').removeClass('open')
			.stop().animate({height:panel_height,'-webkit-border-radius': 200,'-moz-border-radius':200,'border-radius':200},animation_duration/2,easing)
			.children(':not(:first-child)').stop().animate({opacity:0},animation_duration,easing).css('display','none')
			$('.panel-fab').promise().done(function() {
				$(this).toggleClass('clicked').children(':first-child').animate({opacity:1},animation_duration,easing).css('display','block')
				$(this).animate({width:fab.width,height:fab.height},animation_duration,easing).promise().done(function() {
					$(this).animate({bottom:-window_height()+body_padding_top()+fab.height+fab.margin,right:-window_width()/2+fab.width-fab.margin
					},animation_duration,easing).promise().done(function(){
						$(this).css('display','none')
						$('.mfb-component__button--main').attr('style','display:inline-block;')
					})
				})
			})

		} else {
			$('.mfb-component__button--main').css('display','none')			
			init_panel_fab()
			$('.panel-fab').addClass('open').stop().animate({bottom:0,right:0},animation_duration,easing).promise().done(function() {
				$(this).children(':first-child').animate({opacity:0},animation_duration,easing).css('display','none')
				$(this).toggleClass('clicked').animate({width:'100%',height:panel_height},animation_duration,easing).promise().done(function() {
					$(this).animate({height:'100%','-webkit-border-radius': 2,'-moz-border-radius':2,'border-radius':2},animation_duration/2,easing)
					.children(':not(:first-child)').css('display','block').animate({opacity:1},animation_duration,easing)
				})
			})
		}
		
	})	
})
