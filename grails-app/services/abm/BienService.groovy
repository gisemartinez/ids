package abm

import grails.transaction.Transactional
import com.testapp.Role
import com.testapp.User
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.gorm.*

@Transactional
class BienService {
	
    //-----Mails
    def GISE = "gise.cpna@gmail"
    def GUILLE = "ayestaranguillermo@gmail.com"
    def NAIR = "nair.olivera.utn@gmail.com"
    def ROMI = "romina.prada@gmail.com"
    def PATRONUS = "patronus.ids@gmail.com"

    //def springSecurityService
    def personaService
    def userService
    def roleService
    def estadoService

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

        if (roleService.nombreDelRolDeSesionActual() == roleService.getSupervisor()) {bienInstance.save flush:true}
        else {
            def usuario = userService.userSesionActual().username
            def cuerpoMail = "El usuario "+usuario+" ha intentado modificar el bien: "+bienInstance.descripcion+".\ncodigoPatrimonio: " +bienInstance.codigoPatrimonio+"\nnombreBien: "+bienInstance.nombreBien+"\ncodigoDeSerie: "+bienInstance.codigoDeSerie+"\ndescripcion: "+bienInstance.descripcion+"\nresponsableBien: "+bienInstance.responsableBien+"\ntipo: "+bienInstance.tipo+"\nubicacion: "+bienInstance.ubicacion.nombreubica+"\narea: "+bienInstance.area.nombrearea+"\nestado: "+bienInstance.estado.nombre+"\n"

            println(cuerpoMail)
            bienInstance.discard()
            //this.enviarMail(cuerpoMail,GUILLE)
            return
        }
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
           //cc GISE,GUILLE,ROMI,NAIR
           from PATRONUS
           subject "Patronus"
           text contenidoMail   
        }
    }
    def getBienesSegunPermiso(max, offset, query){
        // si el rol es Admin, traigo todos los bienes.En caso contrario, traigo los bienes que correspondan al area de la persona
        if (max == 0) {
            if (roleService.nombreDelRolDeSesionActual() == roleService.getSupervisor())
                return Bien.findAll("from Bien where (INSTR(nombreBien,?)>0 or INSTR(descripcion,?)>0 or INSTR(codigoPatrimonio,?)>0 or INSTR(codigoDeSerie,?)>0 or INSTR(fechaAlta,?)>0))",[query,query,query,query,query])
            else {
                def areaUser = Persona.findById(personaService.getIdPersonaSesionActual( userService.idUserSesionActual() )).area
                return Bien.findAll("from Bien where (INSTR(nombreBien,?)>0 or INSTR(descripcion,?)>0 or INSTR(codigoPatrimonio,?)>0 or INSTR(codigoDeSerie,?)>0 or INSTR(fechaAlta,?)>0)) and area_id = ?",[query,query,query,query,query,areaUser])
            }
        }
        else {
            if (roleService.nombreDelRolDeSesionActual() == roleService.getSupervisor())
                return Bien.findAll("from Bien where (INSTR(nombreBien,?)>0 or INSTR(descripcion,?)>0 or INSTR(codigoPatrimonio,?)>0 or INSTR(codigoDeSerie,?)>0  or INSTR(fechaAlta,?)>0))",[query,query,query,query,query],[max: max, offset: offset.toInteger()])
            else {
                def areaUser = Persona.findById(personaService.getIdPersonaSesionActual( userService.idUserSesionActual() )).area
                return Bien.findAll("from Bien where (INSTR(nombreBien,?)>0 or INSTR(descripcion,?)>0 or INSTR(codigoPatrimonio,?)>0 or INSTR(codigoDeSerie,?)>0 or INSTR(fechaAlta,?)>0)) and area_id = ?",[query,query,query,query,query,areaUser],[max: max, offset: offset.toInteger()])
            }
        }
    }

     def bienesSegunEstado(ArrayList listadoBienes, String nombreEstado){
        def estado = Estado.findByNombre(nombreEstado)
        return listadoBienes.findAll{it.estado.id == estado.id}
    }
    def bienesAEvaluar(){
        def listaAE = this.bienesSegunEstado(this.getBienesSegunPermiso(0,0,""), estadoService.getEstadoAEvaluar())
        return listaAE
    }

    def bienesEnUso(){
        def listaEU = this.bienesSegunEstado(this.getBienesSegunPermiso(0,0,""), estadoService.getEstadoEnUso())
        return listaEU
    }

    def bienesAReparar(){
        def listaAR = this.bienesSegunEstado(this.getBienesSegunPermiso(0,0,""), estadoService.getEstadoAReparar())
        return listaAR
    }
    
    def bienesADonacion(){
        def listaAD = this.bienesSegunEstado(this.getBienesSegunPermiso(0,0,""),  estadoService.getEstadoADonacion())
        return listaAD
    }

    def bienesADescarte(){
        def listaADs = this.bienesSegunEstado(this.getBienesSegunPermiso(0,0,""), estadoService.getEstadoADescarte())
        return listaADs
    }

    def bienesBaja(){
        def listaB = this.bienesSegunEstado(this.getBienesSegunPermiso(0,0,""), estadoService.getEstadoDeBaja() )
        return listaB
    }

    def ordenarLista(ArrayList lista, String ordenarPor, String orden){
        return lista.sort{
            a, b -> 
                if (orden == 'desc') {
                    b."${ordenarPor}" <=> a."${ordenarPor}"
                } else {
                    a."${ordenarPor}" <=> b."${ordenarPor}"
                }
        }
    }
}
