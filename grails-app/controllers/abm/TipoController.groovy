package abm



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['SUPERVISOR'])
@Transactional(readOnly = true)
class TipoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Tipo.list(params), model:[tipoInstanceCount: Tipo.count()]
    }

    def show(Tipo tipoInstance) {
        respond tipoInstance
    }

    def create() {
        respond new Tipo(params)
    }

    @Transactional
    def save(Tipo tipoInstance) {
        if (tipoInstance == null) {
            notFound()
            return
        }

        if (tipoInstance.hasErrors()) {
            respond tipoInstance.errors, view:'create'
            return
        }

        tipoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipo.label', default: 'Tipo'), tipoInstance.id])
                redirect tipoInstance
            }
            '*' { respond tipoInstance, [status: CREATED] }
        }
    }

    def edit(Tipo tipoInstance) {
        respond tipoInstance
    }

    @Transactional
    def update(Tipo tipoInstance) {
        if (tipoInstance == null) {
            notFound()
            return
        }

        if (tipoInstance.hasErrors()) {
            respond tipoInstance.errors, view:'edit'
            return
        }

        tipoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Tipo.label', default: 'Tipo'), tipoInstance.id])
                redirect tipoInstance
            }
            '*'{ respond tipoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Tipo tipoInstance) {

        if (tipoInstance == null) {
            notFound()
            return
        }

        tipoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Tipo.label', default: 'Tipo'), tipoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipo.label', default: 'Tipo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
