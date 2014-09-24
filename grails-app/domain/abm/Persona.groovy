package abm

class Persona {
	
	String nombre

	String apellido

	Integer dni

	Date fechaAlta=new Date()

	Date fechaBaja=new Date()
	
	static belongsTo= [area:Area]

    static constraints = {
    }
}
