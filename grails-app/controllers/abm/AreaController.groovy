package abm

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_SUPERVISOR'])
@Transactional(readOnly = true)
class AreaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def areaService

    def index() {
    }

    def list(Integer max) {
        println(params)
        //Seteo el maximo a mostrar
        params.max = Math.min(max ?: 2, 100)
        params.offset = params.offset ?: 0
        params.query = params.query ?: ""
        params.sort = params.sort ?: "nombrearea"
        params.order = params.order ?: "asc"
        //Realizo la busqueda
        def listSinMaxNiOffset = areaService.getAreas(0,0,params.query)
        def listaConMaxYOffset = areaService.getAreas(params.max,params.offset,params.query)
        //Ordeno
        def listaOrdenada = areaService.ordenarLista(listaConMaxYOffset,params.sort,params.order)
        render(
            template:'list',
            model: [
                areaInstanceList:       listaOrdenada,
                areaInstanceCount:      listSinMaxNiOffset.size(),
                params:                 params
            ]
        )
    }

    def show(Area areaInstance) {
        respond areaInstance
    }

    def create() {
        respond new Area(params)
    }

    @Transactional
    def save(Area areaInstance) {
        if (areaInstance == null) {
            notFound()
            return
        }

        if (areaInstance.hasErrors()) {
            respond areaInstance.errors, view:'create'
            return
        }

        areaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'area.label', default: 'Area'), areaInstance.id])
                redirect areaInstance
            }
            '*' { respond areaInstance, [status: CREATED] }
        }
    }

    def edit(Area areaInstance) {
        println(session.nombreAplicacion)
        respond areaInstance
    }

    @Transactional
    def update(Area areaInstance) {
        if (areaInstance == null) {
            notFound()
            return
        }

        if (areaInstance.hasErrors()) {
            respond areaInstance.errors, view:'edit'
            return
        }

        areaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Area.label', default: 'Area'), areaInstance.id])
                redirect areaInstance
            }
            '*'{ respond areaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Area areaInstance) {

        if (areaInstance == null) {
            notFound()
            return
        }

        areaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Area.label', default: 'Area'), areaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'area.label', default: 'Area'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
