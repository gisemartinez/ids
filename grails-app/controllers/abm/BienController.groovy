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
        return springSecurityService.authentication.getAuthorities()
    }

    def index(Integer max) {
        //seteo el maximo a mostrar
        params.max = Math.min(max ?: 10, 100)
        //busco el id de User
        def idUserActual = springSecurityService.loadCurrentUser().id
        //con el id de User busco al id de la persona
        def idPersona = PersonaUser.findByUserId(idUserActual).personaId
        //con el id de la persona me fijo su rol 
        def idRole = UserRole.findByUser(User.findById(idUserActual)).role.id
        def rol = Role.findById(idRole).authority

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
        println(dameRol())
        params.max = Math.min(max ?: 10, 100)
        def idUserActual = springSecurityService.loadCurrentUser().id
        def idPersona = PersonaUser.findByUserId(idUserActual).personaId
        def idRole = UserRole.findByUser(User.findById(idUserActual)).role.id
        def rol = Role.findById(idRole).authority
        def estado = Estado.findByNombre("A Evaluar")
        respond bienesSegunEstado(mostrarBienesSegunRol(rol,idPersona),estado.id), model:[bienInstanceCount: Bien.count()] ,view:'index'
     
    }
    def estadoAreparar(Integer max) {
        //<<<--Comun a todos>>>
        params.max = Math.min(max ?: 10, 100)
        def idUserActual = springSecurityService.loadCurrentUser().id
        def idPersona = PersonaUser.findByUserId(idUserActual).personaId
        def idRole = UserRole.findByUser(User.findById(idUserActual)).role.id
        def rol = Role.findById(idRole).authority
        //<<diferente segun el estado que sea>>
        def estado = Estado.findByNombre("A Reparar")
        respond bienesSegunEstado(mostrarBienesSegunRol(rol,idPersona),estado.id), model:[bienInstanceCount: Bien.count()] ,view:'index'
     
    }
    def estadoEnUso(Integer max) {
        //<<<--Comun a todos>>>
        params.max = Math.min(max ?: 10, 100)
        def idUserActual = springSecurityService.loadCurrentUser().id
        def idPersona = PersonaUser.findByUserId(idUserActual).personaId
        def idRole = UserRole.findByUser(User.findById(idUserActual)).role.id
        def rol = Role.findById(idRole).authority
        //<<diferente segun el estado que sea>>
        def estado = Estado.findByNombre("En uso")
        respond bienesSegunEstado(mostrarBienesSegunRol(rol,idPersona),estado.id), model:[bienInstanceCount: Bien.count()] ,view:'index'
     
    }

    def estadoAdonacion(Integer max) {
        //<<<--Comun a todos>>>
        params.max = Math.min(max ?: 10, 100)
        def idUserActual = springSecurityService.loadCurrentUser().id
        def idPersona = PersonaUser.findByUserId(idUserActual).personaId
        def idRole = UserRole.findByUser(User.findById(idUserActual)).role.id
        def rol = Role.findById(idRole).authority
        //<<diferente segun el estado que sea>>
        def estado = Estado.findByNombre("A donacion")
        respond bienesSegunEstado(mostrarBienesSegunRol(rol,idPersona),estado.id), model:[bienInstanceCount: Bien.count()] ,view:'index'
     
    }
    def enviarMail(){
        def contenidoMail= "Venimos de Azul, vamos a Mar del Plata"
        def mail1 = "gise.cpna@gmail.com"
        def mail2 = "ayestaranguillermo@gmail.com"
        sendMail {
           to mail1, mail2
           from "patronus.ids@gmail.com"
           subject "Hello MAIL"
           text contenidoMail
        }
    }

    def estadoAdescarte(Integer max) {
        //<<<--Comun a todos>>>
        params.max = Math.min(max ?: 10, 100)
        def idUserActual = springSecurityService.loadCurrentUser().id
        def idPersona = PersonaUser.findByUserId(idUserActual).personaId
        def idRole = UserRole.findByUser(User.findById(idUserActual)).role.id
        def rol = Role.findById(idRole).authority
        //<<diferente segun el estado que sea>>
        def estado = Estado.findByNombre("A descarte")
        respond bienesSegunEstado(mostrarBienesSegunRol(rol,idPersona),estado.id), model:[bienInstanceCount: Bien.count()] ,view:'index'
     
    }

    def estadoBaja(Integer max) {
        //<<<--Comun a todos>>>
        params.max = Math.min(max ?: 10, 100)
        def idUserActual = springSecurityService.loadCurrentUser().id
        def idPersona = PersonaUser.findByUserId(idUserActual).personaId
        def idRole = UserRole.findByUser(User.findById(idUserActual)).role.id
        def rol = Role.findById(idRole).authority
        //<<diferente segun el estado que sea>>
        def estado = Estado.findByNombre("Baja")
        respond bienesSegunEstado(mostrarBienesSegunRol(rol,idPersona),estado.id), model:[bienInstanceCount: Bien.count()] ,view:'index'
     
    }
    def bienesSegunEstado(ArrayList listadoBienes, Long idEstado){
        return listadoBienes.findAll{it.estado.id == idEstado}

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
