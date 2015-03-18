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

    def springSecurityService
    //>>>Constantes<<<//

    //-----Estados------//
    def A_EVALUAR = "A Evaluar"
    def EN_USO = "En uso"
    def A_REPARAR = "A Reparar"
    def A_DONACION = "A donacion"
    def A_DESCARTE = "A descarte"
    def DE_BAJA = "Baja"
    //-----Roles----//
    def ROLE_SUPERVISOR = "ROLE_SUPERVISOR"
    def ROLE_ENCARGADO = "ROLE_ENCARGADO"
    def ROLE_OPERARIO = "ROLE_OPERARIO"
    //-----Mails
    def GISE = "gise.cpna@gmail"
    def GUILLE = "ayestaranguillermo@gmail.com"
    def NAIR = "nair.olivera.utn@gmail.com"
    def ROMI = "romina.prada@gmail.com"
    def PATRONUS = "patronus.ids@gmail.com"

    
    def idUserSesionActual(){
        return springSecurityService.loadCurrentUser().id
    }

    def mostrarBienesSegunPermiso(){

        //--si el rol es Admin, traigo todos los bienes.En caso contrario,
        //traigo los bienes que correspondan al area de la persona
        if (
            Role.permisoSesionActual( 
                User.idRolSesionActual(
                    idUserSesionActual()
                    )
                 )
            == 
            ROLE_SUPERVISOR)

            return Bien.findAll()
        else{
            def areaUser = Persona.findById(Persona.getIdPersonaSesionActual( idUserSesionActual() )).area
            return Bien.findAllByArea(areaUser)
        }
    }
    def bienesSegunEstado(ArrayList listadoBienes, String nombreEstado){
        def estado = Estado.findByNombre(nombreEstado)
        return listadoBienes.findAll{it.estado.id == estado.id}
    }
    def contadorBienes(){
        def lista = (mostrarBienesSegunPermiso()).size()
        return lista
    }
    def estado() {
        println params.estado
        respond bienesAEvaluar(), model:[ bienInstanceCount: Bien.count()],view:'index';
    }



//redundancia
    def bienesAEvaluar(){
        def listaAE = bienesSegunEstado(mostrarBienesSegunPermiso(), A_EVALUAR)
        return listaAE
    }

    def bienesEnUso(){
        def listaEU = bienesSegunEstado(mostrarBienesSegunPermiso(), EN_USO)
        return listaEU
    }

    def bienesAReparar(){
        def listaAR = bienesSegunEstado(mostrarBienesSegunPermiso(), A_REPARAR)
        return listaAR
    }
    
    def bienesADonacion(){
        def listaAD = bienesSegunEstado(mostrarBienesSegunPermiso(),  A_DONACION)
        return listaAD
    }

    def bienesADescarte(){
        def listaADs = bienesSegunEstado(mostrarBienesSegunPermiso(), A_DESCARTE)
        return listaADs
    }

    def bienesBaja(){
        def listaB = bienesSegunEstado(mostrarBienesSegunPermiso(), DE_BAJA )
        return listaB
    }
    
    def index(Integer max) {
        //seteo el maximo a mostrar
        params.max = Math.min(max ?: 10, 100)
        respond mostrarBienesSegunPermiso(), model:[bienInstanceCount: Bien.count()] ,view:'index'
    }
    
    def busqueda(Integer max) {
        def query = params.query
        def bienList
        if (
            Role.permisoSesionActual( 
                User.idRolSesionActual(
                    idUserSesionActual()
                    )
                 )
            == 
            ROLE_SUPERVISOR)
            bienList = Bien.findAll("from Bien where INSTR(nombreBien,?)>0",[query])
        else{
            def areaUser = Persona.findById(Persona.getIdPersonaSesionActual( idUserSesionActual() )).area
            bienList = Bien.findAll("from Bien where INSTR(nombreBien,?)>0 and area_id = ?",[query,areaUser])
        }
        params.max = Math.min(max ?: 10, 100)
        respond bienList, model:[ bienInstanceCount: Bien.count()],view:'index';
    }    
    
    def estadoAevaluar(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond bienesAEvaluar(), model:[ bienInstanceCount: Bien.count()],view:'index';
    }
    def estadoAreparar(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond bienesAReparar(),model:[ bienInstanceCount: Bien.count()],view:'index'
    }
    def estadoEnUso(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond bienesEnUso(), model:[ bienInstanceCount: Bien.count()],view:'index'     
    }

    def estadoAdonacion(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond bienesADonacion(), model:[ bienInstanceCount: Bien.count()],view:'index'     
    }
    def estadoAdescarte(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond bienesADescarte() ,model:[ bienInstanceCount: Bien.count()],view:'index'     
     
    }
    def estadoBaja(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond bienesBaja(), model:[ bienInstanceCount: Bien.count()],view:'index'     
     
    }
    def enviarMail(String contenidoMail, String destinatario){ 
        sendMail {
           to destinatario
           cc GISE,GUILLE,ROMI,NAIR
           from PATRONUS
           subject "Patronus"
           text contenidoMail   
        }
    }
    
    @Secured(['ROLE_SUPERVISOR','ROLE_ENCARGADO'])
    def grafico(){
            def a = bienesAEvaluar().size()
            def b = bienesEnUso().size()
            def c = bienesAReparar().size()
            def d = bienesADonacion().size()
            def e = bienesADescarte().size()
            def f = bienesBaja().size()  
        
        def opt =['#21AAFF', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6','#e6693e']
        render(view:'grafico' ,model:[a:a,b:b,c:c,d:d,e:e,f:f,opt:opt])
    }
    def noticias(){
        //Es provisorio, debería traerme los de ésta semana
        def cantAE = bienesAEvaluar().size()
        def cantEU = bienesEnUso().size()
        def cantAR = bienesAReparar().size()
        def cantAD = bienesADonacion().size()
        def cantADsc = bienesADescarte().size()
        def cantB = bienesBaja().size()
    render(
            view:'noticias',  
            model:
            [
                cantAE:cantAE,
                cantEU:cantEU,
                cantAR:cantAR,
                cantAD:cantAD,
                cantADsc:cantADsc,
                cantB:cantB
            ]
        )

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
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Bien.label', default: 'Bien'), bienInstance.nombreBien])
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
