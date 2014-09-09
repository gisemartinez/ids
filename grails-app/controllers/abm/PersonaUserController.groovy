package abm

import com.testapp.User

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PersonaUserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PersonaUser.list(params), model:[personaUserInstanceCount: PersonaUser.count()]
    }

    def show(PersonaUser personaUserInstance) {
        respond personaUserInstance
    }

    def create(Persona p,User u) {
        respond new PersonaUser(personaId:p, userId:u)
    }

    @Transactional
    def save(PersonaUser personaUserInstance) {
        if (personaUserInstance == null) {
            notFound()
            return
        }

        if (personaUserInstance.hasErrors()) {
            respond personaUserInstance.errors, view:'create'
            return
        }

        personaUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'personaUser.label', default: 'PersonaUser'), personaUserInstance.id])
                redirect personaUserInstance
            }
            '*' { respond personaUserInstance, [status: CREATED] }
        }
    }

    def edit(PersonaUser personaUserInstance) {
        respond personaUserInstance
    }

    @Transactional
    def update(PersonaUser personaUserInstance) {
        if (personaUserInstance == null) {
            notFound()
            return
        }

        if (personaUserInstance.hasErrors()) {
            respond personaUserInstance.errors, view:'edit'
            return
        }

        personaUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PersonaUser.label', default: 'PersonaUser'), personaUserInstance.id])
                redirect personaUserInstance
            }
            '*'{ respond personaUserInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PersonaUser personaUserInstance) {

        if (personaUserInstance == null) {
            notFound()
            return
        }

        personaUserInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PersonaUser.label', default: 'PersonaUser'), personaUserInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'personaUser.label', default: 'PersonaUser'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
