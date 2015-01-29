package abm

class Persona {
	
	String nombre

	String apellido

	Integer dni

	Date fechaAlta=new Date()

	Date fechaBaja=new Date()
	//metodo de clase que se llama igual que Persona.list
	//Si se le da el id del rol que se necesita, filtra por esa categoría
	static ArrayList filtrarPorRol(idRol){
	      def rol=idRol
	      def listaUsuarios = com.testapp.UserRole.findAll("from UserRole where role_id=?",[rol]).userId
	      def listaPersonas = abm.PersonaUser.findAllByUserId(listaUsuarios).personaId
	      return Persona.findAllById(listaPersonas)
	}

	
	static belongsTo= [area:Area]

    static constraints = {
    }
    String toString(){
		nombre
	}
}
