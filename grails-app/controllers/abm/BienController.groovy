package abm


import com.testapp.UserRole
import com.testapp.User
import com.testapp.Role
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.gorm.*

@Secured(['ROLE_ADMIN','ROLE_OPERADOR'])
@Transactional(readOnly = true)
class BienController {
     def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def permiso(){
        return Role.findById( idRol() ).authority
    }
     def idRol(){
        def idU = User.findById( idUser() )
        return  UserRole.findByUser( idU ).role.id
    }
    def idUser(){
        return springSecurityService.loadCurrentUser().id
    }
    def idPersona(){
        return  PersonaUser.findByUserId( idUser() ).personaId
    }

    def mostrarBienesSegunPermiso(){
        //--si el rol es Admin, traigo todos los bienes.En caso contrario,
        //traigo los bienes que correspondan al area de la persona
        if (permiso() == 'ROLE_ADMIN')
            return Bien.findAll()
        else{
            def areaUser = Persona.findById(idPersona()).area
            return Bien.findAllByArea(areaUser)
        }
    }
    def bienesSegunEstado(ArrayList listadoBienes, Long idEstado){
        return listadoBienes.findAll{it.estado.id == idEstado}
    }
    def index(Integer max) {
        //seteo el maximo a mostrar
        params.max = Math.min(max ?: 10, 100)
        respond mostrarBienesSegunPermiso(), model:[bienInstanceCount: Bien.count()] ,view:'index'
    }

    def estadoAevaluar(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def estado = Estado.findByNombre("A Evaluar")
        respond bienesSegunEstado(mostrarBienesSegunPermiso(), estado.id),model:[ bienInstanceCount: Bien.count()],view:'index'
    }
    def estadoAreparar(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def estado = Estado.findByNombre("A Reparar")
        respond bienesSegunEstado(mostrarBienesSegunPermiso(), estado.id),model:[ bienInstanceCount: Bien.count()],view:'index'
     
    }
    def estadoEnUso(Integer max) {
        //<<<--Comun a todos>>>
        params.max = Math.min(max ?: 10, 100)
        def estado = Estado.findByNombre("En uso")
        respond bienesSegunEstado(mostrarBienesSegunPermiso(), estado.id),model:[ bienInstanceCount: Bien.count()],view:'index'     
    }

    def estadoAdonacion(Integer max) {
        //<<<--Comun a todos>>>
        params.max = Math.min(max ?: 10, 100)
        def estado = Estado.findByNombre("A donacion")
        respond bienesSegunEstado(mostrarBienesSegunPermiso(), estado.id),model:[ bienInstanceCount: Bien.count()],view:'index'     
    }
    def estadoAdescarte(Integer max) {
        //<<<--Comun a todos>>>
        params.max = Math.min(max ?: 10, 100)
        def estado = Estado.findByNombre("A descarte")
        respond bienesSegunEstado(mostrarBienesSegunPermiso(), estado.id),model:[ bienInstanceCount: Bien.count()],view:'index'     
     
    }
    def estadoBaja(Integer max) {
        //<<<--Comun a todos>>>
        params.max = Math.min(max ?: 10, 100)
        def estado = Estado.findByNombre("Baja")
        respond bienesSegunEstado(mostrarBienesSegunPermiso(), estado.id),model:[ bienInstanceCount: Bien.count()],view:'index'     
     
    }
    def enviarMail(String contenidoMail, String destinatario){
        //def contenidoMail= "Se cambi&oacute el estado de un bien"
        //def mail1 = "gise.cpna@gmail.com"
       // def mail2 = "ayestaranguillermo@gmail.com"
        sendMail {
           to destinatario
           cc "gise.cpna@gmail","ayestaranguillermo@gmail.com","romina.prada@gmail.com","nair.olivera.utn@gmail.com"
           from "patronus.ids@gmail.com"
           subject "Patronus"
           text contenidoMail
        }
    }

  


 
    def contadorBienes(){
        def cantidad = Bien.count()
        respond "",model:[cantidad:cantidad] ,view:'index'
    }

    def contadorBienesAEvaluar(){
        def estadoAux = Estado.findByNombre("A Evaluar")
        def cantEstado = Bien.countByEstado(estadoAux)
        respond "",model:[cantEstado:cantEstado] ,view:'index'
    }

    def contadorBienesEnUso(){
        def estadoAux = Estado.findByNombre("En uso")
        def cantEstado5 = Bien.countByEstado(estadoAux)
        respond "",model:[cantEstado5:cantEstado5] ,view:'index'
    }

    def contadorBienesAReparar(){
        def estadoAux = Estado.findByNombre("A reparar")
        def cantEstado1 = Bien.countByEstado(estadoAux)
        respond "",model:[cantEstado1:cantEstado1] ,view:'index'
    }
    
    def contadorBienesADonacion(){
        def estadoAux = Estado.findByNombre("A donacion")
        def cantEstado2 = Bien.countByEstado(estadoAux)
        respond "",model:[cantEstado2:cantEstado2] ,view:'index'
    }

    def contadorBienesADescarte(){
        def estadoAux = Estado.findByNombre("A descarte")
        def cantEstado3 = Bien.countByEstado(estadoAux)
        respond "",model:[cantEstado3:cantEstado3] ,view:'index'
    }

    def contadorBienesBaja(){
        def estadoAux = Estado.findByNombre("Baja")
        def cantEstado4 = Bien.countByEstado(estadoAux)
        respond "",model:[cantEstado4:cantEstado4] ,view:'index'
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
 
        def cuerpoMail= "Se ha modificado el bien :"+bienInstance.descripcion+". \nSu estado cambi&oacute a &quote"+bienInstance.estado.nombre+"&quote"
            println(cuerpoMail)
       // enviarMail(cuerpoMail,"pmdisanti@gmail.com")

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
