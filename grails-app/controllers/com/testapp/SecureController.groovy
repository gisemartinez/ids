package com.testapp

import grails.plugin.springsecurity.annotation.Secured

class SecureController {

   @Secured(['ROLE_SUPERVISOR'])
   def index() {
      render 'Ud es un Supervisor'
   }
}