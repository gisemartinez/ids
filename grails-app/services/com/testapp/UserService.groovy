package com.testapp

import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.gorm.*

@Transactional
class UserService {
	def springSecurityService
	def idUserSesionActual(){
        return springSecurityService.loadCurrentUser().id
    }
    def userSesionActual(){
        return springSecurityService.loadCurrentUser()
    }
}
