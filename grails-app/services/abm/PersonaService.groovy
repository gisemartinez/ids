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

    def getNombrePersonaSesionActual(){
        def persona = Persona.findById(getIdPersonaSesionActual())
        return (persona.nombre +" "+ persona.apellido)
    }

    def getPersonasSegunPermiso(int max, offset, query){
        if (max == 0) {
            if (roleService.nombreDelRolDeSesionActual() == roleService.getSupervisor())
                return Persona.findAll("from Persona where (INSTR(nombre,?)>0 or INSTR(apellido,?)>0 or INSTR(dni,?)>0 or INSTR(fechaAlta,?)>0))",[query,query,query,query])
            else {
                def areaUser = Persona.findById(personaService.getIdPersonaSesionActual()).area
                return Persona.findAll("from Persona where (INSTR(nombre,?)>0 or INSTR(apellido,?)>0 or INSTR(dni,?)>0 or INSTR(fechaAlta,?)>0)) and area_id = ?",[query,query,query,query,areaUser])
            }
        }
        else {
            if (roleService.nombreDelRolDeSesionActual() == roleService.getSupervisor())
                return Persona.findAll("from Persona where (INSTR(nombre,?)>0 or INSTR(apellido,?)>0 or INSTR(dni,?)>0 or INSTR(fechaAlta,?)>0))",[query,query,query,query],[max: max, offset: offset.toInteger()])
            else {
                def areaUser = Persona.findById(personaService.getIdPersonaSesionActual()).area
                return Persona.findAll("from Persona where (INSTR(nombre,?)>0 or INSTR(apellido,?)>0 or INSTR(dni,?)>0 or INSTR(fechaAlta,?)>0)) and area_id = ?",[query,query,query,query,areaUser],[max: max, offset: offset.toInteger()])
            }
        }
    }

    def ordenarLista(ArrayList list, String sortBy, String order){
        return list.sort{
            a, b -> 
                if (order == 'desc') {
                    b."${sortBy}" <=> a."${sortBy}"
                } else {
                    a."${sortBy}" <=> b."${sortBy}"
                }
        }
    }

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

	long getIdPersonaSesionActual(){
        return PersonaUser.findByUserId(userService.idUserSesionActual()).personaId
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
            notFound()
            return
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
