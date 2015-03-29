package abm

import grails.transaction.Transactional
import com.testapp.User
import com.testapp.Role
import com.testapp.UserRole
@Transactional
class PersonaService {

 	//Si se le da el id del rol que se necesita, filtra por esa categoría
	ArrayList filtrarPersonasPorRol(def idRol){
	      def rol = idRol
	      def listaUsuarios = com.testapp.UserRole.findAll("from UserRole where role_id=?",[rol]).userId
	      def listaPersonas = abm.PersonaUser.findAllByUserId(listaUsuarios).personaId
	      return Persona.findAllById(listaPersonas)
	}
	//este método debéría ir en la clase PersonaUser o en User
	com.testapp.User getUserDePersona(personaInstance){
		def persona_user = PersonaUser.findByPersonaId(personaInstance.id)
		return com.testapp.User.findById(persona_user.userId)
	}
	long getIdPersonaSesionActual(idUserSesionActual){
        return  PersonaUser.findByUserId( idUserSesionActual ).personaId
    }
    //este método debéría ir en la clase UserRole o Role
	 
	com.testapp.Role getRolDePersona(personaInstance){
		def user = this.getUserDePersona(personaInstance)
		def role_id = com.testapp.UserRole.findByUser(user).roleId
		return com.testapp.Role.findById(role_id)
	}
	def guardar(Persona personaInstance,User userInstance,idRol){
		def roleInstance = Role.findById(idRol)
		if (personaInstance == null) {
            notFound()
            return
        }
        if (personaInstance.hasErrors()) {
            respond personaInstance.errors, view:'create'
            return
        }
        //--------lo mismo pero con el usuario--------
         if (userInstance == null) {
            notFound()
            return
        }
        if (userInstance.hasErrors()) {
            println "El usuario creado ya existe o tiene algún problema"
            respond userInstance.errors, view:'create'
            return
        }
        if (roleInstance == null) {
            notFound()
            println "Es un rol nulo!"
            return
        }
        if (roleInstance.hasErrors()) {
            println "El rol tiene algún problema"
            respond userInstance.errors, view:'create'
            return
        }
        
        if (userInstance.password != userInstance.confirmPassword){
            println "Error.Ingrese nuevamente la contraseña."
            respond userInstance.errors, view:'create'
            return
        }
        personaInstance.save flush:true
        userInstance.save flush:true
        //------por mas que sean IDs diferentes, la relacion se guarda igual
        UserRole.create userInstance, roleInstance, true
        //def relationUserRol = new UserRole(userInstance,roleInstance).save(flush:true)
        def relationPersonaUser = new PersonaUser(personaInstance,userInstance).save(flush:true)
        
    }
    def borrar(personaInstance){
        if (personaInstance == null) {
            notFound()
            return
        }
        //Declaré un método en la clase persona que devuelve el user
        def user = this.getUserDePersona(personaInstance)

        PersonaUser.findByPersonaId(personaInstance.id).delete flush:true
        UserRole.findByUser(user).delete flush:true

        personaInstance.delete flush:true
        user.delete flush:true
    }
    def actualizar(personaInstance,userInstance){
    	if (personaInstance == null) {
            notFound()
            return
        }

        if (personaInstance.hasErrors()) {
            respond personaInstance.errors, view:'edit'
            return
        }

        personaInstance.save flush:true
        userInstance.save flush:true
    }

}
