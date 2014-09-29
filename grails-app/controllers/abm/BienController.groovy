package abm



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class BienController {
     def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def idUserActual = springSecurityService.loadCurrentUser().id
        def idPersona = PersonaUser.findByUserId(idUserActual).personaId
        def areaUser = Persona.findById(idPersona).area
        params.max = Math.min(max ?: 10, 100)
        //modificar con esto,para que el admin pueda acceder a todos los bienes
        /*if(RoleAdmin){
             respond Bien.list(params), model:[bienInstanceCount: Bien.count()]

            }else{
             respond Bien.findAllByArea(areaUser), model:[bienInstanceCount: Bien.count()]

            }
        */
        respond Bien.findAllByArea(areaUser), model:[bienInstanceCount: Bien.count()]
    }

    def show(Bien bienInstance) {
        respond bienInstance
    }

    def create() {
        respond new Bien(params)
    }

    @Transactional
    def save(Bien bienInstance) {
        if (bienInstance == null) {
            notFound()
            return
        }

        if (bienInstance.hasErrors()) {
            respond bienInstance.errors, view:'create'
            return
        }

        bienInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'bien.label', default: 'Bien'), bienInstance.id])
                redirect bienInstance
            }
            '*' { respond bienInstance, [status: CREATED] }
        }
    }

    def edit(Bien bienInstance) {
        respond bienInstance
    }

    @Transactional
    def update(Bien bienInstance) {
        if (bienInstance == null) {
            notFound()
            return
        }

        if (bienInstance.hasErrors()) {
            respond bienInstance.errors, view:'edit'
            return
        }

        bienInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Bien.label', default: 'Bien'), bienInstance.id])
                redirect bienInstance
            }
            '*'{ respond bienInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Bien bienInstance) {

        if (bienInstance == null) {
            notFound()
            return
        }

        bienInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Bien.label', default: 'Bien'), bienInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'bien.label', default: 'Bien'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
