<script>
	$(document).ready(function(){
		// Tables
		$('table').addClass("centered hoverable responsive-table").wrap('<div class="card">')
		$('thead').addClass("blue white-text")

		$('th.sortable a').addClass('tooltipped').attr('data-position','top').attr('data-delay','50').attr('data-tooltip','Cambiar orden').each(function() {
			if ($(this).hasClass('sorted')) {
				if ($(this).hasClass('asc')) $(this).append('<i class="material-icons">keyboard_arrow_up</i>')
				if ($(this).hasClass('desc')) $(this).append('<i class="material-icons">keyboard_arrow_down</i>')
			}
		})

		$('.tooltipped').tooltip({delay: 50});

		if(!$('tbody').children().length){
			$('.table-responsive').before('<div class="alert alert-dismissable alert-info"><button type="button" class="close" data-dismiss="alert">×</button><i class="mdi-action-info"></i> No hay nada cargado. <a class="alert-link" id="create">Desea cargar algo?</a></div>')
			$('.table-responsive').css('display','none')
		}

		// Pagination
		$('ul.pagination li>a').addClass('waves-effect')
		$('ul.pagination span.active').parent().addClass('active blue')
		$('ul.pagination span.active').replaceWith('<a>'+$('ul.pagination span.active').text()+'</a>');

		$('.delete').click(function() {
			var form = 'form_delete_'+$(this).data('id'),entity = $(this).data('entity')
			//Si aun no existe ningun modal
			if (!$('#dataConfirmModal').length) {
				alert('Form: '+form+' Entidad: '+entity)
				$('body').append(
					'<div id="dataConfirmModal" class="modal bottom-sheet">'+
							'<div class="modal-content">'+
								'<h4 class="modal-title">Borrar '+entity+'</h4>'+
								'<p>¿Desea borrar esto?</p>'+
							'</div>'+
							'<div class="modal-footer">'+
								'<button id="confirmbutton" type="submit" form='+form+' class="btn-flat teal-text waves-effect waves-red">Borrar</button>'+
								'<a href="#!" class="modal-action modal-close waves-effect waves-grey btn-flat">Cancelar</a>'+
							'</div>'+
					'</div>'
				)
			} else {
				alert('Form: '+form+' Entidad: '+entity)
				var modal = $('#dataConfirmModal')
				// Redireccionamos el boton al formulario correspondiente.
				modal.find('#confirmbutton').attr('form',form)
			}
			$('#dataConfirmModal').openModal();
			return false;
		})

		$('tr.clickable').click(function() {
			var id = $(this).data('id'), entity = $(this).data('entity'), name = $(this).data('name')
			//Si aun no existe ningun modal
			if (!$('#bottomActionsModal').length) {
				$('body').append(createBottomMenuModal(id,entity,name))
			} else {
				$('#bottomActionsModal').replaceWith(createBottomMenuModal(id,entity,name))
			}
			$('#bottomActionsModal').openModal()
		})

		function createBottomMenuModal(id,entity,name) {
			var url_show = '${createLink(action: "show")}/'+id
			var url_edit = '${createLink(action: "edit")}/'+id
			var url_delete = 'javascript:document.form_delete_'+id+'.submit()'

			return '<div id="bottomActionsModal" class="modal bottom-sheet">'+
						'<div class="modal-content">'+
							'<h4 class="modal-title">'+entity+': '+name+'</h4>'+
							'<ul class="collection">'+
								'<li class="collection-item avatar">'+
									'<a href='+url_show+'><i class="material-icons circle brown">assignment</i></a>'+
									'<span class="title">Ver</span>'+
									'<p>First Line</p>'+
								'</li>'+
								'<li class="collection-item avatar">'+
									'<a href='+url_edit+'><i class="material-icons circle blue">edit</i></a>'+
									'<span class="title">Editar</span>'+
									'<p>First Line</p>'+
								'</li>'+
								'<li class="collection-item avatar">'+
									'<a href='+url_delete+' class="delete" data-id="'+id+'" data-entity="'+entity+'"><i class="material-icons circle red">delete</i></a>'+
									'<span class="title">Borrar</span>'+
									'<p>First Line</p>'+
									'<a href="#!" class="secondary-content"><i class="material-icons red-text">warning</i></a>'
								'</li>'+
							'</ul>'+
						'</div>'+
					'</div>'
		}

	})

</script>
