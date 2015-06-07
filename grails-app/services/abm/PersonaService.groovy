package abm

import grails.transaction.Transactional
import com.testapp.User
import com.testapp.Role
import com.testapp.UserRole
import grails.validation.ValidationException
@Transactional
class PersonaService {

    def userService
    def roleService

    // <<<ERRORES>>
    def SE_HA_GUARDADO_CON_ERRORES = "se ha guardado con errores"
    def CONTRASENIAS_DIFF = "Las contraseñas son diferentes"
    def USUARIO_IMPOSIBLE_DE_BORRAR = "El usuario que intenta borrar es el usuario dueño de ésta sesión"
    def TIENE_MISMO_ROL = "El usuario que intenta borrar posee el mismo rol que ústed"
    def TIENE_BIENES_ASOCIADOS = "El usuario que intenta borrar posee bienes bajo su responsabilidad"
    
 	//Si se le da el id del rol que se necesita, filtra por esa categoría
	ArrayList filtrarPersonasPorRol(def idRol){
	      def rol = idRol
	      def listaUsuarios = UserRole.findAll("from UserRole where role_id=?",[rol]).userId
	      def listaPersonas = PersonaUser.findAll("from UserRole where user_id in (:usuarios)",[usuarios: listaUsuarios]).userId
	      return Persona.findAll("from Persona where id in (:personas)",[personas: listaPersonas])	      
	}
	//este método debéría ir en la clase PersonaUser o en User
	User getUserDePersona(personaInstance){
		def persona_user = PersonaUser.findByPersonaId(personaInstance.id)
		return User.findById(persona_user.userId)
	}
	long getIdPersonaSesionActual(idUserSesionActual){
        return  PersonaUser.findByUserId( idUserSesionActual ).personaId
    }
    //este método debéría ir en la clase UserRole o Role
	 
	Role getRolDePersona(personaInstance){
		def user = this.getUserDePersona(personaInstance)
        println user
		def role_id = UserRole.findByUser(user).roleId
		return Role.findById(role_id)
	}
    def actualizarRolDeUsuario(idRol,userInstance){
        //busco y elimino el par UsuarioRol
        def u_r = UserRole.findByUser(com.testapp.User.findById(userInstance.id))
        u_r.delete()
        def r = Role.findById(idRol)
        //creo un par UsuarioRol nuevo
        UserRole.create userInstance, r , true
     }

    def crear(Persona personaInstance,User userInstance,idRol){

    }
	def guardar(Persona personaInstance,User userInstance,idRol){
		def roleInstance = Role.findById(idRol)
		if (personaInstance == null) {
            notFound()
            return
        }
        if (personaInstance.hasErrors()) {
            //respond personaInstance.errors, view:'create'
            throw new RuntimeException("La Persona"+ SE_HA_GUARDADO_CON_ERRORES, personaInstance.errors)
            return
        }
        //--------lo mismo pero con el usuario--------
         if (userInstance == null) {
            notFound()
            return
        }
        if (userInstance.hasErrors()) {
            //respond userInstance.errors, view:'create'
            throw new RuntimeException("El usuario"+ SE_HA_GUARDADO_CON_ERRORES, userInstance.errors)
            return
        }
        
        if (userInstance.password != userInstance.confirmPassword){

            //respond userInstance.errors, view:'create'
            throw new RuntimeException(CONTRASENIAS_DIFF, userInstance.errors)
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
           throw new RuntimeException("Persona inexistente")
        }
            
        def userInstance = this.getUserDePersona(personaInstance) 
        //el usuario a eliminar es el de la sesión iniciada?
        if( userService.idUserSesionActual() == userInstance.id){
            //log.Error "Son usuarios con un mismo rol "

            throw new RuntimeException(USUARIO_IMPOSIBLE_DE_BORRAR)

        }
        //Comparten el rol?
        if (roleService.roleIgualAlDeLaSesionActual(userInstance.id)){

            throw new RuntimeException(TIENE_MISMO_ROL)

        } else {
            //tiene permisos para ésta operacion?
            if (roleService.roleEsDeMenorJerarquia(userInstance.id)) {
                PersonaUser.findByPersonaId(personaInstance.id).delete flush:true
                UserRole.findByUser(userInstance).delete flush:true
                personaInstance.delete flush:true
                userInstance.delete flush:true
            } else {
                throw new RuntimeException(NO_POSEE_LOS_PERMISOS_NECESARIOS)
            }
        }
    
    }
    def actualizar(personaInstance,userInstance,idRol){
        def roleInstance = Role.findById(idRol)
        if (personaInstance == null) {
            notFound()
            return
        }
        if (personaInstance.hasErrors()) {
            //respond personaInstance.errors, view:'create'
            throw new RuntimeException("La Persona"+ SE_HA_GUARDADO_CON_ERRORES, personaInstance.errors)
            return
        }
        //--------lo mismo pero con el usuario--------
         if (userInstance == null) {
            notFound()
            return
        }
        if (userInstance.hasErrors()) {
            //respond userInstance.errors, view:'create'
            throw new RuntimeException("El usuario"+ SE_HA_GUARDADO_CON_ERRORES, userInstance.errors)
            return
        }
        
        if (userInstance.password != userInstance.confirmPassword){

            //respond userInstance.errors, view:'create'
            throw new RuntimeException(CONTRASENIAS_DIFF, userInstance.errors)
            return
        }
        personaInstance.save flush:true
        userInstance.save flush:true
        this.actualizarRolDeUsuario(idRol,userInstance)
        
        //------por mas que sean IDs diferentes, la relacion se guarda igual
        //UserRole.create userInstance, roleInstance, true
        //def relationUserRol = new UserRole(userInstance,roleInstance).save(flush:true)
        //def relationPersonaUser = new PersonaUser(personaInstance,userInstance).save(flush:true)

    	/*if (personaInstance == null) {
            notFound()
            return
        }

        if (personaInstance.hasErrors()) {
            //respond personaInstance.errors, view:'edit'
            throw new ValidationException("Error en la actualizacion", userInstance.errors)
            return
        }

        personaInstance.save flush:true
        userInstance.save flush:true*/
    }

}
