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

    def dameRol(){
        return springSecurityService.authentication.getPrincipal().getAuthorities()[0]
    }
    //queda probarlo despues para limpiar el codigo
    //buscar la persona de esta forma me asegura que busque la persona que está actualmente logueada
    /*
    def idUser(){
        return springSecurityService.loadCurrentUser().id
    }
    def idPersona(){
        return  PersonaUser.findByUserId( idUser() ).personaId
    }
    def idRol(){
        return  UserRole.findByUser( idUser() ).role.id
    }
    def permiso(){
        return Role.findById( idRol() ).authority
    }
  

    def mostrarBienesSegunPermiso(String permiso, Long idPersona){
        //--si el rol es Admin, traigo todos los bienes.En caso contrario,
        //traigo los bienes que correspondan al area de la persona
        if (permiso == 'ROLE_ADMIN')
            return Bien.findAll()
        else{
            def areaUser = Persona.findById(idPersona).area
            return Bien.findAllByArea(areaUser)
        }
    }
      
    def index(Integer max) {
        //seteo el maximo a mostrar
        params.max = Math.min(max ?: 10, 100)
        respond mostrarBienesSegunPermiso( idRol() ,idPersona()), model:[bienInstanceCount: Bien.count()] ,view:'index'
    }
    */

    def index(Integer max) {
        //seteo el maximo a mostrar
        params.max = Math.min(max ?: 10, 100)
        //busco el id de User
        def idUserActual = springSecurityService.loadCurrentUser().id
        //con el id de User busco al id de la persona
        def idPersona = PersonaUser.findByUserId(idUserActual).personaId
        //con el id de la persona me fijo su rol 
        def idRole = UserRole.findByUser(User.findById(idUserActual)).role.id
        String rol = Role.findById(idRole).authority

        //--si el rol es Admin, traigo todos los bienes.En caso contrario,
        //traigo los bienes que correspondan al area de la persona
        respond mostrarBienesSegunRol(rol,idPersona), model:[bienInstanceCount: Bien.count()] ,view:'index'
    }
    def mostrarBienesSegunRol(String rol, Long idPersona){
        if (rol == 'ROLE_ADMIN')
            return Bien.findAll()
        else{
            def areaUser = Persona.findById(idPersona).area
            return Bien.findAllByArea(areaUser)
        }
    }

    def estadoAevaluar(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def idUserActual = springSecurityService.loadCurrentUser().id
        def idPersona = PersonaUser.findByUserId(idUserActual).personaId
        String rol = dameRol()
        def estado = Estado.findByNombre("A Evaluar")
        respond bienesSegunEstado(mostrarBienesSegunRol(rol,idPersona),estado.id), model:[bienInstanceCount: Bien.count()] ,view:'index'
     
    }
    def estadoAreparar(Integer max) {
        //<<<--Comun a todos>>>
        params.max = Math.min(max ?: 10, 100)
        def idUserActual = springSecurityService.loadCurrentUser().id
        def idPersona = PersonaUser.findByUserId(idUserActual).personaId
        String rol = dameRol()
        //<<diferente segun el estado que sea>>
        def estado = Estado.findByNombre("A Reparar")
        respond bienesSegunEstado(mostrarBienesSegunRol(rol,idPersona),estado.id), model:[bienInstanceCount: Bien.count()] ,view:'index'
     
    }
    def estadoEnUso(Integer max) {
        //<<<--Comun a todos>>>
        params.max = Math.min(max ?: 10, 100)
        def idUserActual = springSecurityService.loadCurrentUser().id
        def idPersona = PersonaUser.findByUserId(idUserActual).personaId
        String rol = dameRol()
        //<<diferente segun el estado que sea>>
        def estado = Estado.findByNombre("En uso")
        respond bienesSegunEstado(mostrarBienesSegunRol(rol,idPersona),estado.id), model:[bienInstanceCount: Bien.count()] ,view:'index'
     
    }

    def estadoAdonacion(Integer max) {
        //<<<--Comun a todos>>>
        params.max = Math.min(max ?: 10, 100)
         def idUserActual = springSecurityService.loadCurrentUser().id
        def idPersona = PersonaUser.findByUserId(idUserActual).personaId
        String rol = dameRol()
        //<<diferente segun el estado que sea>>
        def estado = Estado.findByNombre("A donacion")
        respond bienesSegunEstado(mostrarBienesSegunRol(rol,idPersona),estado.id), model:[bienInstanceCount: Bien.count()] ,view:'index'
     
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

    def estadoAdescarte(Integer max) {
        //<<<--Comun a todos>>>
        params.max = Math.min(max ?: 10, 100)
        def idUserActual = springSecurityService.loadCurrentUser().id
        def idPersona = PersonaUser.findByUserId(idUserActual).personaId
        String rol = dameRol()
        //<<diferente segun el estado que sea>>
        def estado = Estado.findByNombre("A descarte")
        respond bienesSegunEstado(mostrarBienesSegunRol(rol,idPersona),estado.id), model:[bienInstanceCount: Bien.count()] ,view:'index'
     
    }

    def estadoBaja(Integer max) {
        //<<<--Comun a todos>>>
        params.max = Math.min(max ?: 10, 100)
        def idUserActual = springSecurityService.loadCurrentUser().id
        def idPersona = PersonaUser.findByUserId(idUserActual).personaId
        String rol = dameRol()
        //<<diferente segun el estado que sea>>
        def estado = Estado.findByNombre("Baja")
        respond bienesSegunEstado(mostrarBienesSegunRol(rol,idPersona),estado.id), model:[bienInstanceCount: Bien.count()] ,view:'index'
     
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
