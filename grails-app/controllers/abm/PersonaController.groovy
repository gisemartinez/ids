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

    def index() {
    }

    def list(Integer max) {
        println(params)
        //Seteo el maximo a mostrar
        params.max = Math.min(max ?: 2, 100)
        params.offset = params.offset ?: 0
        params.query = params.query ?: ""
        params.sort = params.sort ?: "nombre"
        params.order = params.order ?: "asc"
        //Realizo la busqueda
        def listSinMaxNiOffset = personaService.getPersonasSegunPermiso(0,0,params.query)
        def listaConMaxYOffset = personaService.getPersonasSegunPermiso(params.max,params.offset,params.query)
        //Ordeno
        def listaOrdenada = personaService.ordenarLista(listaConMaxYOffset,params.sort,params.order)
        render(
            template:'list',
            model: [
                personaInstanceList:        listaOrdenada,
                personaInstanceCount:       listSinMaxNiOffset.size(),
                params:                     params
            ]
        )
    }

    def show(Persona personaInstance, User userInstance) {
        def roleInstance = personaService.getRolDePersona(personaInstance)
        respond personaInstance, model:[userInstance:userInstance, roleInstance : roleInstance]
    }

    def create() {
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
            respond new User(params),
             
                model:[personaInstance: new Persona(params),roleInstance: new Role(params),msg: e.getMessage()]
                view:'../../views/error'
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
            respond userInstance,
             model:[personaInstance: new Persona(params), roleInstance: new Role(params)], view:'edit'
        }
        
    }

    @Transactional
    def delete(Persona personaInstance) {
        try {
            personaService.borrar(personaInstance)
            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.deleted.message', args: [message(code: 'Persona.label', default: 'Persona'), personaInstance.apellido])
                    redirect action:"index", method:"GET"
                }
                '*'{ render status: NO_CONTENT }
            }
            
        }
        catch(Exception e) {
            println "error"
            println e
            request.withFormat {
                form multipartForm {
                    flash.message = e.getMessage()
                    redirect action:"index", method:"GET"
                }
                '*'{ render status: NO_CONTENT }
            }
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
