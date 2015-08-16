package abm

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_SUPERVISOR'])
@Transactional(readOnly = true)
class UbicacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def ubicacionService

    def index() {
    }

    def list(Integer max) {
        println(params)
        //Seteo el maximo a mostrar
        params.max = Math.min(max ?: 2, 100)
        params.offset = params.offset ?: 0
        params.query = params.query ?: ""
        params.sort = params.sort ?: "nombreubica"
        params.order = params.order ?: "asc"
        //Realizo la busqueda
        def listSinMaxNiOffset = ubicacionService.getUbicaciones(0,0,params.query)
        def listaConMaxYOffset = ubicacionService.getUbicaciones(params.max,params.offset,params.query)
        //Ordeno
        def listaOrdenada = ubicacionService.ordenarLista(listaConMaxYOffset,params.sort,params.order)
        render(
            template:'list',
            model: [
                ubicacionInstanceList:      listaOrdenada,
                ubicacionInstanceCount:     listSinMaxNiOffset.size(),
                params:                     params
            ]
        )
    }

    def show(Ubicacion ubicacionInstance) {
        respond ubicacionInstance
    }

    def create() {
        respond new Ubicacion(params)
    }

    @Transactional
    def save(Ubicacion ubicacionInstance) {
        if (ubicacionInstance == null) {
            notFound()
            return
        }

        if (ubicacionInstance.hasErrors()) {
            respond ubicacionInstance.errors, view:'create'
            return
        }

        ubicacionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'ubicacion.label', default: 'Ubicacion'), ubicacionInstance.id])
                redirect ubicacionInstance
            }
            '*' { respond ubicacionInstance, [status: CREATED] }
        }
    }

    def edit(Ubicacion ubicacionInstance) {
        respond ubicacionInstance
    }

    @Transactional
    def update(Ubicacion ubicacionInstance) {
        if (ubicacionInstance == null) {
            notFound()
            return
        }

        if (ubicacionInstance.hasErrors()) {
            respond ubicacionInstance.errors, view:'edit'
            return
        }

        ubicacionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Ubicacion.label', default: 'Ubicacion'), ubicacionInstance.id])
                redirect ubicacionInstance
            }
            '*'{ respond ubicacionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Ubicacion ubicacionInstance) {

        if (ubicacionInstance == null) {
            notFound()
            return
        }

        ubicacionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Ubicacion.label', default: 'Ubicacion'), ubicacionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'ubicacion.label', default: 'Ubicacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
