package com.testapp

import grails.plugin.springsecurity.annotation.Secured

class SecureController {

   @Secured(['SUPERVISOR'])
   def index() {
      render 'Ud es un Administrador'
   }
}