package abm

import java.util.Date;

class Ubicacion {
	String nombreubica

	   //Fecha del alta de la ubicacion
       Date fechaAlta=new Date()
       //Fecha de baja de la ubicacion-por default: 31/12/2999
       Date fechaBaja=new Date('2999/12/31')
	
	static constraints = {
	}
	
	String toString(){
		nombreubica
	}
}