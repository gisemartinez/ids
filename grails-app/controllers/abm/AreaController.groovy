package abm



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['SUPERVISOR'])
@Transactional(readOnly = true)
class AreaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Area.list(params), model:[areaInstanceCount: Area.count()]
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
