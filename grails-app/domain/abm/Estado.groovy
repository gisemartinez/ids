package abm

import java.util.Date;

class Estado {

	String nombre
	
	//Fecha del alta del estado
    Date fechaAlta=new Date()
    //Fecha de baja del estado-por default: 31/12/2999
    Date fechaBaja=new Date('2999/12/31')

    
	static constraints = {
	}
	
	String toString(){
		nombre
	}
}
