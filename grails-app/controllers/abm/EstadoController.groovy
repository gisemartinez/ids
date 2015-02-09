package abm



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['SUPERVISOR'])
@Transactional(readOnly = true)
class EstadoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Estado.list(params), model:[estadoInstanceCount: Estado.count()]
    }

    def show(Estado estadoInstance) {
        respond estadoInstance
    }

    def create() {
        respond new Estado(params)
    }

    @Transactional
    def save(Estado estadoInstance) {
        if (estadoInstance == null) {
            notFound()
            return
        }

        if (estadoInstance.hasErrors()) {
            respond estadoInstance.errors, view:'create'
            return
        }

        estadoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'estado.label', default: 'Estado'), estadoInstance.id])
                redirect estadoInstance
            }
            '*' { respond estadoInstance, [status: CREATED] }
        }
    }

    def edit(Estado estadoInstance) {
        respond estadoInstance
    }

    @Transactional
    def update(Estado estadoInstance) {
        if (estadoInstance == null) {
            notFound()
            return
        }

        if (estadoInstance.hasErrors()) {
            respond estadoInstance.errors, view:'edit'
            return
        }

        estadoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Estado.label', default: 'Estado'), estadoInstance.id])
                redirect estadoInstance
            }
            '*'{ respond estadoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Estado estadoInstance) {

        if (estadoInstance == null) {
            notFound()
            return
        }

        estadoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Estado.label', default: 'Estado'), estadoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'estado.label', default: 'Estado'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
