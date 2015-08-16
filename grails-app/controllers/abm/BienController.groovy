package abm

import com.testapp.UserRole
import com.testapp.User
import com.testapp.Role
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.gorm.*
import org.codehaus.groovy.grails.plugins.orm.auditable.AuditLogEvent

@Secured(['ROLE_SUPERVISOR','ROLE_ENCARGADO','ROLE_OPERARIO'])
@Transactional(readOnly = true)
class BienController {
     
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def personaService
    def bienService
    def roleService
    
    def index() {
    }

    def list(Integer max) {
        println(params)
        //Seteo el maximo a mostrar
        params.max = Math.min(max ?: 2, 100)
        params.offset = params.offset ?: 0
        params.query = params.query ?: ""
        params.sort = params.sort ?: "codigoDeSerie"
        params.order = params.order ?: "asc"
        //Realizo la busqueda
        def listSinMaxNiOffset = bienService.getBienesSegunPermiso(0,0,params.query)
        def listaConMaxYOffset = bienService.getBienesSegunPermiso(params.max,params.offset,params.query)
        //Ordeno
        def listaOrdenada = bienService.ordenarLista(listaConMaxYOffset,params.sort,params.order)
        render(
            template:'list',
            model: [
                bienInstanceList:       listaOrdenada,
                bienInstanceCount:      listSinMaxNiOffset.size(),
                params:                 params
            ]
        )
    }
    
    def noticias(){
        //Es provisorio, debería traerme los de ésta semana
        //Debería estar puesto en el servicio
        println("Refrescando las noticias")
        render(
            template:'noticias',  
            model:
            [
                cantAE:     bienService.bienesAEvaluar().size(),
                cantEU:     bienService.bienesEnUso().size(),
                cantAR:     bienService.bienesAReparar().size(),
                cantAD:     bienService.bienesADonacion().size(),
                cantADsc:   bienService.bienesADescarte().size(),
                cantB:      bienService.bienesBaja().size()
            ]
        );
    }

    def show(Bien bienInstance) {
        def cambios = AuditLogEvent.findAll('from AuditLogEvent where persistedObjectId = ? and propertyName = ?',[bienInstance.id.toString(),'estado'])
        
        respond bienInstance,
        model:
        [
            actores:        cambios.actor,
            fechas:         cambios.dateCreated,
            valoresNuevos:  cambios.newValue,
            cant:           cambios.size()
        ]
    }

    def create() {
        respond new Bien(params)
    }

    @Transactional
    def save(Bien bienInstance) {
        bienService.guardar(bienInstance)
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'bien.label', default: 'Bien'), bienInstance.nombreBien])
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
        bienService.actualizar(bienInstance)

        if (roleService.nombreDelRolDeSesionActual() == roleService.getSupervisor()) {
            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.updated.message', args: [message(code: 'Bien.label', default: 'Bien'), bienInstance.nombreBien])
                    redirect bienInstance
                }
                '*'{ respond bienInstance, [status: OK] }
            }
        }
        else {
            request.withFormat {
                form multipartForm {
                    flash.message = "Se ha enviado un mail al supervisor para que realice los cambios."
                    redirect bienInstance
                }
                '*'{ respond bienInstance, [status: OK] }
            }
        }
    }

    @Transactional
    def delete(Bien bienInstance) {
        bienService.borrar(bienInstance)
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Bien.label', default: 'Bien'), bienInstance.nombreBien])
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
