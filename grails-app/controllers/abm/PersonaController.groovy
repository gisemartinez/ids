package abm


import com.testapp.User
import com.testapp.Role
import com.testapp.UserRole
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_SUPERVISOR'])
@Transactional(readOnly = true)
class PersonaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Persona.list(params), model:[personaInstanceCount: Persona.count()]
    }

    def show(Persona personaInstance) {
        respond personaInstance
    }

    def create() {

        //respond new Persona(params.nombre,params.apellido,params.dni,params.username,params.password)
        respond new Persona(params), model:[userInstance:new User(params)]
    }

    @Transactional
    def save(Persona personaInstance, User userInstance) {
        def roleInstance = Role.findById(params.role.id)
        if (personaInstance == null) {
            notFound()
            return
        }
        if (personaInstance.hasErrors()) {
            respond personaInstance.errors, view:'create'
            return
        }
        //--------lo mismo pero con el usuario--------
         if (userInstance == null) {
            notFound()
            return
        }
        if (userInstance.hasErrors()) {
            println "El usuario creado ya existe o tiene algún problema"
            respond userInstance.errors, view:'create'
            return
        }
        if (roleInstance == null) {
            notFound()
            println "Es un rol nulo!"
            return
        }
        if (roleInstance.hasErrors()) {
            println "El rol tiene algún problema"
            respond userInstance.errors, view:'create'
            return
        }
        
        if (userInstance.password != userInstance.confirmPassword){
            println "Error.Ingrese nuevamente la contraseña."
            respond userInstance.errors, view:'create'
            return
        }
        
        //-------guardo ambas instancias y guardo la relacion entre ambas
        personaInstance.save flush:true
        userInstance.save flush:true
        //------por mas que sean IDs diferentes, la relacion se guarda igual
        UserRole.create userInstance, roleInstance, true
        //def relationUserRol = new UserRole(userInstance,roleInstance).save(flush:true)
        def relationPersonaUser = new PersonaUser(personaInstance,userInstance).save(flush:true)
        
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'persona.created.message', args: [message(code: 'persona.label', default: 'Persona')])
                redirect personaInstance
            }
            '*' { respond personaInstance, [status: CREATED] }
        }
    }

    def edit(Persona personaInstance,User userInstance) {
        def roleInstance = Persona.getRol(personaInstance)
        respond personaInstance, model:[userInstance: userInstance,roleInstance:roleInstance]
    }

    @Transactional
    def update(Persona personaInstance, User userInstance) {
        if (personaInstance == null) {
            notFound()
            return
        }

        if (personaInstance.hasErrors()) {
            respond personaInstance.errors, view:'edit'
            return
        }

        personaInstance.save flush:true
        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Persona.label', default: 'Persona'), personaInstance.id])
                redirect personaInstance
            }
            '*'{ respond personaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Persona personaInstance) {

        if (personaInstance == null) {
            notFound()
            return
        }
        //Declaré un método en la clase persona que devuelve el user
        def user = Persona.getUser(personaInstance)

        PersonaUser.findByPersonaId(personaInstance.id).delete flush:true
        UserRole.findByUser(user).delete flush:true

        personaInstance.delete flush:true
        user.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Persona.label', default: 'Persona'), personaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
