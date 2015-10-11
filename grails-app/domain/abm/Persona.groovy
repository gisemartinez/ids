package abm

import java.util.Date;

class Persona {
	
	String nombre
	String apellido
	Integer dni
	Date fechaAlta = new Date()
	Date fechaBaja = new Date('2999/12/31')
	static belongsTo = [area:Area]
	byte[] filePayload
	String fileType  //Optional
	String fileName //Optional

	static constraints = {
		filePayload(nullable:true, maxSize:1073741824) // max of 4GB file for example
		fileType(blank:true, nullable:true)
		fileName(blank:true, nullable:true)
	}

	String toString(){
		nombre
	}

}
