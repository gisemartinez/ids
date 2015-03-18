package abm

import java.util.Date;

class Persona {
	
	String nombre

	String apellido

	Integer dni

	Date fechaAlta=new Date()

	Date fechaBaja=new Date('2999/12/31')
	//metodo de clase que se llama igual que Persona.list
	//Si se le da el id del rol que se necesita, filtra por esa categoría
	static ArrayList filtrarPersonasPorRol(idRol){
	      def rol=idRol
	      def listaUsuarios = com.testapp.UserRole.findAll("from UserRole where role_id=?",[rol]).userId
	      def listaPersonas = abm.PersonaUser.findAllByUserId(listaUsuarios).personaId
	      return Persona.findAllById(listaPersonas)
	}
	//este método debéría ir en la clase PersonaUser o en User
	static com.testapp.User getUserDePersona(personaInstance){
		def persona_user = PersonaUser.findByPersonaId(personaInstance.id)
		return com.testapp.User.findById(persona_user.userId)
	}
	static long getIdPersonaSesionActual(idUserSesionActual){
        return  PersonaUser.findByUserId( idUserSesionActual ).personaId
    }
    //este método debéría ir en la clase UserRole o Role
	static com.testapp.Role getRolDePersona(personaInstance){
		def user = Persona.getUser(personaInstance)
		def role_id = com.testapp.UserRole.findByUser(user).roleId
		return com.testapp.Role.findById(role_id)
	}
	static belongsTo= [area:Area]

    static constraints = {
    }
    String toString(){
		nombre
	}
}
