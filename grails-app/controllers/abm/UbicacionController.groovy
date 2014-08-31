package abm



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class UbicacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Ubicacion.list(params), model:[ubicacionInstanceCount: Ubicacion.count()]
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
