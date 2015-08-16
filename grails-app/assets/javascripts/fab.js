var fab = {height: 55.5, width: 55.5}
var animation_duration = 600

function window_width() {return $(window).width()}
function window_height() {return $(window).height()}
function body_padding_top() {return parseInt($('body').css('padding-top').substr(0,2))}
function nav() {return parseInt($('.navbar-fixed').css('height').substr(0,2)) + parseInt($('.navbar-fixed').css('margin-bottom').substr(0,2))}

function init_panel_fab() {
	$('.card-fab')
	.css('height',fab.height)
	.css('width',fab.width)
	.css('bottom',-window_height()+nav()+fab.height+15)
	.css('right',(-window_width()+fab.width+30)/2)
	.css('border-radius',200)
	.css('display','block')
}

$(document).ready(function() {
	// Si encuentra un FAB, agrega el padding correpondiente.
	if ($('a.btn-floating').length) {
		$('body').css('padding-bottom', '75px')
	};
	
	$('a#create').click(function() {
		var card_height = parseInt($(this).data('card-height'))
		if ($('.card-fab').hasClass('open')) {
			$('.card-fab').animate({height:card_height,'-webkit-border-radius': 200,'-moz-border-radius':200,'border-radius':200},animation_duration/2)
			.children(':not(:first-child)').animate({opacity:0},animation_duration).css('display','none')
			$('.card-fab').promise().done(function() {
				$(this).toggleClass('clicked').animate({width:fab.width,height:fab.height},animation_duration).children(':first-child').animate({fontSize:24,lineHeight:fab.height,opacity:1},animation_duration).css('display','block')
				$(this).promise().done(function() {
					$(this).animate({bottom:-window_height()+nav()+fab.height+15,right:(-window_width()+fab.width+30)/2},animation_duration).promise().done(function(){
						$(this).css('display','none')
						$('a.btn-floating').css('display','inline-block')
						$('.card-fab-row,.card-fab-col').css('display','none')
						$('body').animate({paddingBottom:75},animation_duration)
						$('.card-fab').removeClass('open')
					})
				})
			})
		} else {
			init_panel_fab()
			$('.card-fab-row,.card-fab-col').css('display','block')
			$('a.btn-floating').css('display','none')
			$('body').animate({paddingBottom:0},animation_duration)
			$('.card-fab').addClass('open').stop().animate({bottom:0,right:0},animation_duration).promise().done(function() {
				var right = (card_height - $(this).parent().width())/2
				$(this).toggleClass('clicked').animate({width:'100%',height:card_height},animation_duration).children(':first-child').animate({fontSize:100,lineHeight:card_height,opacity:0},animation_duration).promise().done(function(){
					$(this).css('display','none')
				})
				$(this).promise().done(function() {
					$(this).animate({height:'100%','-webkit-border-radius': 2,'-moz-border-radius':2,'border-radius':2},animation_duration/2)
					.children(':not(:first-child)').css('display','block').animate({opacity:1},animation_duration)
				})
			})
		}
	})
})
