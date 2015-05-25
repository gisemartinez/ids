package abm


import com.testapp.UserRole
import com.testapp.User
import com.testapp.Role
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.gorm.*


@Secured(['ROLE_SUPERVISOR','ROLE_ENCARGADO','ROLE_OPERARIO'])
@Transactional(readOnly = true)
class BienController {
     
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def personaService
    def bienService
 
    def estado() {
        println params.estado
        respond bienesAEvaluar(), model:[ bienInstanceCount: Bien.count()],view:'index';
    }    
    
    def index(Integer max) {
        //seteo el maximo a mostrar
        params.max = Math.min(max ?: 10, 100)
        respond bienService.mostrarBienesSegunPermiso(), model:[bienInstanceCount: Bien.count()] ,view:'index'
    }
    
    def busqueda(Integer max) {
        def query = params.query
        def bienList = bienService.buscarBienesPorQuery(query)
        if (bienList?.empty) {
            flash.message = "No se encontro ningun bien."
            redirect view:'index'
        } else {
            params.max = Math.min(max ?: 10, 100)
            respond bienList, model:[bienInstanceCount: Bien.count()],view:'index';
        }
    }    
    
    def estadoAevaluar(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond bienService.bienesAEvaluar(), model:[ bienInstanceCount: Bien.count()],view:'index';
    }
    def estadoAreparar(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond bienService.bienesAReparar(),model:[ bienInstanceCount: Bien.count()],view:'index'
    }
    def estadoEnUso(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond bienService.bienesEnUso(), model:[ bienInstanceCount: Bien.count()],view:'index'     
    }

    def estadoAdonacion(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond bienService.bienesADonacion(), model:[ bienInstanceCount: Bien.count()],view:'index'     
    }
    def estadoAdescarte(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond bienService.bienesADescarte() ,model:[ bienInstanceCount: Bien.count()],view:'index'     
     
    }
    def estadoBaja(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond bienService.bienesBaja(), model:[ bienInstanceCount: Bien.count()],view:'index'     
     
    }

    @Secured(['ROLE_SUPERVISOR','ROLE_ENCARGADO'])
    def grafico(){
        def opt =['#21AAFF', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6','#e6693e']
        render(
                view:'grafico',
                model:
                [
                    a: bienService.bienesAEvaluar().size(),
                    b: bienService.bienesEnUso().size(),
                    c: bienService.bienesAReparar().size(),
                    d: bienService.bienesADonacion().size(),
                    e: bienService.bienesADescarte().size(),
                    f: bienService.bienesBaja().size(), 
                    opt:opt
                ]
            );
    }
    def noticias(){
        //Es provisorio, debería traerme los de ésta semana
        //Debería estar puesto en el servicio
    render(
            view:'noticias',  
            model:
            [
               cantAE:bienService.bienesAEvaluar().size(),
                cantEU:bienService.bienesEnUso().size(),
                cantAR:bienService.bienesAReparar().size(),
                cantAD:bienService.bienesADonacion().size(),
                cantADsc:bienService.bienesADescarte().size(),
                cantB:bienService.bienesBaja().size()
            ]
        );

    }
    def show(Bien bienInstance) {
        respond bienInstance
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
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Bien.label', default: 'Bien'), bienInstance.nombreBien])
                redirect bienInstance
            }
            '*'{ respond bienInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Bien bienInstance) {
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
