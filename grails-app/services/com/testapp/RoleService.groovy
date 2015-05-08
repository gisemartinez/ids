package com.testapp

import grails.transaction.Transactional
import com.testapp.User
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService

@Transactional
class RoleService {

	def springSecurityService

	def listado(){
		def ROLE_SUPERVISOR = "ROLE_SUPERVISOR"
		def ROLE_ENCARGADO = "ROLE_ENCARGADO"
		def ROLE_OPERARIO = "ROLE_OPERARIO"
		def rol = Role.permisoSesionActual(User.idRolSesionActual(springSecurityService.loadCurrentUser().id))
		switch(rol){
			case ROLE_SUPERVISOR:
				return Role.where{
					authority == ROLE_ENCARGADO ||
					authority == ROLE_OPERARIO
				}.findAll();
			break;
			case ROLE_ENCARGADO:
				return Estado.where{
					authority == ROLE_OPERARIO
				}.findAll();
			break;
			case ROLE_OPERARIO:
			break;
		}
    }
