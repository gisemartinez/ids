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
	static ArrayList filtrarPorRol(idRol){
	      def rol=idRol
	      def listaUsuarios = com.testapp.UserRole.findAll("from UserRole where role_id=?",[rol]).userId
	      def listaPersonas = abm.PersonaUser.findAllByUserId(listaUsuarios).personaId
	      return Persona.findAllById(listaPersonas)
	}
	static com.testapp.User getUser(personaInstance){
		def persona_user = PersonaUser.findByPersonaId(personaInstance.id)
		return com.testapp.User.findById(persona_user.userId)
	}
	static com.testapp.Role getRol(personaInstance){
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
