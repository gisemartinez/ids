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
    def personaService
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
        try {
            personaService.guardar(personaInstance,userInstance,params.role.id)
            
            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'persona.created.message', args: [message(code: 'persona.label', default: 'Persona'), personaInstance.apellido])
                    redirect personaInstance
                }
                '*' { respond personaInstance, [status: CREATED] }
            }
            
        }
        catch(Exception e) {
            //println "Estoy fallando"
            //println params
            respond new User(params), model:[personaInstance: new Persona(params), roleInstance: new Role(params)], view:'index'
        }
        
    }

    def edit(Persona personaInstance,User userInstance) {
        try {
            def roleInstance = personaService.getRolDePersona(personaInstance)
        respond personaInstance, model:[userInstance: userInstance,roleInstance:roleInstance]
        }
        catch(Exception e) {
            println "Exception edit"
            println e
        }
        
        
    }

    @Transactional
    def update(Persona personaInstance, User userInstance) {
        try {
            println personaInstance
            println userInstance
            println "Rol id: " + params.role.id
            personaService.actualizar(personaInstance,userInstance,params.role.id)

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.updated.message', args: [message(code: 'Persona.label', default: 'Persona'), personaInstance.apellido])
                    redirect personaInstance
                }
                '*'{ respond personaInstance, [status: OK] }
            }
            
        }
        catch(Exception e) {
            println "Exception update"
            println e
            respond userInstance, model:[personaInstance: new Persona(params), roleInstance: new Role(params)], view:'edit'
        }
        
    }

    @Transactional
    def delete(Persona personaInstance) {
        personaService.borrar(personaInstance)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Persona.label', default: 'Persona'), personaInstance.apellido])
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
