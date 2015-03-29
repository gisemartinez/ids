package abm

import java.util.Date;

class Persona {
	
	String nombre

	String apellido

	Integer dni

	Date fechaAlta=new Date()

	Date fechaBaja=new Date('2999/12/31')
	
	static belongsTo= [area:Area]

    static constraints = {
    }
    String toString(){
		nombre
	}
}
