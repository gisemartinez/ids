package com.testapp

import grails.transaction.Transactional
import com.testapp.User
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService

@Transactional
class RoleService {

	def springSecurityService
	def userService
	def ROLE_SUPERVISOR = "ROLE_SUPERVISOR"
	def ROLE_ENCARGADO = "ROLE_ENCARGADO"
	def ROLE_OPERARIO = "ROLE_OPERARIO"

	def getSupervisor(){
		return ROLE_SUPERVISOR
	}
	def getEncargado(){
		return ROLE_ENCARGADO
	}
	def getOperario(){
		return ROLE_OPERARIO
	}
	def listado(){
		def rol = this.nombreDelRolDeSesionActual()
		
		switch(rol){
			//creo que están desordenados los roles. Revisar. 
			case this.getSupervisor() :
				return Role.where{
					authority == ROLE_ENCARGADO ||
					authority == ROLE_OPERARIO
				}.findAll();
			break;
			case this.getEncargado() :
				return Estado.where{
					authority == ROLE_OPERARIO
				}.findAll();
			break;
			case this.getOperario() :
			break;
		}
    }
    def nombreDelRolDeSesionActual(){
    	this.nombreRol(
    		this.idRolDeUser(
    			userService.idUserSesionActual()
    			)
    		)
    }
    def nombreRol ( idRol ){
        return Role.findById( idRol ).authority
    }
    def idRolDeUser(idUser){
        def idU = User.findById( idUser )
        return  UserRole.findByUser( idU ).role.id
    }
    def roleIgualAlDeLaSesionActual(idUser){
    	    this.nombreDelRolDeSesionActual() == this.nombreRol(this.idRolDeUser(idUser))
    }
    def roleEsDeMenorJerarquia(idUser){

    	def rolIdUSer = this.nombreRol(this.idRolDeUser(idUser))
    	//Si el dueño de la sesión es supervisor, devolverá true para cualquier user operario o encargado
    	if (this.nombreDelRolDeSesionActual() == this.getSupervisor() ){
    		//El user en cuestion es operario o encargado?
    		return  this.getOperario() == rolIdUSer || this.getEncargado() == rolIdUSer

    		}
    	//Si el dueño de la sesión es encargado, devolverá true para los user operarios
    	if (this.nombreDelRolDeSesionActual == this.getEncargado()){
    		//El user en cuestion es operario?
    		return this.getOperario() == rolIdUSer 
    		}
    	/*Si hubiese un admin general sería:
		if (this.nombreDelRolDeSesionActual() == this.getAdmin() ){
    		//El user en cuestion es operario, encargado o supervisor?
    		return  this.getOperario() == rolIdUSer || this.getEncargado() == rolIdUSer || this.getSupervisor() == rolIdUSer

    		}


    	*/
    }

}
