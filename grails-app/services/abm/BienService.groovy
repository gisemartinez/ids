package abm

import grails.transaction.Transactional
import com.testapp.Role
import com.testapp.User
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.gorm.*

@Transactional
class BienService {
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

    def springSecurityService
    def personaService

    def idUserSesionActual(){
        return springSecurityService.loadCurrentUser().id
    }
    def guardar(bienInstance){
    	if (bienInstance == null) {
            notFound()
            return
        }

        if (bienInstance.hasErrors()) {
            respond bienInstance.errors, view:'create'
            return
        }

        bienInstance.save flush:true

    }
    def actualizar(bienInstance){
    	if (bienInstance == null) {
            notFound()
            return
        }

        if (bienInstance.hasErrors()) {
            respond bienInstance.errors, view:'edit'
            return
        }

        bienInstance.save flush:true
 
        def cuerpoMail = "Se ha modificado el bien :"+bienInstance.descripcion+". \nSu estado cambi&oacute a &quote"+bienInstance.estado.nombre+"&quote";
            println(cuerpoMail)
       //this.enviarMail(cuerpoMail,"pmdisanti@gmail.com")

    }
    def borrar(bienInstance){
    	if (bienInstance == null) {
            notFound()
            return
        }
        bienInstance.delete flush:true
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
    def buscarBienesPorQuery(query){
    	if (
            Role.permisoSesionActual( 
                User.idRolSesionActual(
                    this.idUserSesionActual()
                    )
                 )
            == 
            ROLE_SUPERVISOR)
            return Bien.findAll("from Bien where INSTR(nombreBien,?)>0",[query])
        else{
            def areaUser = Persona.findById(personaService.getIdPersonaSesionActual( this.idUserSesionActual() )).area
            return Bien.findAll("from Bien where INSTR(nombreBien,?)>0 and area_id = ?",[query,areaUser])
        }
    }
    def mostrarBienesSegunPermiso(){
        //--si el rol es Admin, traigo todos los bienes.En caso contrario,
        //traigo los bienes que correspondan al area de la persona
        if (Role.permisoSesionActual( 
	                User.idRolSesionActual(
	                    idUserSesionActual()
	                    )
	                 )
            == 
        	ROLE_SUPERVISOR)
           
            return Bien.findAll()
        else{
            def areaUser = Persona.findById(personaService.getIdPersonaSesionActual( idUserSesionActual() )).area
            return Bien.findAllByArea(areaUser)
        }
    }
     def bienesSegunEstado(ArrayList listadoBienes, String nombreEstado){
        def estado = Estado.findByNombre(nombreEstado)
        return listadoBienes.findAll{it.estado.id == estado.id}
    }
    def bienesAEvaluar(){
        def listaAE = this.bienesSegunEstado(this.mostrarBienesSegunPermiso(), A_EVALUAR)
        return listaAE
    }

    def bienesEnUso(){
        def listaEU = this.bienesSegunEstado(this.mostrarBienesSegunPermiso(), EN_USO)
        return listaEU
    }

    def bienesAReparar(){
        def listaAR = this.bienesSegunEstado(this.mostrarBienesSegunPermiso(), A_REPARAR)
        return listaAR
    }
    
    def bienesADonacion(){
        def listaAD = this.bienesSegunEstado(this.mostrarBienesSegunPermiso(),  A_DONACION)
        return listaAD
    }

    def bienesADescarte(){
        def listaADs = this.bienesSegunEstado(this.mostrarBienesSegunPermiso(), A_DESCARTE)
        return listaADs
    }

    def bienesBaja(){
        def listaB = this.bienesSegunEstado(this.mostrarBienesSegunPermiso(), DE_BAJA )
        return listaB
    }


  
}
